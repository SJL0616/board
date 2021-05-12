package jmp.spring.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import jmp.spring.service.UserService;
import jmp.spring.vo.UserVo;
import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		return true;
	}

	/**
	 * This implementation is empty.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		//�α��� ��Ʈ�ѷ��� ����� ���� 
		//"user"��ü�� sessionId�� �����Ǿ� �ִٸ�/ => �ڵ��α����� ���� ��Ű�� ������ �����.
		
		HttpSession session = request.getSession();
		UserVo user= (UserVo) session.getAttribute("user");
		
		log.info("=================COOKIE Ȯ��=:"+user);
		log.info("=================useCokkie Ȯ��=:");
		
		log.info(request.getParameter("useCokkie"));
		/* StringUtils.isEmpty(request.getAttribute("useCokkie")); */
		
		//User ���̺� ��Ű ������ �����Ϸ��� ��.
		//userid, sessionkey= ���Ǿ��̵� ������.
		//
		user.setSessionkey(session.getId());
		
		service.updateSessionkey(user);//���� ���� user���̺� ����.
		
		if(user !=null &&request.getParameter("useCokkie") !=null) {//�α����� �ؼ� 
			//�ڵ��α����� ���� ��Ű����
			Cookie loginCookie =  new Cookie("loginCookie", session.getId());//jsessoion���� ���������� ��Ű������
			log.info(request.getParameter("useCokkie"));
			loginCookie.setMaxAge(60*60*24*7); //��Ű �����ð� ����
			loginCookie.setPath("/");//��� ��ο��� ���ǰ� ��.
			
			//��Ű�� ���� =>> response ��ü�� ����.
		    response.addCookie(loginCookie);
		
		}
		
	}
}
