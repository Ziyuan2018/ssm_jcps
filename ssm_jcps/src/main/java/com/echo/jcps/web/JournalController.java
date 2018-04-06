package com.echo.jcps.web;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.echo.jcps.entity.Fee;
import com.echo.jcps.entity.Journal;
import com.echo.jcps.entity.PageBean;
import com.echo.jcps.entity.User;
import com.echo.jcps.service.FeeService;
import com.echo.jcps.service.JournalService;
import com.echo.jcps.service.UserService;

@Controller
@RequestMapping("/journal")
public class JournalController {

	// 注入Service层操作接口
	@Autowired
	private JournalService journalService;
	// 注入用户Service接口
	@Autowired
	private UserService userService;
	// 注入费用Service接口
	@Autowired
	private FeeService feeService;

	/**
	 * 跳转到期刊上传界面
	 * @param model
	 * @param uId
	 * @return
	 */
	@RequestMapping(value = "/addJournal", method = RequestMethod.GET)
	public String jUpload(Model model,Integer uId) {
		String state = "";
		model.addAttribute("state", state);
		model.addAttribute("user", userService.queryById(uId));
		return "WPage/addJournal";
	}

	/**
	 * 上传期刊
	 * 
	 * @param request
	 * @param journal
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertJournal", method = RequestMethod.POST)
	public String insertJournal(Integer uId,Model model, HttpServletRequest request,
			Journal journal, @RequestParam("file") MultipartFile file)
			throws Exception {
		// 判断文件名是否重复
		if (cherkFilename(file.getOriginalFilename())) {
			// 如果文件不为空，写入上传路径
			if (!file.isEmpty()) {
				// 上传文件路径
				String path = request.getServletContext().getRealPath(
						"/WEB-INF/content");
				// 上传文件名
				String filename = file.getOriginalFilename();
				File filepath = new File(path, filename);
				// 判断路径是否存在，如果不存在就创建一个
				if (!filepath.getParentFile().exists()) {
					filepath.getParentFile().mkdirs();
				}
				// 将上传文件保存到一个目标文件当中
				file.transferTo(new File(path + File.separator + filename));
	
				// 将上传文件信息传给期刊对象
				journal.setCreateTime(new Date());
				journal.setWriterName(userService.queryById(journal.getWriterId())
						.getRealName());
				journal.setStatus("未审核");
				journal.setFileName(filename);
				journalService.insertJournal(journal);
				// 增加对应用户的费用期刊信息
				Fee fee = new Fee();
				fee.setJournalId(journalService.queryJournalByFileName(filename).getId());
				fee.setJournalName(journal.getName());
				fee.setWriterId(journal.getWriterId());
				fee.setWriterName(journal.getWriterName());
				// 在审核之前预付审核费，发表之前预付版本费
				fee.setVersionFee(1000);
				fee.setVettingFee(1000);
				fee.setTotal(2000);
				fee.setState(false);
				feeService.insertFees(fee);
				// 提示成功消息
				String state = "期刊上传成功。"; 
				model.addAttribute("state", state);
				model.addAttribute("user", userService.queryById(uId));
				return "WPage/addJournal";
			}
			String state = "请选择文件，且填写好期刊信息。"; 
			model.addAttribute("user", userService.queryById(uId));
			model.addAttribute("state", state);
			return "WPage/addJournal";
		}
		String state = "期刊文件名重复，请重新上传。"; 
		model.addAttribute("user", userService.queryById(uId));
		model.addAttribute("state", state);
		return "WPage/addJournal";
	}

	/**
	 * 用户名重复
	 * @param model
	 * @param uId
	 * @return
	 */
	public String updateJournal(Model model,Integer uId){
		String state = "期刊文件名重复，请重新上传。"; 
		model.addAttribute("user", userService.queryById(uId));
		model.addAttribute("state", state);
		return "WPage/updateJournal";
	}
	/**
	 * 检查文件名是否重复
	 * 
	 * @param fileName
	 * @return
	 */
	public boolean cherkFilename(String fileName) {
		if (journalService.checkFilename(fileName) == null) {
			return true;
		}
		return false;
	}

