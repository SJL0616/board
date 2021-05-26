package jmp.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.AttachFileVo;
import jmp.spring.vo.ReplyVo;

public interface AttachFileService {
	public List<AttachFileVo> getList(int attachno);

	public int getSeq();
	public int insert(AttachFileVo vo);
	public int updatePoster(AttachFileVo vo);
	
	public int delete(String uuid, int attachno);
	public AttachFileVo get(@Param("uuid") String uuid, @Param("attachno") int attachno);
}
