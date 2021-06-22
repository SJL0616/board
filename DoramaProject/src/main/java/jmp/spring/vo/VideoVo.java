package jmp.spring.vo;

import lombok.Data;

@Data
public class VideoVo {

int vno;
int cno;
String vuploadpath;

String vfilename;
String regdate;
String story;


private  String savepath;
private  String s_savepath;
public VideoVo() {};
public VideoVo(String regdate,String vfilename, String vuploadpath,String story,int cno)  {
	/* UUID uuid = UUID.randomUUID(); */
			
			this.story = story;
			this.regdate = regdate;
			this.cno= cno;
	/* this.uuid=uuid.toString(); */
			this.vuploadpath = vuploadpath;
			this.vfilename= vfilename;
			
			this.savepath=vuploadpath+ vfilename;
			this.s_savepath=vuploadpath+"s_"+ vfilename;
		}
}