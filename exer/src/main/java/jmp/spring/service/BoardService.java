package jmp.spring.service;

import java.util.List;

import jmp.spring.vo.BoardVo;
import jmp.spring.vo.Criteria;

public interface BoardService {

	
	public List<BoardVo> getListWithPaging(Criteria cri);
	
	public BoardVo get(int bno);
	
	public int getTotal();
	public int getTotal2(Criteria cri);
	public int updateBoard(BoardVo vo);
	
	public int deleteBoard(int bno);
	public BoardVo selectOneBoard(int bno);
	
	
	public List<BoardVo> selectALLBoard();
	
	public int insertBoard(BoardVo vo);
	
	public List<BoardVo> search(Criteria cri);
}
