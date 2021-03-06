package jmp.spring.control;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import jmp.spring.service.AttachFileService;
import jmp.spring.service.AttachFileServiceimpl;
import jmp.spring.service.UserService;
import jmp.spring.vo.AttachFileVo;
import jmp.spring.vo.UserVo;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@RestController
@Log4j
public class FileUploadAjaxController {

	@Autowired
	public AttachFileService service;
	
	@Autowired
	public UserService uservice;
	
	private static final String ROOT_DIR = "C:\\upload\\";

	@GetMapping("/attachFileDelete/{uuid}/{attachno}")
	public String deleteFile (@PathVariable("uuid") String uuid, 
			@PathVariable("attachno") int attachno	) {
		log.info("/deleteFile===========uuid :" +  uuid);
		log.info("/deleteFile===========attachno :" + attachno);
		
		AttachFileVo vo =service.get(uuid, attachno);
		log.info("/deleteFile===========vo :" + vo);
		log.info("/deleteFile===========vo :" + vo.getSavepath());
		log.info("/deleteFile===========vo :" + vo.getS_savepath());
		log.info("/deleteFile===========vo :" + vo.getFiletype());
		File file  = new File(ROOT_DIR+vo.getSavepath());
		if(file.exists()) {
		file.delete();
		}
		if(vo.getFiletype().equals("Y")) {
			File sfile  = new File(ROOT_DIR+vo.getS_savepath());
			log.info("/deleteFile===========s_savepath :" +ROOT_DIR+vo.getS_savepath());
			log.info("/deleteFile===========sfile :" +sfile);
			if(sfile.exists()) {
			sfile.delete();
			}
		}
		int res = service.delete(uuid, attachno);
		
		return res>0?"success":"error";
	}
	//file 경로 : urlPath + uuid + _ + 파일이름
	@GetMapping("/download")
	public ResponseEntity<byte[]> downloafFile (String filename) {
		log.info("/display===========filename :" + filename);
		File file = new File(ROOT_DIR+ filename);
		
		if(file.exists()) {
			//파일을 ResponseEnity에 담아서 반환
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type", MediaType.APPLICATION_OCTET_STREAM_VALUE);
			try {// \"" <- ""를 문자처럼 쓰고싶을 때 쓰는 거.
				//컨텐츠의 부가설명.
				headers.add("Content-Disposition", "attachment;filename=\""+ new String(filename.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			
					return new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),
							headers,
							HttpStatus.OK);
			
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return  new ResponseEntity<>(
						HttpStatus.INTERNAL_SERVER_ERROR);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return  new ResponseEntity<>(
						HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
		}else {
			return  new ResponseEntity<>(
					HttpStatus.NOT_FOUND);
		}
		
	}
	
	//이미지 파일 경로를 받아서 이미지를 반환
	//이미지 파일 반환합니다.
	@GetMapping("/display")
	public  ResponseEntity<byte[]> displayFile(String filename) {
		log.info("/display=================fileName:"+ filename);
		//filename :uploadpath + uuid + '_'+ filename
	
		File file = new File(ROOT_DIR + filename);
		HttpHeaders headers = new HttpHeaders();
				
		//파일이 있는지 확인
		if(file.exists()) {
			try {
				//header에 content-type을 지정: img파일의 경로를 넣어 myme타입을 알 수 있슴.
				headers.add("Content-Type", Files.probeContentType(file.toPath()));
				//responseEntity 파일의 바이트 정보, 헤더, 결과코드값을 넣어줌.
				return new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
				
				
			} catch (IOException e) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			
			}
		}else {
			log.info("/실패 :display=================fileName:"+ filename);
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	
	} 

	@GetMapping("/getFileList/{attachno}")
	public java.util.List<AttachFileVo> getlist(@PathVariable("attachno") int attachno){
		
		List<AttachFileVo> list= service.getList(attachno); 
		
		return list;
	}
	
	@PostMapping("/fileUploadAjax")
	public Map<String, Object> fileUpload(MultipartFile[] uploadFile, int attachno){
		
		Map<String, Object> map =new HashMap<String, Object>();
		int res=0;
		//신규생성 파일의 경우 attachNo를 가져옴.
		if(attachno== 0) {
			attachno= service.getSeq();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			String uploadpath = getFolder();
			AttachFileVo vo= new AttachFileVo(attachno, uploadpath, multipartFile.getOriginalFilename());
			
			
			//중복방지를 위해 UUID를 생성해서 파일명 앞에 붙여준다.
			//uuid: 식별자 표준으로 uuid 표준에 따라 36개 문자 (8-4-4-4-12)를 생성
			 UUID uuid = UUID.randomUUID(); 
			
			
			/*
			 * String uploadFileName=
			 * uuid.toString()+"_"+multipartFile.getOriginalFilename();
			 */
			/* File saveFile = new File(ROOT_DIR+uploadPath+uploadFileName); */
			File saveFile = new File(ROOT_DIR+vo.getSavepath());
		
			
			try {
				
				
						multipartFile.transferTo(saveFile);
						
						//확장자를 이용하여  MimeType를 결정합니다.
						//마임타입을 확인하지 못하면 null을 확인합니다.
						String contentType = Files.probeContentType(saveFile.toPath());
						
						//이미지 파일인 경우 썸네일을 생성해줍니다.
						if(contentType.startsWith("image")&& contentType!=null) {
							//썸네일을 생성할 경로를 지정
					/* String thmnail = ROOT_DIR+uploadPath+"s_" +uploadFileName; */
							String thmnail = ROOT_DIR+vo.getS_savepath();
							//썸네일 이미지 생성
							Thumbnails.of(saveFile).size(100, 100).toFile(thmnail);
						}
				/*
				 * vo.setUuid(uuid.toString()); vo.setAttachno(attachno);
				 * vo.setFilename(multipartFile.getOriginalFilename());
				 */
					vo.setFiletype(contentType.startsWith("image")?"Y":"N");
				/* vo.setUploadpath(uploadpath); */
					
					if(service.insert(vo)>0) {
						res++;
					}
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
		/*
		 * java.util.List<AttachFileVo> list= service.getList(attachno); return list;
		 */
		map.put("attachno", attachno+"");
		map.put("result", res+"건 저장되었습니다");
		return map;
	}
	
	// 중복 방지용 업로드 날짜를 업로드 경로로 지정.
	//지정된 경로에 폴더가 존재하지 않으면 폴더를 생성함. 
	private String getFolder() {
		String uploadPath = "";
		
		//오늘 날짜를 yyyy-mm-dd 포맷에 맞게 String 형태로 가지고 옵니다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//년-월-날짜 순의 String 생성
		String str = sdf.format(new Date());
		
		//file.sepearator : 플랫폼에서 사용하는 구분자를 리턴 - 를 /로 바꿔줌.(운영체제에 때라서 \)
		uploadPath = str.replace("-", File.separator) + File.separator;
		
		
		
		 File saveFile = new File( ROOT_DIR+uploadPath); log.info(saveFile);
		 
		//디렉토리 생성.
		 if(!saveFile.exists()) { saveFile.mkdirs(); }
		 
		
		return uploadPath;
	}
	
}
