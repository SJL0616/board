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
		log.info("����");
		if(uvo==null) {
			model.addAttribute("msg", "�̸����� Ȯ�����ּ���.");
			return "/board/findPwd";
		}else {
		model.addAttribute("uvo", uvo);
		  log.info("���� ����");
		
		return "/board/login";
		}
	}
	
	@PostMapping("/board/sendEmail")
	public String registerMember(UserVo user, Model model) {
		
	UserVo uvo =service.findId2(user);
		if(uvo==null) {
			model.addAttribute("msg", "���̵� Ȯ�����ּ���.");
			
			return "/board/findPwd";
		}else {
			String tpwd= service.sendMail(user);
		log.info("===================�ӽ� ��й�ȣ"+tpwd);	
		log.info("����");
		ms.welcomeMailSend(tpwd);
		  log.info("���� ����");
		model.addAttribute("msg", "�̸��Ͽ� �ӽ� ��й�ȣ�� �߱޵Ǿ����ϴ�.");
		return "/board/login";
		}
	}
	@PostMapping("/board/registerMember")
	public String registerMember(UserVo user, Model model, HttpServletRequest request) {
		
		UserVo uvo= service.findId2(user);
		if(uvo !=null) {
			model.addAttribute("msg", "���̵� �ߺ��˴ϴ�.");
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
		    model.addAttribute("msg", "���̵�� ��й�ȣ��  �Է����ּ���.");
		    log.info("===================model.msg"+model);	
		    return "/board/login";
		}else {
			 UserVo uvo=service.login(vo);
			 if (uvo==null) {
				 model.addAttribute("msg", "���̵�� ��й�ȣ�� Ȯ���ϼ���.");
				    return "/board/login";
			 }
			 log.info("==================="+uvo);	
			HttpSession session = request.getSession();
			model.addAttribute("msg", uvo.getName()+"�� ����ʽÿ�.");
		  /*
			List<String> role = service.userRole(vo.getId());
			uvo.setRole(role);//���� role vo�� ����.*/
			 
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
		
		
		/*����
		//�ڵ��α��� ��Ű����.
		//�α׾ƿ��� �ϰ� �Ǹ� ���̻� �ڵ��α����� �� ���� �����ϴ�.loginCookie
		Cookie cookie= WebUtils.getCookie(request, "loginCookie");
		if(cookie!=null) {
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		}
		*/
		
		model.addAttribute("msg", "���������� �α׾ƿ��Ǿ����ϴ�.");
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
