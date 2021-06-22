package jmp.spring.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jmp.spring.service.BoardService;
import jmp.spring.service.ReplyService2;
import jmp.spring.vo.BoardVo;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.PageNavi;
import jmp.spring.vo.ReplyVo;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardController {

	@Autowired
	BoardService service;
	
	@Autowired
	ReplyService2 replyService;
	
	@GetMapping("/reply")
	public String reply() {
		return "/board/reply";
	}
	@GetMapping("/board/delete")
	public String delete(Criteria cri, BoardVo vo, RedirectAttributes rttr) {
		
		int res = service.delete(vo.getBno());
		String resMsg = "";
		// �궘�젣 �꽦怨� -> 由ъ뒪�듃
		if(res>0) {
			resMsg = vo.getBno()+"번 게시물이 삭제되었습니다.";
			rttr.addFlashAttribute("resMsg", resMsg);
			rttr.addAttribute("pageNo",cri.getPageNo());
			rttr.addAttribute("type",cri.getType());
			rttr.addAttribute("keyword",cri.getKeyword());
			
			return "redirect:/board/list";
		} else {
		// �궘�젣 �떎�뙣 -> �긽�꽭�솕硫�
			resMsg = "寃뚯떆湲� �궘�젣 泥섎━�뿉 �떎�뙣 �뻽�뒿�땲�떎.";
			rttr.addFlashAttribute("resMsg", resMsg);
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("pageNo",cri.getPageNo());
			rttr.addAttribute("type",cri.getType());
			rttr.addAttribute("keyword",cri.getKeyword());
			
			return "redirect:/board/get";
		}
		
		
	}
	
	@PostMapping("/board/edit")
	public String editExe(Criteria cri, BoardVo vo, RedirectAttributes rttr) {
		
		int res = service.update(vo);
		String resMsg = "";
		
		if(res>0) {
			resMsg = "게시글이 수정되었습니다.";
		} else {
			resMsg = "�닔�젙 �옉�뾽 �떎�뙣 �뻽�뒿�땲�떎. 愿�由ъ옄�뿉寃� 臾몄쓽�빐二쇱꽭�슂.";
		}
		
		// �긽�꽭�솕硫� �씠�룞�떆 �븘�슂�븳 �뙆�씪硫뷀꽣瑜� �꽭�똿
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("pageNo",cri.getPageNo());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("resMsg",resMsg);
		return "redirect:/board/get";
		
	}
	
	@GetMapping("/board/get")
	public String get(Criteria cri, BoardVo vo,Model model) {
		log.info("============"+vo.getBno());
		
		vo = service.get(vo.getBno());
		log.info("============"+vo.getBno());
		
		model.addAttribute("vo", vo);
		log.info("============"+vo);
	
		List<ReplyVo> replyList = replyService.readReply(vo.getBno());
		model.addAttribute("replyList", replyList);
		
		return "/board/get";
	}
	
	@GetMapping("/board/edit")
	public String edit(Criteria cri, BoardVo vo,Model model) {
		log.info("============"+vo.getBno());
		// �긽�꽭�젙蹂� 議고쉶
		vo = service.get(vo.getBno());
		log.info("============"+vo.getBno());
		//紐⑤뜽�뿉 �떞�븘�꽌 �솕硫댁뿉 �쟾�떖
		model.addAttribute("vo", vo);
		log.info("============"+vo);
		//由ы꽩�씠 �뾾�쑝誘�濡� /board/get(URL)濡� �럹�씠吏� �뿰寃�
		
		return "/board/edit";
	}
	
	//1. �벑濡앺럹�씠吏�濡� �씠�룞
	@GetMapping("/board/register")
	public String insert() {
		return "/board/register";
	}
	
	@PostMapping("/board/register")
	public String insertExe(BoardVo vo, RedirectAttributes rttr, Model model) {
		try {
			System.out.println("===========vo : "+vo);
			int res = service.insertBoard(vo);
			if(res>0) {
				
				rttr.addFlashAttribute("resMsg",vo.getBno()+"번 게시글 등록이 완료됐습니다.");
				
				return "redirect:/board/list";
				
				
			}
			return "/error";
		} catch (Exception e) {
			model.addAttribute("msg","모든 내용을 기입하여 주십시오");
			return "/error";
			// TODO: handle exception
		}
	}
	
	
	@GetMapping("/board/list")
	public String getList(Criteria cri, Model model) {
		
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageNavi",
				new PageNavi(cri, service.getTotal(cri)));
		log.info("getList()================");
		
		return "/board/list";
	}
	
}
