package com.camping.cp1;

import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.camping.VO.boardVO;
import com.camping.service.boardService;

@Controller
public class boardController {
	@Inject
	private boardService baSrv;

	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model) throws Exception {
		return "redirect:/boardListView";
	}

	@RequestMapping(value = "/boardListView", method = RequestMethod.GET)
	public String boardListView(Locale locale, Model model) throws Exception {
		model.addAttribute("boardList", baSrv.BoardLst());
		return "board/boardList";
	}

	// 자유게시판
	@RequestMapping(value = "/boardpage", method = RequestMethod.GET)
	public String boardpage(boardVO boardvo, Locale locale, Model model) throws Exception {
		return "board/boardInput";
	}

	// 게시판 글쓰기
	@RequestMapping(value = "/boardinput", method = RequestMethod.POST)
	public String boardinput(boardVO boardvo, Locale locale, Model model) throws Exception {
		baSrv.insert(boardvo);
		return "redirect:/boardListView";
	}

	// 자세히보기 및 조회수 증가
	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	public String boardView(@RequestParam("boardvalue") int banum, Locale locale, Model model) throws Exception {
		model.addAttribute("oneData", baSrv.boardView(banum));
		return "board/boardview";
	}

	// 게시글 삭제
	@RequestMapping(value = "/boarddel", method = RequestMethod.GET)
	public String boarddel(@RequestParam("badel") int badel, Locale locale, Model model) throws Exception {
		baSrv.boarddel(badel);
		return "redirect:/boardListView";
	}

	// 유저 수정 전 정보
	@RequestMapping(value = "/boardmodlist", method = RequestMethod.GET)
	public String boardmodlist(@RequestParam("bamod") int bamodnum, Locale locale, Model model) throws Exception {
		model.addAttribute("bamodlist", baSrv.boardmodlist(bamodnum));
		return "board/boardmod";
	}

	// 수정완료후 리턴
	@RequestMapping(value = "/boardmod", method = RequestMethod.POST)
	public String boardMod(boardVO bavo, Locale locale, Model model) throws Exception {
		baSrv.boardmod(bavo);
		return "redirect:/boardListView";
	}

	// 관리자페이지=====================================================
	@RequestMapping(value = "/adminboardList", method = RequestMethod.GET)
	public String adminboardList(Locale locale, Model model) throws Exception {
		return "redirect:/adminboardListView";
	}

	@RequestMapping(value = "/adminboardListView", method = RequestMethod.GET)
	public String adminboardListView(Locale locale, Model model) throws Exception {
		model.addAttribute("boardList", baSrv.BoardLst());
		return "admin/adminboardList";
	}

	// 자유게시판
	@RequestMapping(value = "/adminboardpage", method = RequestMethod.GET)
	public String adminboardpage(boardVO boardvo, Locale locale, Model model) throws Exception {
		return "admin/adminboardInput";
	}

	// 게시판 글쓰기
	@RequestMapping(value = "/adminboardinput", method = RequestMethod.POST)
	public String adminboardinput(boardVO boardvo, Locale locale, Model model) throws Exception {
		baSrv.insert(boardvo);
		return "redirect:/adminboardListView";
	}

	// 자세히보기 및 조회수 증가
	@RequestMapping(value = "/adminboardView", method = RequestMethod.GET)
	public String adminboardView(@RequestParam("boardvalue") int banum, Locale locale, Model model) throws Exception {
		model.addAttribute("oneData", baSrv.boardView(banum));
		return "admin/adminboardview";
	}

	// 게시글 삭제
	@RequestMapping(value = "/adminboarddel", method = RequestMethod.GET)
	public String adminboarddel(@RequestParam("badel") int badel, Locale locale, Model model) throws Exception {
		baSrv.boarddel(badel);
		return "redirect:/adminboardListView";
	}

	// 유저 수정 전 정보
	@RequestMapping(value = "/adminboardmodlist", method = RequestMethod.GET)
	public String adminboardmodlist(@RequestParam("bamod") int bamodnum, Locale locale, Model model) throws Exception {
		model.addAttribute("bamodlist", baSrv.boardmodlist(bamodnum));
		return "admin/adminboardmod";
	}

	// 수정완료후 리턴
	@RequestMapping(value = "/adminboardmod", method = RequestMethod.POST)
	public String adminboardMod(boardVO bavo, Locale locale, Model model) throws Exception {
		baSrv.boardmod(bavo);
		return "redirect:/adminboardListView";
	}
}
