package com.echo.jcps.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.echo.jcps.entity.Fee;
import com.echo.jcps.entity.PageBean;
import com.echo.jcps.entity.User;
import com.echo.jcps.service.FeeService;
import com.echo.jcps.service.UserService;

/**
 * Fee实体的web层业务
 */
@Controller
@RequestMapping("/fee")
public class FeeController {

	// 注入service层
	@Autowired
	private FeeService feeService;
	
	// 注入service层
	@Autowired
	private UserService userService;
	
	
	/**
	 * 查询已支付费用信息
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/queryPayFees",method = RequestMethod.GET)
	public String queryPayFees(Integer uId,Model model,Integer currPage){
		User user = userService.queryById(uId);
		List<Fee> fList= feeService.queryAllFees();
		List<Fee> PFList = new ArrayList<Fee>();
		List<Fee> ANFList = new ArrayList<Fee>();
		for (Fee fee : fList) {
			// 选择完成支付的费用列表
			if(fee.isState()&&(fee.getWriterId() == uId || fee.getReaderId() == uId)){
				PFList.add(fee);
			}
			if(fee.isState()){
				ANFList.add(fee);
			}
		}
		PageBean<Fee> fPageBean = feePageBean(PFList, currPage);
		PageBean<Fee> APFPageBean = feePageBean(ANFList, currPage);
		if(user.getType().equals("作者")){
			model.addAttribute("fPageBean", fPageBean);
			model.addAttribute("user", user);
			return "WPage/wPFList";
		}else if(user.getType().equals("专家")){
			model.addAttribute("fPageBean", fPageBean);
			model.addAttribute("user", user);
			return "RPage/rPFList";
		}
		model.addAttribute("fPageBean", APFPageBean);
		model.addAttribute("user", user);
		return "EPage/PFList";
	}
	
	/**
	 * 查询未支付费用信息
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/queryNoPayFees",method = RequestMethod.GET)
	public String queryNoPayFees(Integer uId,Model model,Integer currPage){
		User user = userService.queryById(uId);
		List<Fee> fList= feeService.queryAllFees();
		List<Fee> NFList = new ArrayList<Fee>();
		List<Fee> ANFList = new ArrayList<Fee>();
		for (Fee fee : fList) {
			// 选择未完成支付的费用列表
			if(!fee.isState() && (fee.getWriterId() == uId || fee.getReaderId() == uId)){
				NFList.add(fee);
			}
			if(!fee.isState()){
				ANFList.add(fee);
			}
		}
		PageBean<Fee> fPageBean = feePageBean(NFList, currPage);
		PageBean<Fee> ANFPageBean = feePageBean(ANFList, currPage);
		if(user.getType().equals("作者")){
			model.addAttribute("fPageBean", fPageBean);
			model.addAttribute("user", user);
			return "WPage/wNFList";
		}else if(user.getType().equals("专家")){
			model.addAttribute("fPageBean", fPageBean);
			model.addAttribute("user", user);
			return "RPage/rNFList";
		}
		model.addAttribute("fPageBean", ANFPageBean);
		model.addAttribute("user", user);
		return "EPage/NFList";
	}
	
	/**
	 * 添加费用信息
	 * @param fee
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/insertFees",method = RequestMethod.POST)
	public String insertFees(Fee fee,Model model){
		if(feeService.insertFees(fee) != 0){
			System.out.println("添加费用信息成功。");
			return "success";
		}
		return "error";
	}
	
	/**
	 * 根据用户ID查询费用信息
	 * @param model
	 * @param uId
	 * @return
	 */
	@RequestMapping(value = "/queryFeesByUserId",method = RequestMethod.GET)
	public String queryFeesByUserId(Model model,Integer uId){
		
		return "error";
	}
	
