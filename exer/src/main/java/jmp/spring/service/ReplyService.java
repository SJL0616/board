package jmp.spring.service;

import java.util.List;

import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;
import jmp.spring.vo.ReviewVo;


public interface ReplyService {
	
	public int insert(ReplyVo vo);
	public int remove(int rno);
	public ReplyVo get(int bno);
	
	public int update(ReplyVo vo);
	public int delete(int rno);



 
	
	public int addReview(ReviewVo rvo);
	public List<ReviewVo> getReview(int cno);
	public int getReviewRating(int cno);
	public int setContentRating(int rating,int cno);
	public List<ReviewVo> getList(int cno,Criteria cri);
	 public int getTotal(int cno);
}
