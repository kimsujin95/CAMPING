package com.camping.service;

import java.util.List;

import com.camping.VO.UserVO;

public interface UserService {

	public void usInsert(UserVO uservo) throws Exception;	//회원등록

	public UserVO MyList(String mylist) throws Exception; //마이 리스트

	public UserVO usermodList(String userid) throws Exception ; //수정전 정보

	public void userdel(String del) throws Exception;

	public void UserMod(UserVO uservo) throws Exception;
	//관리자 페이지=================================
	public List<UserVO> userList() throws Exception;
	
	public UserVO adminusermodList(String userid) throws Exception;

	public void adminUserMod(UserVO uservo) throws Exception;



}
