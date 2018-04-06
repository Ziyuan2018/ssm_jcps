 package com.echo.jcps.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.echo.jcps.dao.UserDao;
import com.echo.jcps.entity.User;
import com.echo.jcps.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	
	// 注入DAO层数据
	@Autowired
	private UserDao UserDao;

	/**
	 * 验证登陆信息
	 */
	@Override
	public User loginCheckInfo(String type, String username, String password) {
		User user = UserDao.loginCheck(type, username, password);
		if(null == user){
			return null;
		}
		return user;
	}

	/**
	 * 注册新用户
	 */
	@Override
	public int enroll(User user) {
		
		return UserDao.enroll(user);
	}

	/**
	 * 查找用户信息
	 */
	@Override
	public User queryById(Integer id) {
		User user = UserDao.queryById(id);
		return user;
	}

	/**
	 * 更新用户信息
	 */
	@Override
	public int updateById(int id,User user) {
		return UserDao.updateById(id,user);
	}

	/**
	 * 删除用户
	 */
	@Override
	public int deleteById(Integer id) {
		return UserDao.deleteById(id);
	}

	/**
	 * 检查用户名是否存在
	 */
	@Override
	public User checkUsername(String username) {
		return UserDao.checkUsername(username);
	}

	/**
	 * 更新用户账号密码
	 */
	@Override
	public int updateUPById(User user, Integer id) {
		return UserDao.updateUPById(user,id);
	}

	/**
	 * 忘记密码的业务处理
	 */
	@Override
	public User forgetPwd(User user) {
		return UserDao.forgetPwd(user);
	}

	/**
	 * 查询用户列表
	 */
	@Override
	public List<User> queryUserList() {
		return UserDao.queryUserList();
	}

}
