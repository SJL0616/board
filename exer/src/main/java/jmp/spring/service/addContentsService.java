package jmp.spring.service;

import java.util.List;

import jmp.spring.vo.CastVo;
import jmp.spring.vo.ContentVo;
import jmp.spring.vo.ContentsVo;
import jmp.spring.vo.VideoVo;

public interface addContentsService {

	public int addcontents(ContentsVo cvo);
	
	public int addcast(CastVo cvo);
	
	public int addVideo(VideoVo vvo);
	public List<VideoVo> getAllVideo(int cno);
	
	
	public int addcast_match(int cno, String cast, int castno); 
	public CastVo getcastByName(String castname);
	
	public List<ContentVo> getAllList();
	
	
	
}
