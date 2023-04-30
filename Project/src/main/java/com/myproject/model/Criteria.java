package com.myproject.model;

public class Criteria {
	
	
	private int pageNum;
	
	private int amount;
	
	private int skip;
	
	//검색
	private String keyword;
	
	public Criteria() {
		this(1,10);
		this.skip = 0;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum =pageNum;
		this.amount=amount;
		this.skip =(pageNum-1)*amount;
	}
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		
		this.skip=(pageNum-1)*this.amount;
		
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		
		this.skip=(this.pageNum-1)*amount;
		
		this.amount = amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
