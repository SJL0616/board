package jmp.spring.control;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import jmp.spring.service.AttachFileService;
import jmp.spring.service.addContentsService;
import jmp.spring.vo.CastVo;
import jmp.spring.vo.ContentVo;
import jmp.spring.vo.ContentsVo;
import jmp.spring.vo.VideoVo;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FileUploadController {

	@Autowired
	public addContentsService service;
	
	@Autowired
	public AttachFileService aservice;
	
	
	
	
	
	@GetMapping("/index2-1")
	public void Page() {
		
	}
	@GetMapping("/board/fileupload")
	public void showPage() {
		
	}
	@GetMapping("/board/fileupload2")
	public void showPage2() {
		
	}
	@GetMapping("/board/fileupload3")
	public void showPage3() {
		
	}
	@GetMapping("/addTest")
	public void addContent(ContentsVo contents) {
		
	}
	
	@GetMapping("/header")
	public void showheader() {
		
	
	}

	/*
	 * @GetMapping("/index") public void showIndex() {
	 * 
	 * 
	 * }
	 */
	@GetMapping("/search")
	public void showsearchPage() {
		
	}
	@GetMapping("/search2")
	public String showsearchPage2(String castname, Model model) {
		
		CastVo cvo= new CastVo();
		cvo.setCastname(castname);
		model.addAttribute("cvo", cvo);
		return "/search";
	}
	@GetMapping("/contentsList")
	public void showcontentsList() {
		
	}
	@GetMapping("/showcontents")
	public void contentsList(int cno, Model model) {
		
	ContentVo cvo= aservice.get(cno);
	List<VideoVo> vvo= service.getAllVideo(cno);
	List<CastVo> castVo = service.getCastList(cno);
	
	model.addAttribute("cvo", cvo);
	
	int vSize= vvo.size();
	
	model.addAttribute("vvo", vvo);
	model.addAttribute("vSize", vSize);
	model.addAttribute("castVo", castVo);

		
	}
	@GetMapping("/Watch")
	public void WatchPage(int vno, int cno,Model model) {
	VideoVo vvo= service.getOneVideo(vno);
	ContentVo cvo= aservice.get(cno);
	
		
		model.addAttribute("vvo", vvo);
		model.addAttribute("cvo", cvo);
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
