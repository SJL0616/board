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


import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@RestController
@Log4j
public class FileUploadAjaxC {


	
	private static final String ROOT_DIR = "C:\\upload\\";


	
	@PostMapping("/fileUploadAjax2")
	public void fileUpload(MultipartFile[] uploadFile){
		
		log.info("===================="+uploadFile);
		
		/*
		 * 
		 * 
		 * for(MultipartFile multipartFile : uploadFile) {
		 * 
		 * 
		 * log.info("====================");
		 * log.info(multipartFile.getOriginalFilename());
		 * log.info(multipartFile.getSize()); log.info(multipartFile.getName());
		 * log.info("===================="); }
		 */
	

		
	

/*
	@PostMapping("/fileUploadAjax2/{res}")
	public String fileUpload(@PathVariable("res") String res){
		
		log.info("=============="+res);
		
		return res;
		


		
	}*/
}
}
