package jmp.spring.vo;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
public class Criteria {

	private int pageNum;
	private int startPage;
	private int lastPage;
	private int realLastPage;
	int pageNo;
	private int amount;
	private String type;
	private String keyword;
    
	public Criteria() {
		this.pageNum =1;
		this.pageNo = 1;
		this.amount =10;
	}
	
	public Criteria(int pageNum, int amount, int total) {
		this.pageNum = pageNum;
		this.amount= amount;
		
		
		if(total%amount==0) {//���� ������ ���� �� ������ ��� ���� ������ ���������� +1�� ��.
			this.realLastPage=(int)(Math.ceil(total/amount));
			
		}else {
			this.realLastPage=(int)(Math.ceil(total/amount)+1);
		}
		
		log.info("realLastPage================"+realLastPage);
		this.lastPage= ((int)(Math.ceil(pageNum/10)*10)+11);
		if(pageNum>=1&& pageNum <=10) {// �������ѹ��� 10���� �۰ų� ���� �� ���� ������ ���� 1���ڸ����� ����.
			this.startPage=((int)(Math.ceil(pageNum/10)+1));
					/*(((int)(Math.ceil(pageNum/10))*10)-1);*/

			/* this.lastPage= (int)(Math.ceil(total/10)+1); */
			log.info("startPage================"+startPage);
		}
		if(pageNum>10) {// �������ѹ��� 10���� Ŭ �� ���� ������ ���� 10���ڸ����� ����.
			this.startPage=((int)(Math.ceil(pageNum/10)*10)-1);
			log.info("lastPage================"+lastPage);
		
			
			
		}
		if(lastPage>realLastPage) {
			lastPage=realLastPage;
		}
		
	}
	
	
	
	
}
