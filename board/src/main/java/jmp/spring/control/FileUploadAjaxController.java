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
	//file ???? : urlPath + uuid + _ + ????????
	@GetMapping("/download")
	public ResponseEntity<byte[]> downloafFile (String filename) {
		log.info("/display===========filename :" + filename);
		File file = new File(ROOT_DIR+ filename);
		
		if(file.exists()) {
			//?????? ResponseEnity?? ?????? ????
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type", MediaType.APPLICATION_OCTET_STREAM_VALUE);
			try {// \"" <- ""?? ???????? ???????? ?? ???? ??.
				//???????? ????????.
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
	
	//?????? ???? ?????? ?????? ???????? ????
	//?????? ???? ??????????.
	@GetMapping("/display")
	public  ResponseEntity<byte[]> displayFile(String filename) {
		log.info("/display=================fileName:"+ filename);
		//filename :uploadpath + uuid + '_'+ filename
	
		File file = new File(ROOT_DIR + filename);
		HttpHeaders headers = new HttpHeaders();
				
		//?????? ?????? ????
		if(file.exists()) {
			try {
				//header?? content-type?? ????: img?????? ?????? ???? myme?????? ?? ?? ????.
				headers.add("Content-Type", Files.probeContentType(file.toPath()));
				//responseEntity ?????? ?????? ????, ????, ???????????? ??????.
				return new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
				
				
			} catch (IOException e) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			
			}
		}else {
			log.info("/???? :display=================fileName:"+ filename);
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
		//???????? ?????? ???? attachNo?? ??????.
		if(attachno== 0) {
			attachno= service.getSeq();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			String uploadpath = getFolder();
			AttachFileVo vo= new AttachFileVo(attachno, uploadpath, multipartFile.getOriginalFilename());
			
			
			//?????????? ???? UUID?? ???????? ?????? ???? ????????.
			//uuid: ?????? ???????? uuid ?????? ???? 36?? ???? (8-4-4-4-12)?? ????
			 UUID uuid = UUID.randomUUID(); 
			
			
			/*
			 * String uploadFileName=
			 * uuid.toString()+"_"+multipartFile.getOriginalFilename();
			 */
			/* File saveFile = new File(ROOT_DIR+uploadPath+uploadFileName); */
			File saveFile = new File(ROOT_DIR+vo.getSavepath());
		
			
			try {
				
				
						multipartFile.transferTo(saveFile);
						
						//???????? ????????  MimeType?? ??????????.
						//?????????? ???????? ?????? null?? ??????????.
						String contentType = Files.probeContentType(saveFile.toPath());
						
						//?????? ?????? ???? ???????? ????????????.
						if(contentType.startsWith("image")&& contentType!=null) {
							//???????? ?????? ?????? ????
					/* String thmnail = ROOT_DIR+uploadPath+"s_" +uploadFileName; */
							String thmnail = ROOT_DIR+vo.getS_savepath();
							//?????? ?????? ????
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
		
		//ATTATCNO?? ???????? ???????????? ???????? ???? ???????? ???????? ?????? ????
		/*
		 * java.util.List<AttachFileVo> list= service.getList(attachno); return list;
		 */
		map.put("attachno", attachno+"");
		map.put("result", res+"?? ??????????????");
		return map;
	}
	
	// ???? ?????? ?????? ?????? ?????? ?????? ????.
	//?????? ?????? ?????? ???????? ?????? ?????? ??????. 
	private String getFolder() {
		String uploadPath = "";
		
		//???? ?????? yyyy-mm-dd ?????? ???? String ?????? ?????? ??????.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//??-??-???? ???? String ????
		String str = sdf.format(new Date());
		
		//file.sepearator : ?????????? ???????? ???????? ???? - ?? /?? ??????.(?????????? ?????? \)
		uploadPath = str.replace("-", File.separator) + File.separator;
		
		
		
		 File saveFile = new File( ROOT_DIR+uploadPath); log.info(saveFile);
		 
		//???????? ????.
		 if(!saveFile.exists()) { saveFile.mkdirs(); }
		 
		
		return uploadPath;
	}
	
}
