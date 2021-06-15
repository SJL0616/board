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
	
	public List<ContentVo> getAllList();
	
	
	
}
