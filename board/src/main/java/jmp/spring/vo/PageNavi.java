package jmp.spring.vo;

import lombok.Data;

@Data
public class PageNavi {

	int startPage;
	int endPage;
	boolean prev;
	boolean next;
	
	Criteria cri;
	
	
	//cri �쁽�옱�럹�씠吏�, �럹�씠吏��뿉 �떞湲� 寃뚯떆臾� �닔
	//total �넻 紐� 嫄댁쓽 寃뚯떆臾쇱씠 �엳�뒗吏� (珥� 寃뚯떆臾� �닔), 留덉�留� �럹�씠吏�
	//endPage = �럹�씠吏� �븘�씠肄섏쓽 �걹�뿉 �엳�뒗 �럹�씠吏�.
	//startPage = �럹�씠吏� �븘�씠肄� 泥ル쾲吏� �럹�씠吏� �븘�씠肄� �닽�옄.
	public PageNavi(Criteria cri, int total){
		this.cri= cri;
		
		endPage = (int)Math.ceil((cri.getPageNum()/10.0))*10;
	    startPage = endPage-9;
	    
	    //吏꾩쭨�걹 �럹�씠吏� = (�쟾泥닿쾶�떆臾� �닔/1.0)/�럹�씠吏� �닔
	    int realEndPage = (int)Math.ceil((total*1.0)/cri.getAmount());
	
	   if(endPage > realEndPage) {
		   endPage=realEndPage;
	   };
		   

	   
	   prev = startPage > 1 ? true : false;
//	   prev = startPage > 1 ? ;
	   next = realEndPage >endPage ? true : false;
//	   next = realEndPage >endPage;
	   
	   
	}
	
}
