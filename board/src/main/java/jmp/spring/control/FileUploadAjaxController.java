package jmp.spring.control;

import java.awt.List;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import jmp.spring.service.AttachFileService;
import jmp.spring.service.AttachFileServiceimpl;
import jmp.spring.vo.AttachFileVo;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@RestController
@Log4j
public class FileUploadAjaxController {

	@Autowired
	public AttachFileService service;
	
	private static final String ROOT_DIR = "C:\\upload\\";
	
	@PostMapping("/fileUploadAjax")
	public java.util.List<AttachFileVo> fileUpload(MultipartFile[] uploadFile, int attachno) {
		
		//신규생성 파일의 경우 attachNo를 가져옴.
		if(attachno== 0) {
			attachno= service.getSeq();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileVo vo= new AttachFileVo();
			
			
			//중복방지를 위해 UUID를 생성해서 파일명 앞에 붙여준다.
			//uuid: 식별자 표준으로 uuid 표준에 따라 36개 문자 (8-4-4-4-12)를 생성
			UUID uuid = UUID.randomUUID();
			String uploadPath = getFolder();
			
			String uploadFileName= uuid.toString()+"_"+multipartFile.getOriginalFilename();
			File saveFile = new File(ROOT_DIR+uploadPath+uploadFileName);
		
			
			try {
				
				
						multipartFile.transferTo(saveFile);
						
						//확장자를 이용하여  MimeType를 결정합니다.
						//마임타입을 확인하지 못하면 null을 확인합니다.
						String contentType = Files.probeContentType(saveFile.toPath());
						
						//이미지 파일인 경우 썸네일을 생성해줍니다.
						if(contentType.startsWith("image")) {
							//썸네일을 생성할 경로를 지정
							String thmnail = ROOT_DIR+uploadPath+"s_" +uploadFileName;
							//썸네일 이미지 생성
							Thumbnails.of(saveFile).size(100, 100).toFile(thmnail);
						}
					vo.setUuid(uuid.toString());
					vo.setAttachno(attachno);
					vo.setFilename(multipartFile.getOriginalFilename());
					vo.setFiletype(contentType.startsWith("image")?"Y":"N");
					vo.setUploadpath(uploadPath);
					
					service.insert(vo);
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		
			
			log.info("====================");
			log.info(multipartFile.getOriginalFilename());
			log.info(multipartFile.getSize());
			log.info(multipartFile.getName());
			log.info("====================");
		}
		
		//ATTATCNO에 해당하는 파일리스트을 조회하여 파일 리스트를 조회하여 화면에 출력
 java.util.List<AttachFileVo> list=  service.getList(attachno);
  return list;
	}
	
	// 중복 방지용 업로드 날짜를 업로드 경로로 지정.
	//지정된 경로에 폴더가 존재하지 않으면 폴더를 생성함. 
	private String getFolder() {
		String uploadPath = "";
		
		//오늘 날짜를 yyyy-mm-dd 포맷에 맞게 String 형태로 가지고 옵니다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(new Date());
		
		//file.sepearator : 플랫폼에서 사용하는 구분자를 리턴
		uploadPath = str.replace("-", File.separator) + File.separator;
		
		
		File saveFile = new File( ROOT_DIR+uploadPath);
		
		if(!saveFile.exists()) {
			saveFile.mkdirs();
		}
		
		
		return uploadPath;
	}
	
}
