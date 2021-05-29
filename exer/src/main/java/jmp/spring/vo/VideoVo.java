package jmp.spring.vo;

import lombok.Data;

@Data
public class VideoVo {
int vno;
String castname;
String cast;

String vUploadPath;
String vfileName;
String regdate;
String story;


private  String savepath;
private  String s_savepath;
public VideoVo(String castname, String vUploadPath, String vfileName) {
	/* UUID uuid = UUID.randomUUID(); */
			
			this.castname = castname;
	/* this.uuid=uuid.toString(); */
			this.vUploadPath = vUploadPath;
			this.vfileName= vfileName;
			
			this.savepath= vUploadPath+ vfileName;
			this.s_savepath= vUploadPath+"s_"+ vfileName;
		}
}