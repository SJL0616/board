package jmp.spring.vo;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum;
	private int amount;
	private String type;
	private String keyword;
    
	public Criteria() {
		this.pageNum =1;
		
		this.amount =10;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount= amount;
	}
	
	
	
	
}
