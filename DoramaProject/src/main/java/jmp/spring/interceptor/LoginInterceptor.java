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
import jmp.spring.vo.User;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	
		// �α����� ���� �ߴٸ� = ���ǿ� user��ü�� �����Ǿ��� �ִٸ�
				// ���ǿ� user ��ü�� ���� �ϴ� ���� : /loginAction
				HttpSession session = request.getSession();
				User user = (User)session.getAttribute("user");
			
				System.out.println("interceptor ==================user "+ user);
				System.out.println("useCookie ==================useCookie"+request.getAttribute("useCookie"));
				// �α��ο� ���� �ߴٸ� �ڵ��α����� ���� ��Ű�� ���� �մϴ�.
				// �ڵ��α��ο� üũ�� �Ǿ�����
				
				//StringUtils.isEmpty(request.getAttribute("useCookie"));
				// request.getparameter �� �Ķ���Ͱ��� ������ ���ϴ�
				if(user != null 
						&& request.getParameter("useCookie") != null) {
					
					// Users���̺� ��Ű ������ ���� �մϴ�. 
					// session.getId()�� sessionkey �÷��� �����մϴ� 
					// loginCookie = �ڵ��α��ν� �����ϴ� ��Ű 
					// ���⿡ ����Ǵ� value ���� users���̺��� sessionkey�� ����Ǵ� ���� ���� �ؾ� �մϴ�!!! 
					user.setSessionkey(session.getId());
					userService.updateSessionkey(user);
					
					// �ڵ��α����� ���� ��Ű�� ���� �մϴ�.
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					// ��ȿ�Ⱓ�� PAHT�� ���� �մϴ�.
					loginCookie.setMaxAge(60*60*24*7);
					loginCookie.setPath("/");
					
					
					// �ڵ��α����� ���� ������ ��Ű�� response ��ü�� ���� �մϴ�.
					response.addCookie(loginCookie);
					
					String tmpUri = (String)session.getAttribute("tmpUri");
					
					if(!StringUtils.isEmpty(tmpUri)) {
						response.sendRedirect(tmpUri);
					}
					
					
				}
	}
}
