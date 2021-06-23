package jmp.spring.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jmp.spring.service.ReplyService;
import jmp.spring.service.ReplyService2;
import jmp.spring.vo.ReplyVo;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class ReplyController {

	@Autowired
	ReplyService2 replyService;
	
	@GetMapping("/reply/list/{bno}")
	public  Map<String, Object> readReply(@PathVariable("bno") int bno) {
	
		List<ReplyVo> list=replyService.readReply(bno);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	
	}
	

	


	@GetMapping("/reply/delete/{rno}")
	public Map<String, String> delete(@PathVariable("rno") int rno) {
		int res = replyService.delete(rno);
		
		Map<String, String> map = new HashMap<String, String>();
		
		if(res>0)
			map.put("result", "success");
		else
			map.put("result", "fail");
		
		return map;
	}
	
	
	
}