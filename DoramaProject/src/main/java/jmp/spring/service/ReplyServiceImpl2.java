package jmp.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jmp.spring.mapper.ReplyMapper;
import jmp.spring.mapper.ReplyMapper2;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;

@Service
public class ReplyServiceImpl2 implements ReplyService2 {

	@Autowired
	ReplyMapper2 replyMapper;
	@Override
	public List<ReplyVo> readReply(int bno) {
		return replyMapper.readReply(bno);
	}
	@Override
	public int writeReply(ReplyVo vo) {
		return replyMapper.writeReply(vo);
	}
	@Override
	public int delete(int rno) {
		
		return replyMapper.delete(rno);
	}
	

	

}
