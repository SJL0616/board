package jmp.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.CastVo;
import jmp.spring.vo.ContentVo;
import jmp.spring.vo.ContentsVo;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;
import jmp.spring.vo.ReviewVo;
import jmp.spring.vo.VideoVo;

public interface FileUploadMapper {

	
	public int addcontents(ContentsVo cvo); //콘텐츠 text업로드
	
	public int addcast(CastVo cvo); //콘텐츠 text업로드
	public int addcast_match(@Param("cno") int cno,@Param("cast") String cast,@Param("castno") int castno); //콘텐츠 text업로드
	public CastVo getcastByName(String castname);
	public List<CastVo>getCastList(int cno);
	
	public int addVideo(VideoVo vvo);
	public List<VideoVo> getAllVideo(int cno);
	public List<VideoVo> getAllVideoD(int cno);
	public VideoVo getOneVideo(int vno);
	
	public List<ContentVo> getAllList();//컨텐츠리스트 출력
	public List<ContentVo> getFilteredList(ContentVo cvo);//필터된 리스트 출력
	
	
	public List<ContentVo> getList(int attachno);
	
	public int getSeq();
	public int insert(ContentVo vo);
	public int updatePoster(ContentVo vo);//콘텐츠 포스터이미지 업로드
	
	public int addReview(ReviewVo rvo);//리뷰 업로드
	public int getReview(ReviewVo rvo);
	
	
	/*
	 * public int delete(@Param("uuid") String uuid, @Param("attachno") int
	 * attachno);
	 */
	 
	public ContentVo get(int cno); //show contents 파일 보여주기
	public List<ContentVo> getIndexList(String type);  // 메인페이지 이미지+ 정보 출력 쿼리
	public ContentVo getBycname (String cname);
	
	
	public List<ContentVo> getSearchedCListByCast(String word);  // 배우 이름으로 컨텐츠 정보 출력(검색페이지)
	public List<CastVo> getCastListByName(String word);  // 배우 정보 배우 이름으로 가져오기
	public List<ContentVo> getSearchedCListByCname(String word);  // 배우 정보 배우 이름으로 가져오기
	
}
