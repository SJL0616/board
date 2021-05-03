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
		
		//�űԻ��� ������ ��� attachNo�� ������.
		if(attachno== 0) {
			attachno= service.getSeq();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileVo vo= new AttachFileVo();
			
			
			//�ߺ������� ���� UUID�� �����ؼ� ���ϸ� �տ� �ٿ��ش�.
			//uuid: �ĺ��� ǥ������ uuid ǥ�ؿ� ���� 36�� ���� (8-4-4-4-12)�� ����
			UUID uuid = UUID.randomUUID();
			String uploadPath = getFolder();
			
			String uploadFileName= uuid.toString()+"_"+multipartFile.getOriginalFilename();
			File saveFile = new File(ROOT_DIR+uploadPath+uploadFileName);
		
			
			try {
				
				
						multipartFile.transferTo(saveFile);
						
						//Ȯ���ڸ� �̿��Ͽ�  MimeType�� �����մϴ�.
						//����Ÿ���� Ȯ������ ���ϸ� null�� Ȯ���մϴ�.
						String contentType = Files.probeContentType(saveFile.toPath());
						
						//�̹��� ������ ��� ������� �������ݴϴ�.
						if(contentType.startsWith("image")) {
							//������� ������ ��θ� ����
							String thmnail = ROOT_DIR+uploadPath+"s_" +uploadFileName;
							//����� �̹��� ����
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
		
		//ATTATCNO�� �ش��ϴ� ���ϸ���Ʈ�� ��ȸ�Ͽ� ���� ����Ʈ�� ��ȸ�Ͽ� ȭ�鿡 ���
 java.util.List<AttachFileVo> list=  service.getList(attachno);
  return list;
	}
	
	// �ߺ� ������ ���ε� ��¥�� ���ε� ��η� ����.
	//������ ��ο� ������ �������� ������ ������ ������. 
	private String getFolder() {
		String uploadPath = "";
		
		//���� ��¥�� yyyy-mm-dd ���˿� �°� String ���·� ������ �ɴϴ�.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(new Date());
		
		//file.sepearator : �÷������� ����ϴ� �����ڸ� ����
		uploadPath = str.replace("-", File.separator) + File.separator;
		
		
		File saveFile = new File( ROOT_DIR+uploadPath);
		
		if(!saveFile.exists()) {
			saveFile.mkdirs();
		}
		
		
		return uploadPath;
	}
	
}
