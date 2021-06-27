package jmp.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.CastVo;
import jmp.spring.vo.ContentVo;
import jmp.spring.vo.ContentsVo;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;
import jmp.spring.vo.ReviewVo;
import jmp.spring.vo.User;
import jmp.spring.vo.VideoVo;

public interface FileUploadMapper {

	
	public int addcontents(ContentsVo cvo); //������ text���ε�
	
	public int addcast(CastVo cvo); //������ text���ε�
	public int addcast_match(@Param("cno") int cno,@Param("cast") String cast,@Param("castno") int castno); //������ text���ε�
	
	public int saveMatch(@Param("cno") int cno,@Param("id") String id,@Param("vno") int vno); //������ text���ε�
	public int insertMatch(@Param("cno") int cno,@Param("id") String id,@Param("vno") int vno); //������ text���ε�
	public User getMatch(@Param("cno") int cno,@Param("id") String id); //������ text���ε�
	public List<ContentVo> getVMatchList(String id);
	
	public CastVo getcastByName(String castname);
	public List<CastVo>getCastList(int cno);
	
	public int addVideo(VideoVo vvo);
	public List<VideoVo> getAllVideo(int cno);
	public List<VideoVo> getAllVideoD(int cno);
	public VideoVo getOneVideo(int vno);
	
	public List<ContentVo> getAllList();//����������Ʈ ���
	public List<ContentVo> getTureAllList();//����������Ʈ ���
	public List<ContentVo> getFilteredList(ContentVo cvo);//���͵� ����Ʈ ���
	
	
	public List<ContentVo> getList(int attachno);
	
	public int getSeq();
	public int insert(ContentVo vo);
	public int updatePoster(ContentVo vo);//������ �������̹��� ���ε�
	public int updatePoster2(ContentVo vo);//������ �������̹��� ���ε�
	
	public int addReview(ReviewVo rvo);//���� ���ε�
	public int getReview(ReviewVo rvo);
	
	
	/*
	 * public int delete(@Param("uuid") String uuid, @Param("attachno") int
	 * attachno);
	 */
	 
	public ContentVo get(int cno); //show contents ���� �����ֱ�
	public int notRec(int cno); //
	public int Rec(int cno); //
	public int notshow(int cno); //
	public int show(int cno); //
	public List<ContentVo> getIndexList(String type);  // ���������� �̹���+ ���� ��� ����
	public ContentVo getBycname (String cname);
	
	
	public List<ContentVo> getSearchedCListByCast(String word);  // ��� �̸����� ������ ���� ���(�˻�������)
	public List<CastVo> getCastListByName(String word);  // ��� ���� ��� �̸����� ��������
	public List<ContentVo> getSearchedCListByCname(String word);  // ��� ���� ��� �̸����� ��������
	
}
