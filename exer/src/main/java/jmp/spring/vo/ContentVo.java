package jmp.spring.vo;

import java.util.UUID;

import lombok.Data;

@Data
public class ContentVo {
	
	/*
	 * //÷������ ��ȣ private int attachno; //�ߺ�ó���� ���� ������ uuid private String uuid; //
	 */			private  String puploadpath;
			private  String pfilename; 
			private  String cname; //contents �̸�
			private  String filetype; 
			private  String regdate ;
			
			private  int cno; 
			
			private  String story ; 
			private  String cast ; 
			private  String tags ; 
			private  String bc ; 
			private  String agelimit ; 
			private  String end ;
			
			private  String savepath;
			private  String s_savepath;
			
			public ContentVo(String cname, String uploadpath, String filename) {
		/* UUID uuid = UUID.randomUUID(); */
				
				this.cname = cname;
		/* this.uuid=uuid.toString(); */
				this.puploadpath = uploadpath;
				this.pfilename= filename;
				
				this.savepath= uploadpath+ filename;
				this.s_savepath=  uploadpath+"s_"+ filename;
			}
			 
			 
}
