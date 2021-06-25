package jmp.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jmp.spring.mapper.FileUploadMapper;
import jmp.spring.vo.ContentVo;
import jmp.spring.vo.ReplyVo;
@Service
public class AttachFileServiceimpl implements AttachFileService {

	@Autowired
	FileUploadMapper mapper;
	
	@Override
	public List<ContentVo> getList(int attachno) {
		// TODO Auto-generated method stub
		return mapper.getList(attachno);
	}

	@Override
	public int getSeq() {
		// TODO Auto-generated method stub
		return mapper.getSeq();
	}

	@Override
	public int insert(ContentVo vo) {
		// TODO Auto-generated method stub
		return mapper.insert(vo);
	}

	/*
	 * @Override public int delete(String uuid, int attachno) { // TODO
	 * Auto-generated method stub return mapper.delete(uuid, attachno); }
	 */

	@Override
	public ContentVo get(int cno) {
		// TODO Auto-generated method stub
		return mapper.get(cno);
	}

	@Override
	public int updatePoster(ContentVo vo) {
		// TODO Auto-generated method stub
		return mapper.updatePoster(vo);
	}

	@Override
	public ContentVo getBycname(String cname) {
		// TODO Auto-generated method stub
		return mapper.getBycname(cname);
	}

	@Override
	public int updatePoster2(ContentVo vo) {
		// TODO Auto-generated method stub
		return mapper.updatePoster2(vo);
	}


}