	/**
	 * 根据期刊ID查询费用信息
	 * @param model
	 * @param uId
	 * @return
	 */
	@RequestMapping(value = "/queryFeesByJournalId",method = RequestMethod.GET)
	public String queryFeesByJournalId(Model model,Integer jId,Integer uId){
		Fee fee = feeService.queryFeesByJournalId(jId);
		User user = userService.queryById(uId);
		if(fee != null){
			model.addAttribute("fee", fee);
			model.addAttribute("user", user);
			return "WPage/feeDetail";
		}
		return "error";
	}
	
	/**
	 * 根据ID查询费用信息
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/queryFeesById",method = RequestMethod.GET)
	public String queryFeesById(Model model,Integer id){
		Fee fee = feeService.queryFeesById(id);
		if (fee != null){
			model.addAttribute("fee",fee);
			return "WPage/";
		}
		return "error";
	}
	
	/**
	 * 根据ID删除对应费用信息
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteFeesById",method = RequestMethod.GET)
	public String deleteFeesById(Model model,Integer id){
		if(feeService.deleteFeesById(id) != 0){
			System.out.println("删除信息成功。");
			return "success";
		}
		return "error";
	}
	
	/**
	 * 根据ID更新对应费用信息
	 * @param model
	 * @param fee
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/updateFeesById",method = RequestMethod.POST)
	public String updateFeesById(Model model,Fee fee,Integer id){
		if(feeService.updateFeesById(id,fee) != 0){
			return "success";
		}
		return "error";
	}
	
	/**
	 * 作者更新费用支付状态
	 * @param fId
	 * @param model
	 * @param uId
	 * @return
	 */
	@RequestMapping(value = "/updateFeesState",method = RequestMethod.GET)
	public String updateFeesState(Integer fId,Model model,Integer uId,Integer currPage){
		model.addAttribute("user", userService.queryById(uId));
		boolean state = true;
		feeService.updateFeesState(fId,state);
		List<Fee> fList = feeService.queryAllFees();
		List<Fee> NFList = new ArrayList<Fee>();
		for (Fee fee : fList) {
			if(fee.getWriterId()==uId&&!fee.isState()){
				NFList.add(fee);
			}
		}
		PageBean<Fee> fPageBean = feePageBean(NFList, currPage);
		model.addAttribute("fPageBean", fPageBean);
		return "WPage/wNFList";
	}
	
	/**
	 * 用于编辑查看用户的费用信息
	 * @param model
	 * @param id
	 * @param currPage
	 * @return
	 */
	@RequestMapping(value = "/RAWFeesDetailById",method = RequestMethod.GET)
	public  String RAWFeesDetailById(Model model,Integer uId,Integer mId,Integer currPage) {
		List<Fee> fList = feeService.queryFeesByUserId(mId);
		PageBean<Fee> fPageBean = feePageBean(fList, currPage);
		model.addAttribute("User", userService.queryById(uId));
		model.addAttribute("user", userService.queryById(mId));
		model.addAttribute("fPageBean", fPageBean);
		return "EPage/RAWFList";
	}
	
	/**
	 * 根据请求页数得到对应费用信息pageBean
	 * @param listU
	 * @param currPage
	 * @return
	 */
	public PageBean<Fee> feePageBean(List<Fee> listF,int currPage) {
		PageBean<Fee> fPageBean = new PageBean<Fee>();
		// 当前页
		fPageBean.setCurrPage(currPage);
		// 每页用户的数量
		fPageBean.setPageSize(6);
		// 总数目
		fPageBean.setTotalCount(listF.size());
		// 总页数
		int pageSum = 0;
		if(listF.size()%6 == 0) {
			pageSum = listF.size()/6;
		}else {
			pageSum = listF.size()/6 +1;
		}
		fPageBean.setTotalPage(pageSum);
		// 每页的用户数据
		List<Fee> listP = new ArrayList<Fee>();
		if (currPage < pageSum) {
			for (int i = 6*(currPage-1); i < 6*currPage; i++) {
				listP.add(listF.get(i));
			}
		}else{
			for (int i = 6*(currPage-1); i < listF.size(); i++) {
				listP.add(listF.get(i));
			}
		}
		fPageBean.setList(listP);
		return fPageBean;
	}
	
}