	/**
	 * 获取期刊
	 * 
	 * @param request
	 * @param filename
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/download")
	public ResponseEntity<byte[]> download(HttpServletRequest request,
			@RequestParam("filename") String filename, Model model)
			throws Exception {
		// 下载文件路径
		String path = request.getServletContext().getRealPath(
				"/WEB-INF/content");
		File file = new File(path + File.separator + filename);
		HttpHeaders headers = new HttpHeaders();
		// 下载显示的文件名，解决中文名称乱码问题
		String downloadFielName = new String(filename.getBytes("UTF-8"),
				"iso-8859-1");
		// 通知浏览器以attachment（下载方式）打开图片
		headers.setContentDispositionFormData("attachment", downloadFielName);
		// application/octet-stream ： 二进制流数据（最常见的文件下载）。
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
				headers, HttpStatus.CREATED);
	}

	/**
	 * 查询期刊列表
	 * 
	 * @param model
	 * @param curPage
	 * @param uId
	 * @param JState
	 * 1-未审核
	 * 2-已审核，已发表
	 * @return
	 */
	@RequestMapping(value = "/jList", method = RequestMethod.GET)
	public String queryAllJournal(Integer JState,Model model, Integer currPage, Integer uId) {
		// 获得对应用户
		User user = userService.queryById(uId);
		// 区分是否审核列表
		List<Journal> RJList = new ArrayList<Journal>();
		List<Journal> NJList = new ArrayList<Journal>();
		List<Journal> jList = journalService.queryAllJournalList();
		for (Journal journal : jList) {
			if(journal.getStatus().equals("未审核")){
				NJList.add(journal);
			}else{
				RJList.add(journal);
			}
		}
		if(JState == 1){
			PageBean<Journal> jPageBean = journalPageBean(NJList, currPage);
			model.addAttribute("jPageBean", jPageBean);
			model.addAttribute("user", user);
			if(user.getType().equals("专家")){
				return "RPage/rNJList";
			}
			return "EPage/NJList";
		}
		PageBean<Journal> jPageBean = journalPageBean(RJList, currPage);
		model.addAttribute("jPageBean", jPageBean);
		model.addAttribute("user", user);
		return "EPage/RJList";
	}
	
	/**
	 * 专家审核期刊
	 * @param uId
	 * @param jId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String reviewJournal(Integer uId,Integer jId,Model model){
		User user = userService.queryById(uId);
		Journal journal = journalService.queryJournalById(jId);
		model.addAttribute("user", user);
		model.addAttribute("journal", journal);
		return "RPage/reviewJournal";
	}
	
	/**
	 * 更新专家审核期刊信息
	 * @return
	 */
	@RequestMapping(value = "/updateJournal", method = RequestMethod.POST)
	public String updateJournal(Model model,Journal journal,Integer uId){
		journal.setCensorTime(new Date());
		System.out.println(journal.getId());
		journal.setStatus("已审核");
		journal.setReaderId(uId);
		journal.setReaderName(userService.queryById(uId).getRealName());
		journalService.updateJournal(journal);
		Fee fee = feeService.queryFeesByJournalId(journal.getId());
		System.out.println(fee.getId());
		System.out.println(fee.getJournalId());
		System.out.println(fee.getJournalName());
		fee.setReaderId(uId);
		fee.setReaderName(userService.queryById(uId).getRealName());
		feeService.updateFeesById(journal.getId(), fee);
		model.addAttribute("user", userService.queryById(uId));
		model.addAttribute("journal", journal);
		return "RPage/rPage";
	}
	
	/**
	 * 更新已审核的期刊为已发表
	 * @param currPage
	 * @param id
	 * @param num
	 * @param uId
	 * @return
	 */
	@RequestMapping(value = "/updateStatus", method = RequestMethod.GET)
	public String updateStatus(Model model,Integer currPage,Integer id,Integer uId){
		// 获得对应用户
		User user = userService.queryById(uId);
		if(journalService.updateStatus(id) != 0){
			List<Journal> RJList = new ArrayList<Journal>();
			List<Journal> jList = journalService.queryAllJournalList();
			for (Journal journal : jList) {
				if(!(journal.getStatus().equals("未审核"))){
					RJList.add(journal);
				}
			}
			PageBean<Journal> jPageBean = journalPageBean(RJList, currPage);
			model.addAttribute("jPageBean", jPageBean);
			model.addAttribute("user", user);
			return "EPage/RJList";
		}
		return "error";
	}
	
