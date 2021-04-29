package jmp.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jmp.spring.mapper.ReplyMapper;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;

@Service
public class ReplyServiceimpl implements ReplyService {

	@Autowired
	ReplyMapper mapper;
	
	@Override
	public int insert(ReplyVo vo) {
		// TODO Auto-generated method stub
		
		int res= mapper.insert(vo);
	
		
		//대글의 갯수는 댓글을 입력할 때, 삭제할때 변경됩니다.
		//댓글을 입력, 삭제할때 변경됨.
		//댓글의 갯수를 카운트해서 테이블의 replycnt 컴럼에 업데이트
		 mapper.updateReplyCnt(vo.getBno()); 
		return res;
	}

	@Override
	public ReplyVo get(int bno) {
		// TODO Auto-generated method stub
		return mapper.get(bno);
	}

	@Override
	public int update(ReplyVo vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(int rno) {
		// TODO Auto-generated method stub
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVo> getList(int bno,Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getList(bno,cri);
	}

	@Override
	public int remove(int rno) {
		// TODO Auto-generated method stub
		return mapper.remove(rno);
	}

	@Override
	public int getTotal(int bno) {
		// TODO Auto-generated method stub
		return mapper.getTotal(bno);
	}




}
