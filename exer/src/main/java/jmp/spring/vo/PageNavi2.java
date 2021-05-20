package jmp.spring.vo;

import lombok.Data;

@Data
public class PageNavi2 {

	
	int startPage;
	 int endPage;
	int realEndPage;
	boolean prev;
	boolean next;
	
	
	
	public PageNavi2(Criteria cri, int total) {
		
		endPage = (int)Math.ceil((cri.getPageNum()/10.0))*10;
		startPage = endPage-9;
        
		
		realEndPage = (int)Math.ceil((total*1.0)/cri.getAmount()); 
		if(endPage> realEndPage) {
			endPage= realEndPage;
		}
		
		if(startPage > 1 ) {
			prev = true;
		}
		if(realEndPage> endPage ) {
		   next = true;
		}
		
	}

	
	
}
