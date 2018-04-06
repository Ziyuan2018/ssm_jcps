package com.echo.jcps.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.echo.jcps.entity.Message;
import com.echo.jcps.entity.PageBean;
import com.echo.jcps.entity.User;
import com.echo.jcps.service.MessageService;
import com.echo.jcps.service.UserService;

/**
 * 消息实体的web层业务
 */
@Controller
@RequestMapping("/message")
public class MessageController {

	@Autowired
	// 注入Service
	private MessageService messageService;	
	@Autowired
	// 注入Service
	private UserService userService;
	
	/**
	 * 添加消息信息
	 * @param message 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/insertM",method = RequestMethod.POST)
	public String insertMessage(Integer uId,Message message,Model model){
		User user = userService.queryById(uId);
		message.setMark("未读");
		message.setCreateTime(new Date());
		if(messageService.insertMessage(message) != 0){
			model.addAttribute("user", user);
			if(user.getType().equals("专家")){
				return "RPage/rPage";
			}else if(user.getType().equals("作者")){
				return "WPage/wPage";
			}
			return "EPage/ePage";
		}
		return "error";
	}
	
	/**
	 * 回复消息界面跳转
	 * @param model
	 * @param uId
	 * @param addressee
	 * @param state:判断页面来源是发件列表还是收件列表
	 * 1-发件列表；2-收件列表
	 * @return
	 */
	@RequestMapping(value = "/answerM",method = RequestMethod.GET)
	public String answerMessage(Model model,Integer uId,Integer mId,Integer id){
		// 点击回复自动将未读消息标记为已读
		messageService.updateMessageMarkById(id);
		model.addAttribute("user", userService.queryById(uId));
		model.addAttribute("rUser", userService.queryById(mId));
		model.addAttribute("addresser", uId);
		model.addAttribute("addressee", mId);
		if(userService.queryById(uId).getType().equals("作者")){
			return "WPage/addMessage";
		}else if(userService.queryById(uId).getType().equals("专家")){
			return "RPage/addMessage";
		}
		return "EPage/addMessage";
	}
	
