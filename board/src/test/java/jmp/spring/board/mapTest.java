package jmp.spring.board;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import jmp.spring.vo.BoardVo;
import jmp.spring.vo.ReplyVo;
import lombok.extern.log4j.Log4j;
@Log4j
public class mapTest {


	@Test
public void maptest() {
		BoardVo bvo= new BoardVo();
		bvo.setBno(50);
		ReplyVo rvo= new ReplyVo();
		rvo.setRno(123);
		
		
		Map<String, Object> map = new HashMap<String ,Object>();
		map.put("boardVo", bvo);
		map.put("ReplyVo", rvo);
		log.info(map);
		log.info(map.get("boardVo"));
		log.info(map.get("ReplyVo"));
		
		
	}
}
