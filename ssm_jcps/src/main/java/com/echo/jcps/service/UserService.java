package com.echo.jcps.service;

import java.util.List;

import com.echo.jcps.entity.User;


/**
 * 同User实体相关的业务操作的接口
 */
public interface UserService {

	/**
	 * 检查登录信息
	 * @param type
	 * @param username
	 * @param password
	 * @return
	 */
	User loginCheckInfo(String type,String username,String password);
	
	/**
	 * 注册新用户
	 * @param user
	 * @return
	 */
	int enroll(User user);

	/**
	 * 通过ID查找用户信息
	 * @param id
	 * @return
	 */
	User queryById(Integer id);

	/**
	 * 通过ID查找用户信息
	 * @param id
	 * @param user
	 * @return
	 */
	int updateById(int id,User user);

	/**
	 * 根据ID删除用户
	 * @param id
	 * @return
	 */
	int deleteById(Integer id);

	/**
	 * 检查用户名是否存在
	 */
	User checkUsername(String username);

	/**
	 * 更新用户账号密码
	 * @param user
	 * @param id
	 * @return
	 */
	int updateUPById(User user, Integer id);

	/**
	 * 忘记密码的业务处理
	 * @param user
	 * @return
	 */
	User forgetPwd(User user);

	/**
	 * 查询用户列表
	 * @return
	 */
	List<User> queryUserList();
}
