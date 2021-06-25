package jmp.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.ContentVo;
import jmp.spring.vo.ReplyVo;

public interface AttachFileService {
	public List<ContentVo> getList(int attachno);

	public int getSeq();
	public int insert(ContentVo vo);
	public int updatePoster(ContentVo vo);
	public int updatePoster2(ContentVo vo);
	
	/* public int delete(String uuid, int attachno); */
	public ContentVo get(int cno);
	public ContentVo getBycname (String cname);
}
