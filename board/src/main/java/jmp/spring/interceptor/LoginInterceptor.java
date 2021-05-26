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
		//로그인 컨트롤러가 실행된 이후 
		//"user"객체가 sessionId로 생성되어 있다면/ => 자동로그인을 위한 쿠키를 저장이 실행됨.
		
		HttpSession session = request.getSession();
		UserVo user= (UserVo) session.getAttribute("user");
		
		
		/* StringUtils.isEmpty(request.getAttribute("useCokkie")); */
	
		log.info("=================COOKIE 존재 확인=:"+user);
	
		
		log.info("================쿠키 사용 체크확인  ="+request.getParameter("useCookie"));
		
		
		if(!StringUtils.isEmpty(request.getAttribute("useCokkie"))){
		user.setSessionkey(session.getId());
		
		service.updateSessionkey(user);
		}
		
		if(user!=null &&request.getParameter("useCookie")!=null) {
			Cookie loginCookie= new Cookie("loginCookie", session.getId());
			loginCookie.setMaxAge(60*60*24*7);
			loginCookie.setPath("/");
			
			response.addCookie(loginCookie);
			
		}
		
		
		String tmpUri =(String) session.getAttribute("tmpUri");
		log.info("loginIT=================tmpURi:"+tmpUri);
		if(!StringUtils.isEmpty(tmpUri)) {
			/* session.removeAttribute("tmpUri"); */
			response.sendRedirect(tmpUri);
		}
		
		/* 연습 
		 StringUtils.isEmpty(request.getAttribute("useCokkie")); 
		
		//User 테이블에 쿠키 정보를 저장하려고 함.
		//userid, sessionkey= 세션아이디를 저장함.
		//
		
		user.setSessionkey(session.getId());
		
		service.updateSessionkey(user);//세션 값을 user테이블에 저장.
		
		if(user !=null &&request.getParameter("useCookie") !=null) {//로그인을 해서 
			//자동로그인을 위한 쿠키생성
			Cookie loginCookie =  new Cookie("loginCookie", session.getId());//jsessoion값을 마찬가지로 쿠키에저장
			log.info(request.getParameter("useCokkie"));
			loginCookie.setMaxAge(60*60*24*7); //쿠키 유지시간 설정
			loginCookie.setPath("/");//모든 경로에서 사용되게 함.
			
			//쿠키를 저장 =>> response 객체에 저장.
		    response.addCookie(loginCookie);
	
		}*/
			
	}
}
