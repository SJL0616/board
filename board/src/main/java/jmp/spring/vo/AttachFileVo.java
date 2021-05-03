package jmp.spring.vo;

import lombok.Data;

@Data
public class AttachFileVo {
	
	        //첨부파일 번호
			private int attachno;
			//중복처리를 위한 램덤값 uuid
			private  String uuid;
			//
			private  String uploadpath;
			private  String filename; 
			private  String filetype; 
			private  String regdate ;
			 
			private  String savepath;
			private  String s_savepath;
			 
			 
}
