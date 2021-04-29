package jmp.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jmp.spring.mapper.ReplyMapper;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;

@Service
public class ReplyServiceimpl implements ReplyService {

	@Autowired
	ReplyMapper mapper;
	
	@Override
	public int insert(ReplyVo vo) {
		// TODO Auto-generated method stub
		
		int res= mapper.insert(vo);
	
		
		//����� ������ ����� �Է��� ��, �����Ҷ� ����˴ϴ�.
		//����� �Է�, �����Ҷ� �����.
		//����� ������ ī��Ʈ�ؼ� ���̺��� replycnt �ķ��� ������Ʈ
		 mapper.updateReplyCnt(vo.getBno()); 
		return res;
	}

	@Override
	public ReplyVo get(int bno) {
		// TODO Auto-generated method stub
		return mapper.get(bno);
	}

	@Override
	public int update(ReplyVo vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(int rno) {
		// TODO Auto-generated method stub
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVo> getList(int bno,Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getList(bno,cri);
	}

	@Override
	public int remove(int rno) {
		// TODO Auto-generated method stub
		return mapper.remove(rno);
	}

	@Override
	public int getTotal(int bno) {
		// TODO Auto-generated method stub
		return mapper.getTotal(bno);
	}




}
