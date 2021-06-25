package jmp.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;
import jmp.spring.vo.ReviewVo;


public interface ReplyService {
	

	
	 public int remove(int rno);
	 /* * 
	 * public int update(ReplyVo vo); public int delete(int rno);
	 */


 
	
	public int addReview(ReviewVo rvo);
	public List<ReviewVo> getReview(int cno);
	public int getReviewRating(int cno);
	public int setContentRating(int rating,int cno);
	public List<ReviewVo> getList(int cno,Criteria cri);
	 public int getTotal(int cno);
	 
	 public int setRe_rno(int re_rno, int rno);
		public int insert(ReplyVo vo);
		public int getReplyTotal(int vno);
		public List<ReplyVo> get(@Param("vno") int vno, @Param("cri")Criteria cri);
		public int getSeq_Currval();
		public List<ReplyVo> getRe_reply();
}
