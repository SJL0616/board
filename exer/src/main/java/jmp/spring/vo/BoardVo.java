package jmp.spring.vo;

import lombok.Data;

@Data
public class BoardVo {

	private int bno; //��ȣ
	private String title; //����
	private String content; //����
	private String writer;  //�ۼ���
	private String regdate;  //�ۼ��Ͻ�
	private String updatedate; //�����Ͻ�
	private int row_num; //�����Ͻ�
	private int replycnt; //�����Ͻ�
	private int attachno; //�����Ͻ�
	
	
}
