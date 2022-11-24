package com.camping.DAO;

import java.util.List;

import com.camping.VO.UserVO;

public interface UserDAO {

	public void usInsert(UserVO uservo) throws Exception; //유저 등록

	public UserVO MyList(String mylist) throws Exception; //마이리스트

	public UserVO usermodList(String userid) throws Exception; //수정 전 정보

	public void UserMod(UserVO uservo) throws Exception;
	
	public void userdel(String del) throws Exception;

	
	//관리자 페이지 ====================================
	public List<UserVO> userList() throws Exception; //유저리스트

	public UserVO adminusermodList(String userid) throws Exception;

	public void adminUserMod(UserVO uservo) throws Exception;

	
	

}