	/**
	 * 通过用户ID查找发送的所有消息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/querySM",method = RequestMethod.GET)
	public String querySendMessageById(Integer currPage,Integer uId,Model model){
		List<Message> listSM = new ArrayList<Message>();
		listSM = messageService.querySendMessageById(uId);
		User user = userService.queryById(uId);
		// 得到分页数据
		PageBean<Message> mPageBean = messagePageBean(listSM,currPage);
		model.addAttribute("user", user);
		if(user.getType().equals("作者")){
			model.addAttribute("wSMPageBean", mPageBean);
			return "WPage/wSMList";
		}
		if(user.getType().equals("专家")){
			model.addAttribute("rSMPageBean", mPageBean);
			return "RPage/rSMList";
		}
		model.addAttribute("SMPageBean", mPageBean);
		return "EPage/SMList";
	}
	
	/**
	 * 通过用户ID查找所有收到的消息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/queryRM",method = RequestMethod.GET)
	public String queryReceiveMessageById(Integer currPage,Integer uId,Model model){
		List<Message> listRM = new ArrayList<Message>();
		User user = userService.queryById(uId);
		listRM = messageService.queryReceiveMessageById(uId);
		// 得到分页数据
		PageBean<Message> mPageBean = messagePageBean(listRM,currPage);
		model.addAttribute("user", user);
		if(user.getType().equals("作者")){
			model.addAttribute("wRMPageBean", mPageBean);
			return "WPage/wRMList";
		}
		if(user.getType().equals("专家")){
			model.addAttribute("rRMPageBean", mPageBean);
			return "RPage/rRMList";
		}
		model.addAttribute("RMPageBean", mPageBean);
		return "EPage/RMList";
	}
	
	/**
	 * 查找所有消息
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/queryAM",method = RequestMethod.GET)
	public String queryAllMessage(Model model,Integer id,Integer currPage){
		List<Message> listM = new ArrayList<Message>();
		User user = userService.queryById(id);
		// 测试数据
		listM = messageService.queryAllMessage();
		if(listM.size()!=0){
			// 得到分页数据
			PageBean<Message> AMPageBean = messagePageBean(listM,currPage);
			model.addAttribute("AMPageBean", AMPageBean);
			model.addAttribute("user", user);
			return "EPage/AMList";
		}
		return "EPage/AMList";
	}
	
	/**
	 * 根据ID删除对应消息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/deleteAM",method = RequestMethod.GET )
	public String deleteMessageById(Model model,Integer currPage,Integer mId,Integer num,Integer uId){
		User user = userService.queryById(uId);
		if(messageService.deleteMessageById(mId) != 0){
			List<Message> listM = messageService.queryAllMessage();
			if(num == 1 && currPage != 1){
				PageBean<Message> AMPageBean = messagePageBean(listM,currPage-1);
				model.addAttribute("AMPageBean", AMPageBean);
				model.addAttribute("user", user);
				return "EPage/AMList";
			}
			PageBean<Message> AMPageBean = messagePageBean(listM,currPage);
			model.addAttribute("AMPageBean", AMPageBean);
			model.addAttribute("user", user);
			return "EPage/AMList";
		}
		return "EPage/AMList";
	}

	/**
	 * 根据ID删除发送的消息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/deleteSM",method = RequestMethod.GET )
	public String deleteSendMessageById(Model model,Integer currPage,Integer mId,Integer num,Integer uId){
		User user = userService.queryById(uId);
		if(messageService.deleteMessageById(mId) != 0){
			List<Message> listM = messageService.querySendMessageById(uId);
			if(num == 1 && currPage != 1){
				PageBean<Message> SMPageBean = messagePageBean(listM,currPage-1);
				model.addAttribute("SMPageBean", SMPageBean);
				model.addAttribute("user", user);
				return "EPage/SMList";
			}
			PageBean<Message> SMPageBean = messagePageBean(listM,currPage);
			model.addAttribute("SMPageBean", SMPageBean);
			model.addAttribute("user", user);
			return "EPage/SMList";
		}
		return "error";
	}
	
	/**
	 * 根据ID删除收到的消息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/deleteRM",method = RequestMethod.GET )
	public String deleteReceiveMessageById(Model model,Integer currPage,Integer mId,Integer num,Integer uId){
		User user = userService.queryById(uId);
		if(messageService.deleteMessageById(mId) != 0){
			List<Message> listM = messageService.queryReceiveMessageById(uId);
			if(num == 1 && currPage != 1){
				PageBean<Message> RMPageBean = messagePageBean(listM,currPage-1);
				model.addAttribute("RMPageBean", RMPageBean);
				model.addAttribute("user", user);
				return "EPage/RMList";
			}
			PageBean<Message> RMPageBean = messagePageBean(listM,currPage);
			model.addAttribute("RMPageBean", RMPageBean);
			model.addAttribute("user", user);
			return "EPage/RMList";
		}
		return "error";
	}
	
	/**
	 * 更新消息的已读标记
	 * @param model
	 * @param currPage
	 * @param mId
	 * @param num
	 * @param uId
	 * @param state:判断标志
	 * 1-发送消息；2-接收消息 
	 * @return
	 */
	@RequestMapping(value="/updateMM",method = RequestMethod.GET )
	public String updateMessageMarkById(Integer state,Model model,Integer currPage,Integer mId,Integer uId){
		User user = userService.queryById(uId);
		if(messageService.updateMessageMarkById(mId) != 0){
			if(state == 1){
				List<Message> listM = messageService.querySendMessageById(uId);
				PageBean<Message> SMPageBean = messagePageBean(listM,currPage);
				model.addAttribute("SMPageBean", SMPageBean);
				model.addAttribute("user", user);
				return "EPage/SMList";
			}
			if(state == 2){
				List<Message> listM = messageService.queryReceiveMessageById(uId);
				PageBean<Message> RMPageBean = messagePageBean(listM,currPage);
				model.addAttribute("RMPageBean", RMPageBean);
				model.addAttribute("user", user);
				return "EPage/RMList";
			}
			
		}
		return "error";
	}
	
	/**
	 * 根据请求页数得到消息pageBean
	 * @param listM
	 * @param currPage
	 * @return
	 */
	public PageBean<Message> messagePageBean(List<Message> listM,int currPage) {
		PageBean<Message> mPageBean = new PageBean<Message>();
		// 当前页
		mPageBean.setCurrPage(currPage);
		// 每页用户的数量
		mPageBean.setPageSize(6);
		// 总数目
		mPageBean.setTotalCount(listM.size());
		// 总页数
		int pageSum = 0;
		if(listM.size()%6 == 0) {
			pageSum = listM.size()/6;
		}else {
			pageSum = listM.size()/6 +1;
		}
		mPageBean.setTotalPage(pageSum);
		// 每页的用户数据
		List<Message> listP = new ArrayList<Message>();
		if (currPage < pageSum) {
			for (int i = 6*(currPage-1); i < 6*currPage; i++) {
				listP.add(listM.get(i));
			}
		}else{
			for (int i = 6*(currPage-1); i < listM.size(); i++) {
				listP.add(listM.get(i));
			}
		}
		mPageBean.setList(listP);
		return mPageBean;
	}

}
