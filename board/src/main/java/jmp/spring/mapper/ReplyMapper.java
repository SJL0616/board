package jmp.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;

public interface ReplyMapper {

	public int insert(ReplyVo vo);
	public ReplyVo get(int bno);
	public List<ReplyVo> getList(@Param("bno") int bno,@Param("cri")Criteria cri);
	public int update(ReplyVo vo);
	public int delete(int rno);
	public int remove(int rno);
	public int getTotal(int bno);
	public int updateReplyCnt(int bno); 
	/* public int updateCNT(int bno); */
}
