package jmp.spring.control;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import jmp.spring.mapper.UserMapper;
import jmp.spring.service.UserService;
import jmp.spring.vo.UserVo;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController {

	@Autowired
	UserService service;
	
	@GetMapping("/board/login")
	public void showLogin() {
		
	}
	@PostMapping("/board/loginAction")
	public String LoginProcess(UserVo vo, Model model, HttpServletRequest request) {
			
	 UserVo uvo=service.login(vo.getId(), vo.getPwd());
		if(uvo==null) {
		    model.addAttribute("msg", "�α����� �����߽��ϴ�.");
		    return "/board/login";
		}else {
			HttpSession session = request.getSession();
			model.addAttribute("msg", uvo.getName()+"�� ����ʽÿ�.");
		  
			List<String> role = service.userRole(vo.getId());
			uvo.setRole(role);//���� role vo�� ����.
			  log.info("==================="+uvo);	
			  /*
			Boolean hasRole= uvo.hasRole(role);  
			 log.info("==================="+hasRole);	
			
			 * for(String roles : role) { if(role.equals("ROLE_ADMIN")) {
			 * session.setAttribute("sessionId", uvo); } }
			
			if(hasRole==true) {
				session.setAttribute("sessionId", "admin");
			}else {
				session.setAttribute("sessionId", "user");
			} */
			 
			 session.setAttribute("user", uvo);
			 
			log.info("==================="+session.getAttribute("user"));	
			model.addAttribute("user",uvo);
			return"/board/loginSuccess";
		}
	 
	
	}
	
	@GetMapping("/board/logout")
	public String logOutProccess(HttpServletRequest request, Model model, HttpServletResponse response) {
		HttpSession session =request.getSession();
		session.invalidate();
		
		//�ڵ��α��� ��Ű����.
		//�α׾ƿ��� �ϰ� �Ǹ� ���̻� �ڵ��α����� �� ���� �����ϴ�.
		Cookie cookie= WebUtils.getCookie(request, "loginCookie");
		if(cookie!=null) {
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		}
		model.addAttribute("msg", "���������� �α׾ƿ��Ǿ����ϴ�.");
		return "/board/login";
	}
	
	
}
