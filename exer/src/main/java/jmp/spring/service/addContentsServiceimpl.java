package jmp.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jmp.spring.mapper.FileUploadMapper;
import jmp.spring.vo.CastVo;
import jmp.spring.vo.ContentVo;
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
	public List<ContentVo> getAllList() {
		// TODO Auto-generated method stub
		return mapper.getAllList();
	}
	@Override
	public int addcast_match(int cno, String cast, int castno) {
		// TODO Auto-generated method stub
		return mapper.addcast_match(cno, cast, castno);
	}
	@Override
	public CastVo getcastByName(String castname) {
		// TODO Auto-generated method stub
		return mapper.getcastByName(castname);
	}
	@Override
	public int addcast(CastVo cvo) {
		// TODO Auto-generated method stub
		return mapper.addcast(cvo);
	}

}
