package jmp.spring.service;

import java.io.Console;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jdk.internal.org.jline.utils.Log;
import jmp.spring.mapper.ReplyMapper;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;
import lombok.extern.log4j.Log4j;

@Service
@Transactional
@Log4j
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
		
		mapper.updateReplyCnt(vo.getBno());
		return mapper.update(vo);
	}

	@Override
	public int delete(int rno) {
		//��� ������ �پ��� ��� ���� �ٽ� �����ϱ� ���ؼ� rno�� get������ ���- bno���� ������ ���Ű� �ݿ�.
		ReplyVo vo= mapper.get(rno);
		mapper.updateReplyCnt(vo.getBno());
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVo> getList(int bno,Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getList(bno,cri);
	}

	@Override
	public int remove(int rno) {
		ReplyVo vo= mapper.get(rno);
		int res =mapper.remove(rno);
		mapper.updateReplyCnt(vo.getBno());
	
		log.info(res);
		return res;
	}

	@Override
	public int getTotal(int bno) {
		// TODO Auto-generated method stub
		return mapper.getTotal(bno);
	}




}