	/**
	 * 通过用户查找期刊列表
	 * @param uId
	 * @param model
	 * @param currPage
	 * @param mark
	 * 0-专家；1-作者（未审核）；2-作者（已审核）;3-编辑
	 * @return
	 */
	@RequestMapping(value = "/queryJournalListByUid", method = RequestMethod.GET)
	public String reviewLog(Integer mark,Integer uId,Model model,Integer currPage){
		User user = userService.queryById(uId);
		List<Journal> jList = journalService.queryJournalByUid(uId);
		if(user.getType().equals("作者")){
			List<Journal> rjList = new ArrayList<Journal>(); 
			List<Journal> njList = new ArrayList<Journal>(); 
			for (Journal journal : jList) {
				if(journal.getStatus().equals("未审核")){
					njList.add(journal);
				}else{
					rjList.add(journal);
				}
			}
			PageBean<Journal> rjPageBean = journalPageBean(rjList, currPage);
			PageBean<Journal> jPageBean = journalPageBean(jList, currPage);
			PageBean<Journal> njPageBean = journalPageBean(njList, currPage);
			model.addAttribute("user", user);
			if(mark==3){
				model.addAttribute("jPageBean", jPageBean);
				return "EPage/WJList";
			}
			if(mark==1){
				model.addAttribute("jPageBean", njPageBean);
				return "WPage/wNJList";
			}
			model.addAttribute("jPageBean", rjPageBean);
			return "WPage/wRJList";
		}
		PageBean<Journal> jPageBean = journalPageBean(jList, currPage);
		model.addAttribute("user", user);
		model.addAttribute("jPageBean", jPageBean);
		if(mark==3){
			return "EPage/rRJList";
		}
		return "RPage/reviewLog";
	}
	
	
	
	/**
	 * 根据ID删除对应的期刊信息
	 * @param model
	 * @param currPage
	 * @param mId
	 * @param num
	 * @param uId
	 * @param JState
	 * 1-未审核
	 * 2-已审核，已发表
	 * @return
	 */
	@RequestMapping(value = "/deleteJournalById", method = RequestMethod.GET)
	public String deleteJournalById(Integer info,Model model,Integer currPage,Integer id,Integer num,Integer uId){
		User user = userService.queryById(uId);
		if(journalService.deleteJournalById(id) != 0){
			List<Journal> listJ = journalService.queryAllJournalList();
			List<Journal> rJList =new ArrayList<Journal>(); 
			List<Journal> nJList =new ArrayList<Journal>();
			for (Journal journal : listJ) {
				if(journal.getStatus().equals("未审核")){
					nJList.add(journal);
				}else{
					rJList.add(journal);
				}
			}
			if(num == 1 && currPage != 1){
				if(info == 1){
					PageBean<Journal> JPageBean = journalPageBean(nJList,currPage-1);
					model.addAttribute("jPageBean", JPageBean);
					model.addAttribute("user", user);
					return "EPage/NJList";
				}else{
					PageBean<Journal> JPageBean = journalPageBean(rJList,currPage-1);
					model.addAttribute("jPageBean", JPageBean);
					model.addAttribute("user", user);
					return "EPage/RJList";
				}
			}
			if(info == 1){
				PageBean<Journal> JPageBean = journalPageBean(nJList,currPage);
				model.addAttribute("jPageBean", JPageBean);
				model.addAttribute("user", user);
				return "EPage/NJList";
			}else{
				PageBean<Journal> JPageBean = journalPageBean(rJList,currPage);
				model.addAttribute("jPageBean", JPageBean);
				model.addAttribute("user", user);
				return "EPage/RJList";
			}
		}
		return "error";
	}

	/**
	 * 根据请求页数得到期刊pageBean
	 * 
	 * @param listJ
	 * @param currPage
	 * @return
	 */
	public PageBean<Journal> journalPageBean(List<Journal> listJ, int currPage) {
		PageBean<Journal> jPageBean = new PageBean<Journal>();
		// 当前页
		jPageBean.setCurrPage(currPage);
		// 每页用户的数量
		jPageBean.setPageSize(6);
		// 总数目
		jPageBean.setTotalCount(listJ.size());
		// 总页数
		int pageSum = 0;
		if (listJ.size() % 6 == 0) {
			pageSum = listJ.size() / 6;
		} else {
			pageSum = listJ.size() / 6 + 1;
		}
		jPageBean.setTotalPage(pageSum);
		// 每页的用户数据
		List<Journal> listP = new ArrayList<Journal>();
		if (currPage < pageSum) {
			for (int i = 6 * (currPage - 1); i < 6 * currPage; i++) {
				listP.add(listJ.get(i));
			}
		} else {
			for (int i = 6 * (currPage - 1); i < listJ.size(); i++) {
				listP.add(listJ.get(i));
			}
		}
		jPageBean.setList(listP);
		return jPageBean;
	}
}
