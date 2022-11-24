package com.camping.service;

import java.util.List;

import com.camping.VO.PageVO;
import com.camping.VO.campingVO;
import com.camping.cp1.Criteria;

public interface campingListService {
	
	public List<campingVO> campingList(PageVO pagevo) throws Exception;
	
	public List<campingVO> campingList(PageVO pagevo, Criteria cri) throws Exception;

	public int cpcnt() throws Exception;

	public List<campingVO> pnamelist() throws Exception;

	public campingVO cpOneview(int cpnum) throws Exception;
	// =====================관리자페이지========================//
	public void campingdel(int cpno) throws Exception; //캠핑리스트

	public campingVO cpmodList(String cp) throws Exception; //캠핑장 수정전

	
	
	public void cpMod(campingVO cpvo) throws Exception; //캠핑장 수정후
	
	public List<campingVO> admincampingList(PageVO pagevo) throws Exception; //페이지번호

	public void cpinput(campingVO cpvo) throws Exception;



	public List<campingVO> citylist(String pnamechoice);

	public campingVO pnameSearch(String index) throws Exception;

	public List<campingVO> CtList() throws Exception;

	public List<campingVO> admincampingList(PageVO pagevo, Criteria cri) throws Exception;

	
	
	
}
