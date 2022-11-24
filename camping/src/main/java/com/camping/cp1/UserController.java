package com.camping.cp1;

import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.camping.VO.UserVO;
import com.camping.service.UserService;

@Controller
public class UserController {
	@Inject
	UserService usSrv;

	@RequestMapping(value = "/joinUser", method = RequestMethod.GET)
	public String joinUser(Locale locale, Model model) throws Exception {
		return "User/UserInput";
	}

	// 유저 등록
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(UserVO uservo, Locale locale, Model model) throws Exception {
		usSrv.usInsert(uservo);
		return "User/UserInput";
	}

	// 유저 전체 리스트
	@RequestMapping(value = "/UserList", method = RequestMethod.GET)
	public String UrList(@RequestParam("myid") String mylist, Locale locale, Model model) throws Exception {
		model.addAttribute("UserList", usSrv.MyList(mylist));
		return "User/UserMypage";
	}

	// 유저 수정 전 정보
	@RequestMapping(value = "/UserMod", method = RequestMethod.GET)
	public String UserMod(@RequestParam("userinfor") String userid, Locale locale, Model model) throws Exception {
		model.addAttribute("UserList", usSrv.usermodList(userid));
		return "User/UserMod";
	}

	// 수정완료후 리턴
	@RequestMapping(value = "/UserModlist", method = RequestMethod.POST)
	public String UserModlist(UserVO uservo, Locale locale, Model model) throws Exception {
		usSrv.UserMod(uservo);
		return "redirect:/UserList?myid="+uservo.getId();
	}

	/// =========================관리자페이지=================================
	// 유저 전체 리스트
	@RequestMapping(value = "/adminUserList", method = RequestMethod.GET)
	public String UserList(Locale locale, Model model) throws Exception {
		model.addAttribute("UserList", usSrv.userList());
		return "admin/adminUserList";
	}

	// 유저 수정 전 정보
	@RequestMapping(value = "/adminUserMod", method = RequestMethod.GET)
	public String adminUserMod(@RequestParam("userinfor") String userid, Locale locale, Model model) throws Exception {
		model.addAttribute("UserList", usSrv.adminusermodList(userid));
		return "admin/adminUserMod";
	}

	// 수정완료후 리턴
	@RequestMapping(value = "/adminUserModlist", method = RequestMethod.POST)
	public String adminUserModlist(UserVO uservo, Locale locale, Model model) throws Exception {
		usSrv.adminUserMod(uservo);
		return "redirect:/adminUserList";
	}
	//유저 삭제
	@RequestMapping(value = "/userdel", method = RequestMethod.GET)
	public String userdel(@RequestParam("userdel") String del, Locale locale, Model model) throws Exception {
		usSrv.userdel(del);
		return "redirect:/adminUserList";
	}
}