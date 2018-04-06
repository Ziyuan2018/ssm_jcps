package com.echo.jcps.entity;

import java.util.Date;

/**
 * 用户之间沟通的消息实体
 */
public class Message {

	// 消息ID
	private int id;
	// 发件人
	private String addresser;
	// 发件人姓名
	private String sName;
	// 收件人
	private String addressee;
	// 收件人姓名
	private String rName;
	// 发件时间
	private Date createTime;
	// 消息内容
	private String content;
	// 阅读标记
	private String mark;
	
	public Message(){
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddresser() {
		return addresser;
	}

	public void setAddresser(String addresser) {
		this.addresser = addresser;
	}

	public String getAddressee() {
		return addressee;
	}

	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}
	
	
}
