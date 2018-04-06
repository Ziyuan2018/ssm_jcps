package com.echo.jcps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.echo.jcps.dao.MessageDao;
import com.echo.jcps.entity.Message;
import com.echo.jcps.service.MessageService;
@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	// 注入DAO层
	private MessageDao messageDao;

	/**
	 * 保存发送的消息信息
	 */
	@Override
	public int insertMessage(Message message) {
		return messageDao.insertMessage(message);
	}

	/**
	 * 查找所有发送过的消息
	 */
	@Override
	public List<Message> querySendMessageById(Integer id) {
		return messageDao.querySendMessageById(id);
	}

	/**
	 * 查找所有收到得到消息
	 */
	@Override
	public List<Message> queryReceiveMessageById(Integer id) {
		return messageDao.queryReceiveMessageById(id);
	}

	/**
	 * 查找所有消息
	 */
	@Override
	public List<Message> queryAllMessage() {
		return messageDao.queryAllMessage();
	}

	/**
	 * 删除对应ID的消息
	 */
	@Override
	public int deleteMessageById(Integer id) {
		return messageDao.deleteMessageById(id);
	}

	/**
	 * 更新消息的已读标记
	 */
	@Override
	public int updateMessageMarkById(Integer mId) {
		return messageDao.updateMessageMarkById(mId);
	}

}
