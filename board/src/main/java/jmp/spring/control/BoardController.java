package jmp.spring.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jdk.internal.org.jline.utils.Log;
import jmp.spring.service.BoardService;
import jmp.spring.vo.BoardVo;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.PageNavi;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardController {

	@Autowired
	BoardService service;
	   //�닔�젙
	
	@GetMapping("/board/restTest")
	public void restTest() {
		
	}
	@GetMapping("/board/restTest2")
	public void restTest2() {
		
	}
	@GetMapping("/board/reply")
	public void showReply() {
		
	}
	@GetMapping("/reply")
	public String showReply2() {
	
		 return "/exer/reply2";
	}
	@GetMapping("/search")
	public String searchB(Criteria cri, Model model) {
		
		
		model.addAttribute("list", service.search(cri));
		model.addAttribute("pageNum", cri.getPageNum()); 
		
		model.addAttribute("navi",new PageNavi(cri, service.getTotal2(cri)));
		return "/board/list_b";
	}
	
	@GetMapping("/board/get")
	public String get(Criteria cri, BoardVo vo, Model model) {
		//�긽�꽭�젙蹂� 議고쉶
		
		
		model.addAttribute("vo", service.get(vo.getBno()));
		/* model.addAttribute("cri",cri); */
		return "/board/get_b";
	}
	@GetMapping("board/edit")
	public String edit_b(Criteria cri, BoardVo vo, Model model) {
		//�긽�꽭�젙蹂� 議고쉶
		
		model.addAttribute("vo", service.get(vo.getBno()));
		return "/board/edit_b";
	}
	
	
	   //�뾽�뜲�씠�듃(�옄�뒿)
	@GetMapping("/board/update")
	public String update(Model model, @RequestParam(value="bno", required=true) int bno) {
	    
		
		model.addAttribute("vo", service.selectOneBoard(bno));
		return "/board/update";
	}
	   //�벑濡�
	@PostMapping("/updateBoard")
	public String updateBoard(Criteria cri,BoardVo vo,  RedirectAttributes rttr) {
		int result =service.updateBoard(vo);
		

		if(result==1) {
		rttr.addFlashAttribute("resMsg", vo.getBno()+"수정되었습니다. ");
		}else {
			rttr.addFlashAttribute("resMsg", vo.getBno()+"오류가발생했습니다. ");
		}
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		

		/*return "redirect:/board/list"; */
		 return "redirect:/board/get";
	}
	
	   //리스트
	/*@GetMapping("/board/list")
	public String getList(Criteria cri,Model model) {
		
		if(cri==null) {
			cri.setPageNum(1);
		}
		cri.setAmount(10);
		
		int lastPage= (int)Math.ceil((cri.getPageNum()/10.0))*10;
		model.addAttribute("list",service.getListWithPaging(cri));
		model.addAttribute("pageNum", cri.getPageNum());
		model.addAttribute("lastPage", lastPage);
		//model.addAttribute("list",service.selectALLBoard());
		
		return "/board/list";
	}*/
	@GetMapping("/board/list")
	public String getList(Criteria cri,Model model) {
		
		if(cri==null) {
			cri.setPageNum(1);
		}
		cri.setAmount(10);
		
		/*
		 * if(cri.getType() !="") { model.addAttribute("list", service.search(cri));
		 * model.addAttribute("pageNum", cri.getPageNum());
		 * 
		 * model.addAttribute("navi",new PageNavi(cri, service.getTotal2(cri))); return
		 * "/board/list_b"; }
		 */
		
		
		model.addAttribute("list",service.search(cri));
		model.addAttribute("pageNum", cri.getPageNum());
		model.addAttribute("navi",new PageNavi(cri, service.getTotal2(cri)));
		
		/* model.addAttribute("lastPage", lastPage); */
		//model.addAttribute("list",service.selectALLBoard());
		
		return "/board/list_b";
	}
	
   //�벑濡�
	@GetMapping("/board/register")
	public String register(Model model) {
	
		return "/board/register_b";
	}
	@PostMapping("/board/register")
	public String register(BoardVo vo, RedirectAttributes rttr) {
		
	   log.info(vo);
	   
		int result =service.insertBoard(vo);
		System.out.println("占쏙옙臼狗占�");
		rttr.addFlashAttribute("resMsg", vo.getBno()+"�옉�꽦�씠 �셿猷뚮릺�뿀�뒿�땲�떎.");
		
		return "redirect:/board/list";
	
	}
	//�궘�젣(�옄�뒿	
	@GetMapping("/deleteBoard")
	public String deleteBoard(Criteria cri,BoardVo vo, RedirectAttributes rttr) {
	
 
		int res;
		res=service.deleteBoard(vo.getBno());
		
		if(res==1) {
		rttr.addFlashAttribute("resMsg", vo.getBno()+"삭제되었습니다. ");
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
		}else {
			rttr.addFlashAttribute("resMsg", vo.getBno()+"오류가발생했습니다. ");
			rttr.addAttribute("bno", vo.getBno());
		
			return "redirect:/board/get";
		}
		
	}
	
	@GetMapping("/board/delete")
	public String delete(Model model, @RequestParam(value="bno", required = true) int bno) {
	
 
		service.deleteBoard(bno);
		return "redirect:/board/list";
	}
	   //�긽�꽭蹂닿린(�옄�뒿)	
	@GetMapping("/board/view")
	public String view(Model model, @RequestParam(value="bno", required=true) int bno) {
	    
		
		model.addAttribute("vo", service.selectOneBoard(bno));
		return "/board/view";
	}
	
}
