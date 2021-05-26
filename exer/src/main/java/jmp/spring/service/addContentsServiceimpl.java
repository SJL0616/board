package jmp.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jmp.spring.mapper.FileUploadMapper;
import jmp.spring.vo.AttachFileVo;
import jmp.spring.vo.ContentsVo;
@Service
public class addContentsServiceimpl implements addContentsService {

	
	@Autowired
	FileUploadMapper mapper;
	
	@Override
	public int addcontents(ContentsVo cvo) {
		// TODO Auto-generated method stub
		return mapper.addcontents(cvo);
	}
	@Override
	public List<AttachFileVo> getAllList() {
		// TODO Auto-generated method stub
		return mapper.getAllList();
	}

}
