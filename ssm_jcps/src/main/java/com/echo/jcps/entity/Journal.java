package com.echo.jcps.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 期刊文件实体
 */
@SuppressWarnings("serial")
public class Journal implements Serializable {
	
	// 期刊ID
	private int id;
	// 期刊所有者ID
	private int writerId;
	// 期刊所有者姓名
	private String writerName;
	// 期刊名称
	private String name;
	// 文件名称
	private String fileName;
	// 期刊关键字
	private String keyword;
	// 期刊审核情况
	private String status;
	// 专家评审意见
	private String proposal;
	// 期刊创建时间
	private Date createTime;
	// 期刊审核完成时间
	private Date censorTime;
	// 期刊对应的文件
	/*private MultipartFile file;*/
	// 期刊对应的审阅专家ID
	private int readerId;
	// 期刊对应的审阅专家
	private String readerName;
	
	
	public int getReaderId() {
		return readerId;
	}

	public void setReaderId(int readerId) {
		this.readerId = readerId;
	}

	public Journal(){
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getWriterId() {
		return writerId;
	}

	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String key) {
		this.keyword = key;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProposal() {
		return proposal;
	}

	public void setProposal(String proposal) {
		this.proposal = proposal;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getCensorTime() {
		return censorTime;
	}

	public void setCensorTime(Date censorTime) {
		this.censorTime = censorTime;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getReaderName() {
		return readerName;
	}

	public void setReaderName(String readerName) {
		this.readerName = readerName;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	
}
