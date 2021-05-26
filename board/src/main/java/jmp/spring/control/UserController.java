package jmp.spring.control;

import java.util.List;
import java.util.Properties;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import jmp.spring.mapper.UserMapper;
import jmp.spring.service.MailService;
import jmp.spring.service.UserService;
import jmp.spring.vo.UserVo;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController {

	@Autowired
	UserService service;
	
	@Autowired MailService ms;
	 @Autowired Properties props;
	 
	@GetMapping("/board/member")
	public void showMemberPage() {
		
	}
	@GetMapping("/board/findPwd")
	public void showMember() {
		
	}
	
	
	@PostMapping("/board/showid")
	public String showMember(UserVo user, Model model) {
		
		UserVo uvo= service.findId(user);
		
		log.info("===================uvo"+uvo);	
		log.info("실행");
		if(uvo==null) {
			model.addAttribute("msg", "이메일을 확인해주세요.");
			return "/board/findPwd";
		}else {
		model.addAttribute("uvo", uvo);
		  log.info("실행 성공");
		
		return "/board/login";
		}
	}
	
	@PostMapping("/board/sendEmail")
	public String registerMember(UserVo user, Model model) {
		
	UserVo uvo =service.findId2(user);
		if(uvo==null) {
			model.addAttribute("msg", "아이디를 확인해주세요.");
			
			return "/board/findPwd";
		}else {
			String tpwd= service.sendMail(user);
		log.info("===================임시 비밀번호"+tpwd);	
		log.info("실행");
		ms.welcomeMailSend(tpwd);
		  log.info("실행 성공");
		model.addAttribute("msg", "이메일에 임시 비밀번호가 발급되었습니다.");
		return "/board/login";
		}
	}
	@PostMapping("/board/registerMember")
	public String registerMember(UserVo user, Model model, HttpServletRequest request) {
		
		UserVo uvo= service.findId2(user);
		if(uvo !=null) {
			model.addAttribute("msg", "아이디가 중복됩니다.");
			return "/board/member";
		
		}
		
		try {
	 	int res =service.insertUser(user);
		if(res>0)
		{return "forward:/board/loginAction";
			
		}else {
			return "/board/error";
		}
		
		}catch (Exception e) {
			return "/board/error";
		}
		
	}
	@GetMapping("/board/login")
	public void showLogin() {
		
	}
	@PostMapping("/board/loginAction")
	public String LoginProcess(UserVo vo, Model model, HttpServletRequest request) {
			
	
		log.info("==================="+vo);	
		if(vo.getId()== "" || vo.getPwd()=="") {
		    model.addAttribute("msg", "아이디와 비밀번호를  입력해주세요.");
		    log.info("===================model.msg"+model);	
		    return "/board/login";
		}else {
			 UserVo uvo=service.login(vo);
			 if (uvo==null) {
				 model.addAttribute("msg", "아이디와 비밀번호를 확인하세요.");
				    return "/board/login";
			 }
			 log.info("==================="+uvo);	
			HttpSession session = request.getSession();
			model.addAttribute("msg", uvo.getName()+"님 어서오십시오.");
		  /*
			List<String> role = service.userRole(vo.getId());
			uvo.setRole(role);//유저 role vo에 저장.*/
			 
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
		
		
		Cookie cookie = WebUtils.getCookie(request, "loginCookie");
		if(cookie!=null) {
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		
		
		/*연습
		//자동로그인 쿠키제거.
		//로그아웃을 하게 되면 더이상 자동로그인을 할 수가 없습니다.loginCookie
		Cookie cookie= WebUtils.getCookie(request, "loginCookie");
		if(cookie!=null) {
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		}
		*/
		
		model.addAttribute("msg", "정상적으로 로그아웃되었습니다.");
		return "/board/login";
	}
	
	//
	@GetMapping("/idCheckAjax/{id}")
	@ResponseBody
	public boolean getlist(@PathVariable("id") String id){
		
		UserVo list= service.findId3(id);
		log.info("====================list:"+list);
		if(list !=null) {
			return true;
		}else {
			return false;
		}
		
	}
	
	
	
	
}
