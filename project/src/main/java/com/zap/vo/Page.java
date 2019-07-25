package com.zap.vo;

import java.util.List;


public class Page<T> {

	private int pageSize = 5;
	private int startRow;
	private int currentPage;
	private int totalCount;
	private int totalPages;
	private List<T> list;

	public Page() {
	}

	public Page(int currentPage,int pageSize, int totalCount) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		if (totalCount!=0 && totalCount % pageSize == 0) {
			this.totalPages = totalCount / pageSize;
		} else {
			this.totalPages = (totalCount / pageSize) + 1;
		}
		this.startRow = (currentPage - 1) * pageSize;
	}
	
	public Page(Page<T> page) {
		this.pageSize = page.pageSize;
		this.startRow = page.startRow;
		this.currentPage = page.currentPage;
		this.totalCount = page.totalCount;
		this.totalPages = page.totalPages;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "Page [pageSize=" + pageSize + ", startRow=" + startRow
				+ ", currentPage=" + currentPage + ", totalCount=" + totalCount
				+ ", totalPages=" + totalPages + ", list=" + list + "]";
	}

}
