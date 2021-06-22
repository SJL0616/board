package jmp.spring.service;

import java.util.List;


import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;

public interface ReplyService2 {
	
	public List<ReplyVo> readReply (int bno);
	
	public int writeReply (ReplyVo vo);
	public int delete(int rno);

}
