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
public class ReplyController {


	@Autowired
	ReplyService rservice;
	
	@GetMapping("/reply/list/{bno}/{pageNum}")
	public Map<String, Object> getList(@PathVariable("bno") int bno
			, @PathVariable("pageNum") int pageNum) {
		
		Criteria cri = new Criteria(pageNum, 10);
		int total =rservice.getTotal(bno);
	    PageNavi pageNavi = new PageNavi(cri, total);
		List<ReplyVo> list = rservice.getList(bno,cri);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNavi",pageNavi);
		map.put("list",list);
		
		log.info(map);
		return  map;
	}
	
	@GetMapping("/reply/list2/{bno}")//占싯삼옙 占쏙옙占쏙옙占� 1占쏙옙 占싹띰옙占쏙옙 占쏙옙占쏙옙 占쏙옙 占쏙옙.
	public ReplyVo get(@PathVariable("bno") int bno) {
		
	
		ReplyVo list = rservice.get(bno);
		log.info(list);
		return  list;
	}
	
	@PostMapping("/reply/insert")
	public Map<String, Object> insert(@RequestBody ReplyVo vo) {
		int res= rservice.insert(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(res>0)
			map.put("result", "success");
		else
			map.put("result", "fail");
			
		return map;
	}
	
	@PostMapping("/reply/modify")
	public Map<String, Object> modify(@RequestBody ReplyVo vo) {
		//json 값을 ReplyVo vo 에 자동으로 넣어줌. 
		int res= rservice.update(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(res>0)
			map.put("result", "success");
		else
			map.put("result", "fail");
			
		return map;
	}
	@GetMapping("/reply/get/{rno}")
	public ReplyVo getone(@PathVariable("rno") int rno) {
		ReplyVo vo = rservice.get(rno);
		return vo;
	}
	
	@GetMapping("/reply/remove/{rno}")
	public Map<String, String> removeone(@PathVariable("rno") int rno) {
		int res = rservice.remove(rno);
		Map<String, String> map = new HashMap<String, String>();
		if(res>0) {
			map.put("result","success");
		}else {
			map.put("result","error");
		}
		return map;
	}
	/*
	@GetMapping("/reply/test")
	public ResponseEntity<List<BoardVo>> restTest() {
		Criteria cri = new Criteria();
	  return new ResponseEntity<List<BoardVo>> (service.selectALLBoard(),HttpStatus.INTERNAL_SERVER_ERROR);
		
		/* return service.selectOneBoard(50); }*/
	
/*
	@GetMapping("/reply/test/{pageNum}")
	public ResponseEntity<List<BoardVo>> restPathTest(@PathVariable("pageNum") int pageNum) {
		Criteria cri = new Criteria(pageNum, 10);
		
	  return new ResponseEntity<List<BoardVo>> (service.getListWithPaging(cri),HttpStatus.INTERNAL_SERVER_ERROR);
		
		/* return service.selectOneBoard(50); }*/
	
	
}
