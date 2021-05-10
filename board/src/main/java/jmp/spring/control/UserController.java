package jmp.spring.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jmp.spring.mapper.UserMapper;
import jmp.spring.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	UserMapper mapper;
	
	@GetMapping("/board/login")
	public void showLogin() {
		
	}
	@PostMapping("/board/loginAction")
	public String LoginProcess(UserVo vo, Model model) {
			
	 UserVo uvo=mapper.login(vo.getId(), vo.getPwd());
		if(uvo.equals("")) {
		    model.addAttribute("msg", "�α����� �����߽��ϴ�.");
		}else {
			model.addAttribute("msg", uvo.getName()+"�� ����ʽÿ�.");
		}
	 
	 return "/board/login";
	}
}
