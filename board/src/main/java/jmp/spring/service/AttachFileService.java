package jmp.spring.service;

import java.util.List;

import jmp.spring.vo.AttachFileVo;
import jmp.spring.vo.ReplyVo;

public interface AttachFileService {
	public List<AttachFileVo> getList(int attachno);
	public int getSeq();
	public int insert(AttachFileVo vo);
	
}
