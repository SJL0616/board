package jmp.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.CastVo;
import jmp.spring.vo.ContentVo;
import jmp.spring.vo.ContentsVo;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;
import jmp.spring.vo.VideoVo;

public interface FileUploadMapper {

	
	public int addcontents(ContentsVo cvo); //ÄÜÅÙÃ÷ text¾÷·Îµå
	
	public int addcast(CastVo cvo); //ÄÜÅÙÃ÷ text¾÷·Îµå
	public int addcast_match(@Param("cno") int cno,@Param("cast") String cast,@Param("castno") int castno); //ÄÜÅÙÃ÷ text¾÷·Îµå
	public CastVo getcastByName(String castname);
	
	public int addVideo(VideoVo vvo);
	public List<VideoVo> getAllVideo(int cno);
	public List<VideoVo> getAllVideoD(int cno);
	public VideoVo getOneVideo(int vno);
	
	public List<ContentVo> getAllList();
	
	public List<ContentVo> getList(int attachno);
	
	public int getSeq();
	public int insert(ContentVo vo);
	public int updatePoster(ContentVo vo);//ÄÜÅÙÃ÷ Æ÷½ºÅÍÀÌ¹ÌÁö ¾÷·Îµå
	
	
	/*
	 * public int delete(@Param("uuid") String uuid, @Param("attachno") int
	 * attachno);
	 */
	 
	public ContentVo get(int cno);
	public ContentVo getBycname (String cname);
}
