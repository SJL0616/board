package jmp.spring.control;

import java.io.File;
import java.io.IOException;

import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class FileUploadAjaxController {

	
	@PostMapping("/fileUploadAjax")
	public void fileUpload(MultipartFile[] uploadFile) {
		
		for(MultipartFile multipartFile : uploadFile) {
			
			File saveFile = new File(multipartFile.getOriginalFilename());
					try {
						multipartFile.transferTo(saveFile);
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
	}
	
}
