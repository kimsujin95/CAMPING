package com.camping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.camping.DAO.UserDAO;
import com.camping.VO.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	UserDAO userdao;
	
	@Override
	public void usInsert(UserVO uservo) throws Exception {
		userdao.usInsert(uservo);
	}

	@Override
	public UserVO usermodList(String userid) throws Exception {
		return userdao.usermodList(userid);
	}
	@Override
	public UserVO MyList(String mylist) throws Exception {
		return userdao.MyList(mylist);
	}

	@Override
	public void userdel(String del) throws Exception {
		userdao.userdel(del);
	}

	@Override
	public void UserMod(UserVO uservo) throws Exception {
		userdao.UserMod(uservo);
	}
	//관리자 페이지 ============================================
	@Override
	public List<UserVO> userList() throws Exception {
		return userdao.userList();
	}
	@Override
	public UserVO adminusermodList(String userid) throws Exception {
		return userdao.adminusermodList(userid);
	}
	@Override
	public void adminUserMod(UserVO uservo) throws Exception {
		userdao.adminUserMod(uservo);
	}


}
