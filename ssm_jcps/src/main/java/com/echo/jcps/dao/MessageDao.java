package com.echo.jcps.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.echo.jcps.entity.Message;

/**
 * 消息实体与数据库操作的接口
 */
public interface MessageDao {

	/**
	 * 保存消息信息
	 * @param message
	 * @return
	 */
	int insertMessage(@Param("message")Message message);

	/**
	 * 查找所有发送的消息
	 * @param id
	 * @return
	 */
	List<Message> querySendMessageById(@Param("id")Integer id);
	
	/**
	 * 查找所有接收的消息
	 * @param id
	 * @return
	 */
	List<Message> queryReceiveMessageById(@Param("id")Integer id);

	/**
	 * 查找所有消息
	 * @return
	 */
	List<Message> queryAllMessage();

	/**
	 * 删除对应ID的消息
	 * @param id
	 * @return
	 */
	int deleteMessageById(@Param("id")Integer id);

	/**
	 * 更新消息的已读标记
	 * @param mId
	 * @return
	 */
	int updateMessageMarkById(@Param("id")Integer mId);



}
