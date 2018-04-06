package com.echo.jcps.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.echo.jcps.dto.Result;
import com.echo.jcps.entity.PageBean;
import com.echo.jcps.entity.User;
import com.echo.jcps.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	// 注入Service层数据
	@Autowired
	private UserService userService;

	/**
	 * 页面跳转
	 * @param uId
	 * @param add
	 * 位置：1-跳到首页；2-跳到登陆页
	 * @return
	 */
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public String pageChange(Model model,Integer uId,Integer add){
		if(add == 2){
			return "forward:../";
		}
		User user = userService.queryById(uId);
		model.addAttribute("user", user);
		if(user.getType().equals("作者")){
			return "WPage/wPage";
		}else if(user.getType().equals("专家")){
			return "RPage/rPage";
		}
		return "EPage/ePage";
	}
	
	/**
	 * 用于编辑关于系统页面的跳转
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/aboutSystem", method = RequestMethod.GET)
	public String aboutSystem(Model model,Integer id){
		if(userService.queryById(id).getType().equals("专家")) {
			model.addAttribute("user", userService.queryById(id));
			return "RPage/aboutSystem";
		}else if(userService.queryById(id).getType().equals("作者")) {
			model.addAttribute("user", userService.queryById(id));
			return "WPage/aboutSystem";
		}
		model.addAttribute("user", userService.queryById(id));
		return "EPage/aboutSystem";
	}
	
	/**
	 * Ajax数据测试
	 * @param type
	 * @param username
	 * @param password
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/info",method = RequestMethod.POST,
			produces = {"application/json; charset=utf-8" })
	@ResponseBody
	public Result<User> ajax(String type, String username, String password,Model model){
		User user = userService.loginCheckInfo(type, username, password);
		if(user != null){
			return new Result<User>(true,user);
		}
		return new Result<User>(false,"访问失败");
	}
	
	/**
	 * 登录信息认证
	 * @param type
	 * @param username
	 * @param password
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String login(HttpServletRequest request,String type, String username, String password,Model model) {
		User user = userService.loginCheckInfo(type, username, password);
		if(user != null) {
			model.addAttribute("user",user);
			switch(user.getType()) {
				case "编辑" : 
					return "EPage/ePage";	
					
				case "专家":
					return "RPage/rPage";

				case "作者":
					return "WPage/wPage";
	
				default:
					return "error";
			}
		}
		if(checkUsername(username)){
			String userState = "密码错误或者类别有误";
			model.addAttribute("userState", userState);
			return "forward:../";
		}
		String pwdState = "账号不存在";
		model.addAttribute("pwdState", pwdState);
		return "forward:../";
	}

	/**
	 * 检查用户名是否存在
	 * @param username
	 * @return
	 */
	public boolean checkUsername(String username){
		if(userService.checkUsername(username) != null){
			return true;
		}
		return false;
	}
	
	/**
	 * 信息注册
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/enroll",method = RequestMethod.POST)
	public String enroll(User user,Model model){
		String state = null;
		if(userService.checkUsername(user.getUsername()) != null){
			state = "用户名存在，请重试。";
			model.addAttribute("state", state);
			return "forward:../";
		}else if(userService.enroll(user) != 0){
			state = "注册成功，请登陆。";
			model.addAttribute("state", state);
			return "forward:../";
		}
		state = "服务器异常，注册失败请重试。";
		model.addAttribute("state", state);
		return "forward:../";
	}
	
	/**
	 * 更新用户的账号密码
	 * @param id
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/updateUP",method = RequestMethod.POST)
	public String updateUPById(Integer id,User user,Model model){
		if(userService.updateUPById(user,id) != 0){
			return "forward:../";
		}
		return "error";
	}
	
	/**
	 * 更新用户信息
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateById(Integer id,User user,Model model){
		if(userService.updateById(id,user) != 0) {
			user = userService.queryById(id);
			model.addAttribute("user", user);
			return "EPage/ePage";
		}
		return "error";
	}

	/**
	 * 根据ID删除用户
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete",method = RequestMethod.GET)
	public String deleteById(Integer num,Integer currPage, Integer id,Model model){
		User dUser =userService.queryById(id);
		List<User> listR = new ArrayList<User>();
		List<User> listW = new ArrayList<User>();
		if(userService.deleteById(id) != 0){
			List<User> listU = userService.queryUserList();
			// 用户分类
			for (User user : listU) {
				if(user.getType().equals("作者")){
					listW.add(user);
				}
				if(user.getType().equals("专家")){
					listR.add(user);
				}
			}
			// 返回专家列表
			if(dUser.getType().equals("专家")){
				if(num == 1){
					PageBean<User> rPageBean = userPageBean(listR,currPage-1);
					model.addAttribute("rPageBean", rPageBean);
					return "EPage/rList";
				}
				PageBean<User> rPageBean = userPageBean(listR,currPage);
				model.addAttribute("rPageBean", rPageBean);
				return "EPage/rList";
			}
			// 返回用户列表
			if(dUser.getType().equals("作者")){
				if(num == 1){
					PageBean<User> wPageBean = userPageBean(listR,currPage-1);
					model.addAttribute("wPageBean", wPageBean);
					return "EPage/wList";
				}
				PageBean<User> wPageBean = userPageBean(listW,currPage);
				model.addAttribute("wPageBean", wPageBean);
				return "EPage/wList";
			}
		}
		return "error";
	}
	
	/**
	 * 忘记密码的业务操作
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/forgetPwd",method = RequestMethod.POST/*,
			produces = {"application/json; charset=utf-8" }*/)
	/*@ResponseBody*/
	public String forgetPwd(User user,Model model){
		user = userService.forgetPwd(user);
		if (user != null){
			model.addAttribute("user",user);
			switch(user.getType()) {
				case "编辑" : 
					return "EPage/ePage";	
					
				case "专家":
					return "RPage/RList";

				case "作者":
					return "WPage/WList";
	
				default:
					return "error";
			}
		}
		String state = "验证失败，请联系管理员。";
		model.addAttribute("state", state);
		return "forward:../";
	}
	
	/**
	 * 查询用户列表(分类)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/queryUser",method = RequestMethod.GET)
	public String queryUserList(Integer uId,Model model,String type,Integer currPage){
		List<User> listU = userService.queryUserList();
		List<User> listR = new ArrayList<User>();
		List<User> listW = new ArrayList<User>();
		if(listU.size() != 0){
			// 用户分类
			for (User user : listU) {
				if(user.getType().equals("作者")){
					listW.add(user);
				}
				if(user.getType().equals("专家")){
					listR.add(user);
				}
			}
			// 返回专家列表
			if(type.equals("专家")){
				PageBean<User> rPageBean = userPageBean(listR,currPage);
				model.addAttribute("rPageBean", rPageBean);
				model.addAttribute("User", userService.queryById(uId));
				return "EPage/rList";
			}
			// 返回用户列表
			if(type.equals("作者")){
				PageBean<User> wPageBean = userPageBean(listW,currPage);
				model.addAttribute("wPageBean", wPageBean);
				model.addAttribute("User", userService.queryById(uId));
				return "EPage/wList";
			}	
		}
		return "error";
	}
	
	/**
	 * 用于专家和作者相互联系的信息列表
	 * @param uId
	 * @param model
	 * @param currPage
	 * @return
	 */
	@RequestMapping(value="/queryAllUser",method = RequestMethod.GET)
	public String queryAllUser(Integer uId,Model model,Integer currPage){
		User user = userService.queryById(uId);
		List<User> uList = userService.queryUserList();
		PageBean<User> uPageBean = userPageBean(uList,currPage);
		model.addAttribute("uPageBean", uPageBean);
		model.addAttribute("user", user);
		if(user.getType().equals("专家")){
			return "RPage/uList";
		}else if(user.getType().equals("编辑")){
			return "EPage/uList";
		}
		return "WPage/uList";
	}
	
	/**
	 * 根据请求页数得到用户pageBean
	 * @param listU
	 * @param currPage
	 * @return
	 */
	public PageBean<User> userPageBean(List<User> listU,int currPage) {
		PageBean<User> uPageBean = new PageBean<User>();
		// 当前页
		uPageBean.setCurrPage(currPage);
		// 每页用户的数量
		uPageBean.setPageSize(6);
		// 总数目
		uPageBean.setTotalCount(listU.size());
		// 总页数
		int pageSum = 0;
		if(listU.size()%6 == 0) {
			pageSum = listU.size()/6;
		}else {
			pageSum = listU.size()/6 +1;
		}
		uPageBean.setTotalPage(pageSum);
		// 每页的用户数据
		List<User> listP = new ArrayList<User>();
		if (currPage < pageSum) {
			for (int i = 6*(currPage-1); i < 6*currPage; i++) {
				listP.add(listU.get(i));
			}
		}else{
			for (int i = 6*(currPage-1); i < listU.size(); i++) {
				listP.add(listU.get(i));
			}
		}
		uPageBean.setList(listP);
		return uPageBean;
	}

}
