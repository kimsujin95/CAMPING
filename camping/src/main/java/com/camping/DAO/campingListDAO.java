package com.camping.DAO;

import java.util.List;

import com.camping.VO.PageVO;
import com.camping.VO.campingVO;

public interface campingListDAO {

	public List<campingVO> campingList(PageVO pagevo) throws Exception;
	
	public int cpcnt() throws Exception;

	
	
	public List<campingVO> pnamelist() throws Exception;

	public campingVO cpOneview(int cpnum) throws Exception;//자세히보기

	public void cntplus(int cpnum) throws Exception;//조회수증가
	// =========================관리자페이지========================
	public void campingdel(int cpno) throws Exception; // 캠핑장 삭제

	public campingVO cpmodList(String cp) throws Exception; // 캠핑장 수정전

	public void cpmod(campingVO cpvo) throws Exception; //수정 후

	public void cpinput(campingVO cpvo) throws Exception;


	public List<campingVO> citylist(String pnamechoice);

	public campingVO SelectAll(String index) throws Exception;

	public List<campingVO> CTList() throws Exception;


	
}
