package com.echo.jcps.service;

import java.util.List;

import com.echo.jcps.entity.Message;

/**
 * 消息实体的Service层接口
 */
public interface MessageService {

	/**
	 * 保存消息信息
	 * @param message
	 * @return
	 */
	int insertMessage(Message message);

	/**
	 * 查找所有发送过的消息
	 * @param id
	 * @return
	 */
	List<Message> querySendMessageById(Integer id);

	/**
	 * 查找所有接收到的消息
	 * @param id
	 * @return
	 */
	List<Message> queryReceiveMessageById(Integer id);

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
	int deleteMessageById(Integer id);

	/**
	 * 更新消息的已读标记
	 * @param mId
	 * @return
	 */
	int updateMessageMarkById(Integer mId);



}
