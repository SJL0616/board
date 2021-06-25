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
	
		
		//����� ������ ����� �Է��� ��, �����Ҷ� ����˴ϴ�.
		//����� �Է�, �����Ҷ� �����.
		//����� ������ ī��Ʈ�ؼ� ���̺��� replycnt �ķ��� ������Ʈ
		
		return res;
	}


	/*
	 * 
	 * 
	 * @Override public int update(ReplyVo vo) { int res =mapper.update(vo);
	 * mapper.updateReplyCnt(vo.getBno()); return res; }
	 * 
	 * @Override public int delete(int rno) { //��� ������ �پ��� ��� ���� �ٽ� �����ϱ� ���ؼ� rno��
	 * get������ ���- bno���� ������ ���Ű� �ݿ�. ReplyVo vo= mapper.get(rno);
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


	@Override
	public int remove(int rno) {
		// TODO Auto-generated method stub
		return mapper.remove(rno);
	}

}
