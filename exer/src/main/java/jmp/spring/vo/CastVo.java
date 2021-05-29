package jmp.spring.vo;

import lombok.Data;

@Data
public class CastVo {
int castno;
String castname;
String cast;

String profileUploadPath;
String profileImgName;
private  String savepath;
private  String s_savepath;
public CastVo(String castname, String profileUploadPath, String profileImgName) {
	/* UUID uuid = UUID.randomUUID(); */
			
			this.castname = castname;
	/* this.uuid=uuid.toString(); */
			this.profileUploadPath = profileUploadPath;
			this.profileImgName= profileImgName;
			
			this.savepath= profileUploadPath+ profileImgName;
			this.s_savepath=  profileUploadPath+"s_"+ profileImgName;
		}
}