package jmp.spring.service;

import java.util.List;

import jmp.spring.vo.ContentVo;
import jmp.spring.vo.ContentsVo;

public interface addContentsService {

	public int addcontents(ContentsVo cvo);
	
	public List<ContentVo> getAllList();
}
