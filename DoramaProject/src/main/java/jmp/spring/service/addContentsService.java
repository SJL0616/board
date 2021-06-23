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
	public List<CastVo>getCastList(int cno);//cno(��ǰ ��ȣ)�� cast��� �������� maaper
	public List<ContentVo> getIndexList(String type);  // ���������� �̹���+ ���� ��� ����
	public List<ContentVo> getAllList();
	public List<ContentVo> getTureAllList();
	public List<ContentVo> getFilteredList(ContentVo cvo);//���͵� ����Ʈ ���
	
	public List<ContentVo> getSearchedCListByCast(String word);  // ��� �̸����� ������ ���� ���(�˻�������)
	public List<CastVo> getCastListByName(String word);  // ��� ���� ��� �̸����� ��������
	public List<ContentVo> getSearchedCListByCname(String word);  // ��� ���� ��� �̸����� ��������
	public int notRec(int cno); //
	public int Rec(int cno); //
	public int notshow(int cno); //
	public int show(int cno); //
	
}
