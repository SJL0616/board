package jmp.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;
import jmp.spring.vo.ReviewVo;

public interface ReplyMapper {

	
	
	
	public int update(ReplyVo vo);
	public int delete(int rno);
	public int remove(int rno);
	
	public int updateReplyCnt(int bno); 
	/* public int updateCNT(int bno); */
	
	
	public int addReview(ReviewVo rvo);
	public List<ReviewVo> getReview(int cno);
	public int getReviewRating(int cno);
	public int setContentRating(@Param("rating") int rating, @Param("cno") int cno);
	public List<ReviewVo> getList(@Param("cno") int cno,@Param("cri")Criteria cri);
	public int getTotal(int cno);

	
	public int setRe_rno(@Param("re_rno") int re_rno, @Param("rno") int rno);
	public int getReplyTotal(int vno);
	public int insert(ReplyVo vo);
	public List<ReplyVo> get(@Param("vno") int vno, @Param("cri")Criteria cri);
	public List<ReplyVo> getRe_reply();
	public int getSeq_Currval();
	
}
