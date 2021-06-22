package jmp.spring.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.AutomapConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.log4j.Log4j;
import jmp.spring.service.UserService;
import jmp.spring.vo.User;

@Log4j
public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	UserService userService;
	
	/**
	 * This implementation always returns {@code true}.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		log.info("authinterceptor=================="+user);
		
		if(user == null) {
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				user = userService.loginSessionkey(loginCookie.getValue());
				
				session.setAttribute("user", user);				
			}
			
		}
		
		
		if( user != null) {
			System.out.println("=================="+user);
			if(user.hasRole("ROLE_USER") || user.hasRole("ROLE_ADMIN")) {
				return true;
			}
			 else {
				System.out.println(request.getRequestURI());
				System.out.println(request.getQueryString());
				
				
				String tmpUri = request.getRequestURI();
				String queryString = request.getQueryString();
				if(!StringUtils.isEmpty(queryString)) {
					tmpUri += "?"+queryString; 
				} 
				session.setAttribute("tmpUri", tmpUri);
				
				response.sendRedirect("/login2");
				return false;
			}
			
		} else {
			response.sendRedirect("/login2");
			return false;
		}
		
	}

	/**
	 * This implementation is empty.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}
}
