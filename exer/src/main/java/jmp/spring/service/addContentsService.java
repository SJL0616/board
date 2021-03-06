package jmp.spring.service;

import java.util.List;

import jmp.spring.vo.CastVo;
import jmp.spring.vo.ContentVo;
import jmp.spring.vo.ContentsVo;
import jmp.spring.vo.ReviewVo;
import jmp.spring.vo.VideoVo;

public interface addContentsService {

	public int addcontents(ContentsVo cvo);
	
	public int addcast(CastVo cvo);
	
	public int addVideo(VideoVo vvo);
	public List<VideoVo> getAllVideo(int cno);
	public List<VideoVo> getAllVideoD(int cno);
	public VideoVo getOneVideo(int vno);

	
	
	public int addcast_match(int cno, String cast, int castno); 
	public CastVo getcastByName(String castname);
	public List<CastVo>getCastList(int cno);//cno(작품 번호)로 cast목록 가져오는 maaper
	public List<ContentVo> getIndexList(String type);  // 메인페이지 이미지+ 정보 출력 쿼리
	public List<ContentVo> getAllList();
	public List<ContentVo> getFilteredList(ContentVo cvo);//필터된 리스트 출력
	
	public List<ContentVo> getSearchedCListByCast(String word);  // 배우 이름으로 컨텐츠 정보 출력(검색페이지)
	public List<CastVo> getCastListByName(String word);  // 배우 정보 배우 이름으로 가져오기
	public List<ContentVo> getSearchedCListByCname(String word);  // 배우 정보 배우 이름으로 가져오기
	
}
