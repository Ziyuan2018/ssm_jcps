package com.echo.jcps.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.echo.jcps.entity.User;

/**
 * User实体同数据库操作的接口
 */
public interface UserDao {

	/**
	 * 通过选择的登录类型，判断用户民密码
	 * @param type
	 * @param username
	 * @param password
	 * @return
	 */
	User loginCheck(@Param("type")String type,
			@Param("username")String username, @Param("password")String password);
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	int enroll(@Param("user")User user);
	
	/**
	 * 查找用户信息
	 * @param id
	 * @return
	 */
	User queryById(@Param("id")Integer id);
	
	/**
	 * 更新用户信息
	 * @param id
	 * @param user
	 * @return
	 */
	int updateById(@Param("id")int id,@Param("user")User user);
	
	/**
	 * 删除用户信息
	 * @param id
	 * @return
	 */
	int deleteById(@Param("id")Integer id);
	
	/**
	 * 检查用户名是否存在
	 * @param username
	 * @return
	 */
	User checkUsername(@Param("username")String username);
	
	/**
	 * 更新用户账号密码
	 * @param user
	 * @param id
	 * @return
	 */
	int updateUPById(@Param("user")User user, @Param("id")Integer id);
	
	/**
	 * 忘记密码的业务处理
	 * @param user
	 * @return
	 */
	User forgetPwd(@Param("user")User user);
	
	/**
	 * 查询用户列表
	 * @return
	 */
	List<User> queryUserList();
}
