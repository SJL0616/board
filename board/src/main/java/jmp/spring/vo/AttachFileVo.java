package jmp.spring.vo;

import lombok.Data;

@Data
public class AttachFileVo {
	
	        //÷������ ��ȣ
			private int attachno;
			//�ߺ�ó���� ���� ������ uuid
			private  String uuid;
			//
			private  String uploadpath;
			private  String filename; 
			private  String filetype; 
			private  String regdate ;
			 
			private  String savepath;
			private  String s_savepath;
			 
			 
}
