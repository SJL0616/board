package jmp.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jmp.spring.mapper.FileUploadMapper;
import jmp.spring.vo.AttachFileVo;
import jmp.spring.vo.ReplyVo;
@Service
public class AttachFileServiceimpl implements AttachFileService {

	@Autowired
	FileUploadMapper mapper;
	
	@Override
	public List<AttachFileVo> getList(int attachno) {
		// TODO Auto-generated method stub
		return mapper.getList(attachno);
	}

	@Override
	public int getSeq() {
		// TODO Auto-generated method stub
		return mapper.getSeq();
	}

	@Override
	public int insert(AttachFileVo vo) {
		// TODO Auto-generated method stub
		return mapper.insert(vo);
	}

}
