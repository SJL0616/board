package jmp.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jmp.spring.mapper.FileUploadMapper;
import jmp.spring.vo.CastVo;
import jmp.spring.vo.ContentVo;
import jmp.spring.vo.ContentsVo;
import jmp.spring.vo.ReviewVo;
import jmp.spring.vo.VideoVo;
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
	@Override
	public int addVideo(VideoVo vvo) {
		// TODO Auto-generated method stub
		return mapper.addVideo(vvo);
	}
	@Override
	public List<VideoVo> getAllVideo(int cno) {
		// TODO Auto-generated method stub
		return mapper.getAllVideo(cno);
	}
	@Override
	public List<VideoVo> getAllVideoD(int cno) {
		// TODO Auto-generated method stub
		return mapper.getAllVideoD(cno);
	}
	@Override
	public VideoVo getOneVideo(int vno) {
		// TODO Auto-generated method stub
		return mapper.getOneVideo(vno);
	}
	@Override
	public List<CastVo> getCastList(int cno) {
		// TODO Auto-generated method stub
		return mapper.getCastList(cno);
	}
	@Override	  // 메인페이지 이미지+ 정보 출력 쿼리
	public List<ContentVo> getIndexList(String type) {
		// TODO Auto-generated method stub
		return mapper.getIndexList(type);
	}
	@Override
	public List<ContentVo> getFilteredList(ContentVo cvo) {
		// TODO Auto-generated method stub
		return mapper.getFilteredList(cvo);
	}
	@Override
	public List<ContentVo> getSearchedCListByCast(String word) {
		// TODO Auto-generated method stub
		return mapper.getSearchedCListByCast(word);
	}
	@Override
	public List<CastVo> getCastListByName(String word) {
		// TODO Auto-generated method stub
		return mapper.getCastListByName(word);
	}
	@Override
	public List<ContentVo> getSearchedCListByCname(String word) {
		// TODO Auto-generated method stub
		return mapper.getSearchedCListByCname(word);
	}


}
