package jmp.spring.control;


import java.io.File;
import java.io.IOException;
import java.net.http.HttpHeaders;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	
	//�̹��� ���� ��θ� �޾Ƽ� �̹����� ��ȯ
	//�̹��� ���� ��ȯ�մϴ�.
	@GetMapping("/display")
	public ResponseEntity<byte[]> displayFile(String filename) {
		log.info("/display=================fileName:"+ filename);
		//filename :uploadpath + uuid + '_'+ filename
		File file = new File(ROOT_DIR + filename);
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
				
		if(file.exists()) {
			try {
				headers.add("Content-Type", Files.probeContentType(file.toPath()));
				return new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
				
				
			} catch (IOException e) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			
			}
		}else {
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
		//�űԻ��� ������ ��� attachNo�� ������.
		if(attachno== 0) {
			attachno= service.getSeq();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			String uploadPath = getFolder();
			AttachFileVo vo= new AttachFileVo(attachno, uploadPath, multipartFile.getOriginalFilename());
			
			
			//�ߺ������� ���� UUID�� �����ؼ� ���ϸ� �տ� �ٿ��ش�.
			//uuid: �ĺ��� ǥ������ uuid ǥ�ؿ� ���� 36�� ���� (8-4-4-4-12)�� ����
			 UUID uuid = UUID.randomUUID(); 
			
			
			/*
			 * String uploadFileName=
			 * uuid.toString()+"_"+multipartFile.getOriginalFilename();
			 */
			/* File saveFile = new File(ROOT_DIR+uploadPath+uploadFileName); */
			File saveFile = new File(ROOT_DIR+vo.getSavepath());
		
			
			try {
				
				
						multipartFile.transferTo(saveFile);
						
						//Ȯ���ڸ� �̿��Ͽ�  MimeType�� �����մϴ�.
						//����Ÿ���� Ȯ������ ���ϸ� null�� Ȯ���մϴ�.
						String contentType = Files.probeContentType(saveFile.toPath());
						
						//�̹��� ������ ��� ������� �������ݴϴ�.
						if(contentType.startsWith("image")&& contentType!=null) {
							//������� ������ ��θ� ����
					/* String thmnail = ROOT_DIR+uploadPath+"s_" +uploadFileName; */
							String thmnail = ROOT_DIR+vo.getS_savepath();
							//����� �̹��� ����
							Thumbnails.of(saveFile).size(100, 100).toFile(thmnail);
						}
					vo.setUuid(uuid.toString());
					vo.setAttachno(attachno);
					vo.setFilename(multipartFile.getOriginalFilename());
					vo.setFiletype(contentType.startsWith("image")?"Y":"N");
					vo.setUploadpath(uploadPath);
					
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
		
		//ATTATCNO�� �ش��ϴ� ���ϸ���Ʈ�� ��ȸ�Ͽ� ���� ����Ʈ�� ��ȸ�Ͽ� ȭ�鿡 ���
		/*
		 * java.util.List<AttachFileVo> list= service.getList(attachno); return list;
		 */
		map.put("attachno", attachno+"");
		map.put("result", res+"�� ����Ǿ����ϴ�");
		return map;
	}
	
	// �ߺ� ������ ���ε� ��¥�� ���ε� ��η� ����.
	//������ ��ο� ������ �������� ������ ������ ������. 
	private String getFolder() {
		String uploadPath = "";
		
		//���� ��¥�� yyyy-mm-dd ���˿� �°� String ���·� ������ �ɴϴ�.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//��-��-��¥ ���� String ����
		String str = sdf.format(new Date());
		
		//file.sepearator : �÷������� ����ϴ� �����ڸ� ���� - �� /�� �ٲ���.(�ü���� ���� \)
		uploadPath = str.replace("-", File.separator) + File.separator;
		
		
		
		 File saveFile = new File( ROOT_DIR+uploadPath); log.info(saveFile);
		 
		//���丮 ����.
		 if(!saveFile.exists()) { saveFile.mkdirs(); }
		 
		
		return uploadPath;
	}
	
}
