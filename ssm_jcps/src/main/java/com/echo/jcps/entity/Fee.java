package com.echo.jcps.entity;

/**
 * 作者需要支付的费用实体
 */
public class Fee {

	// 费用ID
	private int id;
	// 期刊ID
	private int journalId;
	// 期刊名
	private String journalName;
	// 作者ID
	private int writerId;
	// 作者姓名
	private String writerName;
	// 专家ID
	private int readerId;
	// 专家姓名
	private String readerName;
	// 审核费用状态
	private double vettingFee;
	// 版本费用状态
	private double versionFee;
	// 需要支付的总费用
	private double total;
	// 支付状态
	private boolean state;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getJournalId() {
		return journalId;
	}
	
	public void setJournalId(int journalId) {
		this.journalId = journalId;
	}
	
	public int getWriterId() {
		return writerId;
	}
	
	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}
	
	public String getWriterName() {
		return writerName;
	}
	
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	
	public int getReaderId() {
		return readerId;
	}
	
	public void setReaderId(int readerId) {
		this.readerId = readerId;
	}
	
	public String getReaderName() {
		return readerName;
	}
	
	public void setReaderName(String readerName) {
		this.readerName = readerName;
	}
	
	public double getVettingFee() {
		return vettingFee;
	}
	
	public void setVettingFee(double vettingFee) {
		this.vettingFee = vettingFee;
	}
	
	public double getVersionFee() {
		return versionFee;
	}
	
	public void setVersionFee(double versionFee) {
		this.versionFee = versionFee;
	}
	
	public double getTotal() {
		return total;
	}
	
	public void setTotal(double total) {
		this.total = total;
	}
	
	public boolean isState() {
		return state;
	}
	
	public void setState(boolean state) {
		this.state = state;
	}

	public String getJournalName() {
		return journalName;
	}

	public void setJournalName(String journalName) {
		this.journalName = journalName;
	}
	
}
