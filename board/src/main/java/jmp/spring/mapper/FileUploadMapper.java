package jmp.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jmp.spring.vo.AttachFileVo;
import jmp.spring.vo.Criteria;
import jmp.spring.vo.ReplyVo;

public interface FileUploadMapper {

	public List<AttachFileVo> getList(int attachno);
	public int getSeq();
	public int insert(AttachFileVo vo);
	
	
}
