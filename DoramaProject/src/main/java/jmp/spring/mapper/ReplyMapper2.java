package jmp.spring.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;

public interface ReplyMapper2 {
	
	public List<ReplyVo> readReply (int bno);
	
	public int writeReply (ReplyVo vo);
	
	public int delete(int rno);
}





