package jmp.spring.service;

import java.io.Console;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jdk.internal.org.jline.utils.Log;
import jmp.spring.mapper.ReplyMapper;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;
import jmp.spring.vo.ReviewVo;
import lombok.extern.log4j.Log4j;

@Service

@Log4j
public class ReplyServiceimpl implements ReplyService {

	@Autowired
	ReplyMapper mapper;
	
	@Override
	@Transactional 
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
		int res =mapper.update(vo);
		mapper.updateReplyCnt(vo.getBno());
		return res;
	}

	@Override
	public int delete(int rno) {
		//댓글 삭제시 줄어디는 댓글 수를 다시 갱신하기 위해서 rno로 get쿼리를 사용- bno값을 가져와 갱신값 반영.
		ReplyVo vo= mapper.get(rno);
		mapper.updateReplyCnt(vo.getBno());
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVo> getList(int bno,Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getList(bno,cri);
	}

	@Override
	@Transactional 
	public int remove(int rno) {
		ReplyVo vo= mapper.get(rno);
		int res =mapper.remove(rno);
		mapper.updateReplyCnt(vo.getBno());
	
		log.info(res);
		return res;
	}

	@Override
	public int getTotal(int bno) {
		// TODO Auto-generated method stub
		return mapper.getTotal(bno);
	}


	@Override
	public int addReview(ReviewVo rvo) {
		// TODO Auto-generated method stub
		return mapper.addReview(rvo);
	}
	@Override
	public List<ReviewVo> getReview() {
		// TODO Auto-generated method stub
		return mapper.getReview();
	}

}
