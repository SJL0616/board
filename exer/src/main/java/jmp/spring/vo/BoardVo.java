package jmp.spring.vo;

import lombok.Data;

@Data
public class BoardVo {

	private int bno; //번호
	private String title; //제목
	private String content; //내용
	private String writer;  //작성자
	private String regdate;  //작성일시
	private String updatedate; //수정일시
	private int row_num; //수정일시
	private int replycnt; //수정일시
	private int attachno; //수정일시
	
	
}
