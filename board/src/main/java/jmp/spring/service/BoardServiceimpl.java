package jmp.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jmp.spring.mapper.BoardMapper;
import jmp.spring.vo.BoardVo;
import jmp.spring.vo.Criteria;

@Service
public class BoardServiceimpl implements BoardService {

	@Autowired
	BoardMapper mapper;
	
	@Override
	public List<BoardVo> selectALLBoard() {
		return mapper.selectALLBoard();
		// TODO Auto-generated method stub
	
	}

	@Override
	public int insertBoard(BoardVo vo) {

		return mapper.insertBoard(vo);
	}

	@Override
	public int deleteBoard(int bno) {
		// TODO Auto-generated method stub
		return mapper.deleteBoard(bno);
	}

	@Override
	public BoardVo selectOneBoard(int bno) {
		// TODO Auto-generated method stub
		return mapper.selectOneBoard(bno);
	}

	@Override
	public int updateBoard(BoardVo vo) {
		
		return mapper.updateBoard(vo);
	}

	@Override
	public BoardVo get(int bno) {
		// TODO Auto-generated method stub
		return mapper.get(bno);
	}

	@Override
	public List<BoardVo> getListWithPaging(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return mapper.getTotal();
	}

	@Override
	public List<BoardVo> search(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.search(cri);
	}

	@Override
	public int getTotal2(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal2(cri);
	}

}
