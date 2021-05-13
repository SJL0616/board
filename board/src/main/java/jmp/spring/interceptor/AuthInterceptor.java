package jmp.spring.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import jmp.spring.service.UserService;
import jmp.spring.vo.UserVo;
import lombok.extern.log4j.Log4j;
@Log4j
public class AuthInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		log.info("preHandle=====================================");
		log.info(request);
		log.info(response);
		log.info(handler);
		log.info("/sampleInterceptor=====================================");
		
		HttpSession session = request.getSession();
		UserVo user =(UserVo)session.getAttribute("user");
		log.info(user);
		
		if(user==null) {
		Cookie loginCokkie=	WebUtils.getCookie(request, "loginCookie");
		if(loginCokkie!=null) {
		user = service.loginSessionkey(loginCokkie.getValue());
		session.setAttribute("user", user);
		}
		}
		
		
		
		
		/*
		if(user==null) {
		Cookie loginCookie=	WebUtils.getCookie(request, "loginCookie"); //webUtrils 에서 해당 쿠키를 돌면서 찾아줌.
		if(loginCookie!=null) {
			user= service.loginSessionkey(loginCookie.getValue());	
			session.setAttribute("user", user);
		}
	   
	
		}
		*/
		//유자의 Role을 가지고 있으면 list에 보냄. UserVo의 hasRole 메서드 사용.
		if(user!= null) {
			Boolean hasRole= user.hasRole("ROLE_USER");  
			log.info(hasRole);
			 if(hasRole==true){ 
				 return true; 
			 }
			/*쓸데없이 false 이 반복되는걸 줄임.
			 *  else {
			  response.sendRedirect("/board/login"); return false; }
			 
			
	}else{
		response.sendRedirect("/board/login");
		return false;
	}*/
				}
		//원래 요청했던 페이지와 파라미터를 세션에 저장 => 로그인후에 보내주는 로직
		System.out.println("uri=================="+request.getRequestURI());
		System.out.println("query=================="+request.getQueryString());
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		
		if(query!=null) {
			uri+= "?"+ query;
		}
		
			session.setAttribute("tmpUri", uri);
			log.info("loginIT=================tmpURi:"+session.getAttribute("tmpUri"));
		
				response.sendRedirect("/board/login"); 
				return false;
	}

	/**
	 * This implementation is empty.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}

	/**
	 * This implementation is empty.
	 */

}
