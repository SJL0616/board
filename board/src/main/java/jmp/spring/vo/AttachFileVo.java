package jmp.spring.vo;

import java.util.UUID;

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
			
			public AttachFileVo(int attachno, String uploadpath, String filename) {
				UUID uuid = UUID.randomUUID();
				
				this.attachno = attachno;
				this.uuid=uuid.toString();
				this.uploadpath = uploadpath;
				this.filename= filename;
				
				this.savepath= uploadpath+uuid+"_"+ filename;
				this.s_savepath=  uploadpath+"s_"+uuid+"_"+ filename;
			}
			 
			 
}
