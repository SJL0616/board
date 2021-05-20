package jmp.spring.control;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;


import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FileUploadController {

	
	@GetMapping("/board/fileupload")
	public void showPage() {
		
	}
	@GetMapping("/board/fileupload2")
	public void showPage2() {
		
	}
	@GetMapping("/board/fileupload3")
	public void showPage3() {
		
	}
	@PostMapping("/uploadFormAction")
	public void fileUpload(MultipartFile[] uploadFile, Model model) {
		
		
		
		for(MultipartFile multipartfile : uploadFile) {
		
			File saveFile = new File(multipartfile.getOriginalFilename());
			try {
				multipartfile.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			log.info("================="+multipartfile.getOriginalFilename());
			log.info("================="+multipartfile.getSize());
		
		
		}
		
		
		
		
		
	}
	
	
}
