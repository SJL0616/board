package jmp.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import jmp.spring.vo.UserVo;
import lombok.extern.log4j.Log4j;


@Log4j
public class Sampleinterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		log.info("preHandle=====================================");
		log.info(request);
		log.info(response);
		log.info(handler);
		log.info("/sampleInterceptor=====================================");
		
		HttpSession session  = request.getSession();
		UserVo user=  (UserVo) session.getAttribute("user");
		if(user==null) {
			response.sendRedirect("/board/login");
			return false;
		} /*
			 * else { //로그인이 되어있으면 권한이 있는지 표시. user.hasRole("ROLE_ADMIN"); }
			 */
		return true;
	}

	/**
	 * This implementation is empty.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		log.info("postHandle=====================================");
		log.info(request);
		log.info(response);
		log.info(handler);
		log.info(modelAndView);
		log.info("/sampleInterceptor=====================================");
	}

	
	
}
