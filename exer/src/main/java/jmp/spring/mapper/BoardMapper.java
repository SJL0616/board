package jmp.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import jmp.spring.vo.BoardVo;
import jmp.spring.vo.Criteria;

public interface BoardMapper {
	//자습
	public List<BoardVo> RowNum();
	
	public int deleteBoard(int bno);
	public BoardVo selectOneBoard(int bno);
	
	//백업 db 입력
	public int bkInsert(int bno);
	
	//페이징
	public List<BoardVo> getListWithPaging(Criteria cri);
	public List<BoardVo> getListWithPaging2(Criteria cri);
	public List<BoardVo> search(Criteria cri);
	
	//전체 게시물 수 
	public int getTotal();
	public int getTotal2(Criteria cri);
	
	//get(상세보기 페이지)
	public BoardVo get(int bno);
	
	//업데이트
	public int updateBoard(BoardVo vo);
	
	//업데이트 insert delete int를 반환받는다
	public int insertBoard(BoardVo vo);
	
	public List<BoardVo> selectALLBoard();
	
	 void selectPerson(int bno);
	 
	 void selectAll();
	
	String getTime2();
	
	
	//荑쇰━ 蹂대궡湲�  
	@Select("select sysdate from dual")
	public String getTime() ;

	
}
