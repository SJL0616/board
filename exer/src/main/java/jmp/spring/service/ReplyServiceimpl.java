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
		
		return res;
	}


	/*
	 * 
	 * 
	 * @Override public int update(ReplyVo vo) { int res =mapper.update(vo);
	 * mapper.updateReplyCnt(vo.getBno()); return res; }
	 * 
	 * @Override public int delete(int rno) { //댓글 삭제시 줄어디는 댓글 수를 다시 갱신하기 위해서 rno로
	 * get쿼리를 사용- bno값을 가져와 갱신값 반영. ReplyVo vo= mapper.get(rno);
	 * mapper.updateReplyCnt(vo.getBno()); return mapper.delete(rno); }
	 */

	@Override
	public List<ReviewVo> getList(int cno,Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getList(cno,cri);
	}

	/*
	 * @Override
	 * 
	 * @Transactional public int remove(int rno) { ReplyVo vo= mapper.get(rno); int
	 * res =mapper.remove(rno); mapper.updateReplyCnt(vo.getBno());
	 * 
	 * log.info(res); return res; }
	 */

	@Override
	public int getTotal(int cno) {
		// TODO Auto-generated method stub
		return mapper.getTotal(cno);
	}


	@Override
	public int addReview(ReviewVo rvo) {
		// TODO Auto-generated method stub
		return mapper.addReview(rvo);
	}
	@Override
	public List<ReviewVo> getReview(int cno) {
		// TODO Auto-generated method stub
		return mapper.getReview(cno);
	}

	@Override
	public int setContentRating(int rating,int cno) {
		// TODO Auto-generated method stub
		return mapper.setContentRating(rating,cno);
	}

	@Override
	public int getReviewRating(int cno) {
		// TODO Auto-generated method stub
		return mapper.getReviewRating(cno);
	}
	@Override
	public int getReplyTotal(int vno) {
		// TODO Auto-generated method stub
		return mapper.getReplyTotal(vno);
	}
	@Override
	public List<ReplyVo> get(int vno, Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.get(vno, cri);
	}


	@Override
	public int setRe_rno(int re_rno, int rno) {
		// TODO Auto-generated method stub
		return mapper.setRe_rno(re_rno, rno);
	}


	@Override
	public int getSeq_Currval() {
		// TODO Auto-generated method stub
		return mapper.getSeq_Currval();
	}


	@Override
	public List<ReplyVo> getRe_reply() {
		// TODO Auto-generated method stub
		return mapper.getRe_reply();
	}

}
