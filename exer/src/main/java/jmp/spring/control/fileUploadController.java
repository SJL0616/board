package jmp.spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class fileUploadController {

	@GetMapping("/fileUploadTest")
	public String showFileUploadPage() {
		
		return "/fileUploadTest";
	}
	
}
