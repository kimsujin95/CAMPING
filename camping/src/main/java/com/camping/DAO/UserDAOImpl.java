package com.camping.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.VO.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSession sqlSession;  // mybatis에서 제공한 객체 
	private static String mapperquery = "com.camping.DAO.UserDAO";	
	
	@Override
	public void usInsert(UserVO uservo) throws Exception {
		sqlSession.insert(mapperquery +".insert",uservo);
	}
	@Override
	public UserVO MyList(String mylist) throws Exception {
		return sqlSession.selectOne(mapperquery+ ".MyList",mylist);
	}
	@Override
	public UserVO usermodList(String userid) throws Exception {
		return sqlSession.selectOne(mapperquery + ".usermodList",userid);
	}


	@Override
	public void userdel(String del) throws Exception {
		sqlSession.delete(mapperquery +".userdel",del);
	}

	@Override
	public void UserMod(UserVO uservo) throws Exception {
		sqlSession.update(mapperquery+".UserMod",uservo);
	}
	//관리자 페이지========================================
	@Override
	public List<UserVO> userList() throws Exception {
		return sqlSession.selectList(mapperquery + ".usList");
	}
	@Override
	public UserVO adminusermodList(String userid) throws Exception {
		return sqlSession.selectOne(mapperquery  + ".adminusermodList",userid);
	}
	@Override
	public void adminUserMod(UserVO uservo) throws Exception {
		sqlSession.update(mapperquery+".adminUserMod",uservo);
	}

}
 