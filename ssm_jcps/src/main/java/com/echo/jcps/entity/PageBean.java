package com.echo.jcps.entity;

import java.util.List;

/**
 * 分页功能的实体类
 */
public class PageBean<T> {

	private int currPage; // 当前页
	private int pageSize; // 页面大小
	private int totalCount; //总数目
	private int totalPage; //总页面
	private List<T> list; // 用于分页的实体集合
	
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
	
}
