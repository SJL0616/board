package jmp.spring.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import jmp.spring.service.UserService;
import jmp.spring.vo.ManuVo;
import jmp.spring.vo.UserVo;
import lombok.extern.log4j.Log4j;


@Log4j
public class ManuInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle=====================================");
	
		log.info("/manuInterceptor=====================================");
		
	    //���ǿ� menu�� ������ �޴��� ��ȸ�ؼ� ���ǿ� ����.
		HttpSession session =request.getSession();
		
		if(session.getAttribute("manu") ==null) {
		List<ManuVo> list=	service.createMenu();
		//�޴��� ��ȸ	
			session.setAttribute("manu", list);
		}
		log.info("=====================================session manu"+ session.getAttribute("manu"));
		return true;
	}

	/**
	 * This implementation is empty.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		
	}

	
	
}
