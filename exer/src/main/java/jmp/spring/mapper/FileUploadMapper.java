package jmp.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.ContentVo;
import jmp.spring.vo.ContentsVo;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;

public interface FileUploadMapper {

	
	public int addcontents(ContentsVo cvo);
	public List<ContentVo> getAllList();
	
	public List<ContentVo> getList(int attachno);
	
	public int getSeq();
	public int insert(ContentVo vo);
	public int updatePoster(ContentVo vo);
	
	
	/*
	 * public int delete(@Param("uuid") String uuid, @Param("attachno") int
	 * attachno);
	 */
	 
	public ContentVo get(int cno);
}
