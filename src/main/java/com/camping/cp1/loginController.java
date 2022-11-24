package com.camping.cp1;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.camping.VO.UserVO;
import com.camping.service.UserService;

@Controller
public class loginController {
	@Inject
	UserService userSrv;

	@RequestMapping(value = "/loginpage", method = RequestMethod.GET)
	public String loginpage(Locale locale, Model model) throws Exception {
		return "login/loginForm";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Locale locale, Model model) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		return "login/loginForm";
	}

	@RequestMapping(value = "/loginProssion", method = RequestMethod.POST)
	public String loginpro(UserVO uservo, HttpServletRequest request, Locale locale, Model model) throws Exception {

		String tagetUrl = "";
		UserVO tempUservo = userSrv.usermodList(uservo.getId());//받아온id로 db에 가입여부 조회
		
		if (tempUservo == null) {
			// 아이디 불일치
			System.out.println("아이디가 없음");
			tagetUrl = "login/loginForm";
		} else { // 아이디는 일치
			if (tempUservo.getPwd().equals(uservo.getPwd())) {
				HttpSession session = request.getSession(); // 세션 공간 접근 객체 (세션의 정보를 가져옴)
				session.setAttribute("username", tempUservo.getName());//세션등록
				session.setAttribute("userid", tempUservo.getId());
				//로그인 성공 후  회원등급 확인(관리자 1, 유저 0)
				if (tempUservo.getRating()== 0) {
					tagetUrl = "Main";
				} else {
					tagetUrl = "admin/adminMain";
				}
			} else {
				System.out.println("아이디 일치 비번 불일치");
				tagetUrl = "login/loginForm";
			}
		}
		return tagetUrl;
	}
}
