package jmp.spring.control;

import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import jdk.internal.org.jline.utils.Log;
import jmp.spring.vo.PageNavi;
import jmp.spring.vo.Criteria;
import lombok.extern.log4j.Log4j;
import jmp.spring.service.MailService;
import jmp.spring.service.UserService;
import jmp.spring.vo.User;

@Log4j
@Controller
public class UserController {

	@Autowired
	MailService ms;
	
	@Autowired
	UserService service;
	
	@GetMapping("/index")
	public void index() {
		
	}
	
	@PostMapping("/updateRole")
	@ResponseBody
	public Map<String, String> updateRole(@RequestBody User user) {
		log.info("유저객체====================="+user);
		Map<String, String> map = new HashMap<String, String>();
		if(user!=null) {
			int result = service.updateRole(user);
			if(result >0) {
				map.put("Msg", "권한 변경에 성공했습니다.");
				return map;
			}else {
				map.put("Msg", "권한 변경에 실패했습니다.");
				return map;
			}
		}else {
			map.put("Msg", "권한 변경에 실패했습니다.");
			return map;
		}
	}
	
	@GetMapping("/memberList")
	public void memberListShow(Criteria cri,Model model) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageNavi",new PageNavi(cri, service.getTotal(cri)));
	}
	@GetMapping("/editMember")
	public void editMemberPage() {
		
	}

	@PostMapping("/editMember")
	@ResponseBody
	public Map<String, String> editMember(@RequestBody User user, HttpServletRequest req) {
		
		//user정보를 화면으로부터 받아와서 정보를 업데이트 시켜줌
		int resUpdate = service.updateMember(user);
		Map<String, String> res = new HashMap<String, String>();
		if(resUpdate>0) {
			//세션정보수정
			HttpSession session = req.getSession();
			session.removeAttribute("user");
			
			session.setAttribute("user", service.login(user));
			res.put("Msg", "수정이 완료됐습니다.");
		}else {
			res.put("Msg", "수정이 실패했습니다. 정보를 확인하세요");
		}
		
		return res;
	}
	
	@GetMapping("/viewMember")
	public void viewMember() {
		
	}
	
	@GetMapping("/checkSession")
	public void checkSession() {
		
	}
	
	@GetMapping("/pwdSearch")
	public void pwdSearchPage() {
		
	}
	
	@PostMapping("/pwdSearch")
	public String pwdSearch(User user, Model model) {
		User res = service.pwdSearch(user);
		if(res!=null) {
			String pwd = UUID.randomUUID().toString().substring(0,7);
			res.setPwd(pwd);
			 service.updatePwd(res);
			ms.changePwd(pwd);
			model.addAttribute("idMsg", "메일로 비밀번호를 발송 했습니다.");
			return "/login2";
		}
		else {
			model.addAttribute("idMsg", "일치하는 아이디와 이메일이 없습니다. 확인부탁드립니다.");
			return "/login2";
		}
	}
	
	
	@PostMapping("/idSearch")
	public String idSearch(User user, Model model) {
		log.info("======================id찾기");
		User res = service.idSearch(user);
		log.info("======================id찾기"+res);
		if(res != null) {
			model.addAttribute("idMsg","당신의 아이디는"+res.getId()+"입니다.");
			return "/login2";
		}else {
			model.addAttribute("idMsg", "일치하는 아이디가 없습니다.");
			return "/idSearch";
		}
	}
	
	@GetMapping("/idSearch")
	public void idSearchPage() {
		
	}
	
	@GetMapping("/member")
	public void member() {
		
	}
	@GetMapping("/login2")
	public void login2() {
		
	}
	@GetMapping("/loginAction")
	public void loginAction() {
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req, HttpServletResponse res) {
		//로그아웃할 때 해야하는일이 더이상 로그인이안되어있어ㅑ함
		
		
		HttpSession session = req.getSession();
		//세션에 있는 유저 객체를 삭제
		session.invalidate();
		
		// 자동로그인 쿠키를 제거 해줍니다.
		// 로그아웃을 하게 되면 더이상 자동로그인을 할 수 가 없습니다.
		Cookie loginCookie = WebUtils.getCookie(req, "loginCookie");
		
		//자동로그인 체크를 안했으면 loginCookie가 null
		if(loginCookie !=null) {
			loginCookie.setMaxAge(0);
			loginCookie.setPath("/");
			
			res.addCookie(loginCookie);
			
			return "/login2";
			
		}
		return "/login2";
	}
	
	
	@PostMapping("/loginAction")
	public String loginAction(User vo, Model model,HttpServletRequest req,Criteria cri) {
		
		try {
			User user = service.login(vo);		
			if(user!=null) {
				
					HttpSession session = req.getSession();
					session.setAttribute("user", user);
					if(user.hasRole("ROLE_USER")) {
						model.addAttribute("Msg",user.getId());
						return "/index";
					}else if(user.hasRole("ROLE_ADMIN")) {
						log.info("관리자로그인"+user);
						model.addAttribute("Msg",user.getId()+"님은 관리자 입니다.");
						log.info(cri);
						
						return "redirect:/memberList";
					}

			}else {
				
				model.addAttribute("idMsg","로그인에 실패 했습니다.");
			}
			
		} catch (Exception e) {
			model.addAttribute("msg","로그인에 실패 했습니다. 관리자에게 문의하세요");
			return "/error";
		}
			return "/login2";
		
	}

	
	@PostMapping("/registerMember")
	public String registerMember(User user) {
		service.registerMember(user);
		service.insertRole(user);
		service.updatePwd(user);
		return "/login2";
	}
	
	@GetMapping("/checkId/{id}")
	@ResponseBody
	public boolean checkId(@PathVariable("id") String id) {
		// 아이디 중복 체크
		if(service.checkId(id)!=null) {
			//아이디 있음
			return false;
		} else {
			//아이디 없음
			return true;
		}
	}
	
}
