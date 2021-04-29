package jmp.spring.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import jmp.spring.service.BoardService;
import jmp.spring.service.ReplyService;
import jmp.spring.vo.BoardVo;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.PageNavi;
import jmp.spring.vo.ReplyVo;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class ReplyController2 {


	@Autowired
	ReplyService rservice;
	
	@GetMapping("reply2/list/{bno}")
	public List<ReplyVo> showList(@PathVariable("bno") int bno) {
		
		Criteria cri= new Criteria();
		
		List<ReplyVo> list= rservice.getList(bno, cri);
		
		
		log.info(list);
		
		return list;
		
	}
	
}
