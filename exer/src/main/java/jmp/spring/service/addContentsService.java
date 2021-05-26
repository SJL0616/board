package jmp.spring.service;

import java.util.List;

import jmp.spring.vo.AttachFileVo;
import jmp.spring.vo.ContentsVo;

public interface addContentsService {

	public int addcontents(ContentsVo cvo);
	
	public List<AttachFileVo> getAllList();
}
