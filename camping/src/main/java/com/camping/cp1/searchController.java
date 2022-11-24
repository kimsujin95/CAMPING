package com.camping.cp1;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.VO.PageVO;
import com.camping.VO.campingVO;
import com.camping.service.CommentService;
import com.camping.service.campingListService;


@Controller
public class searchController {
	@Inject
	private campingListService cpLSrv;
	@Inject
	private CommentService commentSrv;

	// 메인
	@RequestMapping(value = "/addrsearch", method = RequestMethod.GET)
	public String addrsearch(Locale locale, Model model) throws Exception {
		return "redirect:/campingList";
	}

	// 캠핑장리스트
	@RequestMapping(value = "/campingList", method = RequestMethod.GET)
	public String campingList(PageVO pagevo, Locale locale, Model model) throws Exception {
		if (pagevo.getPage() == null) {
			pagevo.setPage(1); // 페이지정보를 넘기지 않은다면 > 없으면 1페이지
		}
		pagevo.setPerPageNum(15);
		pagevo.setTotalCount(cpLSrv.cpcnt()); // 전체 게시글 수 bs작업필요함.
		model.addAttribute("cpList", cpLSrv.campingList(pagevo)); // 캠핑리스트
		model.addAttribute("pageVO", pagevo); // 페이지넘버
		return "search/campingList";
	}

	// 자세히보기 및 조회스 증가
	@RequestMapping(value = "/cpView", method = RequestMethod.GET)
	public String campingView(Locale locale, Model model, @RequestParam("cpindex") int cpnum) throws Exception {
		model.addAttribute("oneData", cpLSrv.cpOneview(cpnum)); // 자세히보기 조회수
		//model.addAttribute("commentlist", commentSrv.commentList(cpnum)); // 댓글
		return "search/campingView";
	}

	// -----------------------------------------------------------관리자 컨트롤러//
	@RequestMapping(value = "/adminaddrsearch", method = RequestMethod.GET)
	public String adminaddrsearch(Locale locale, Model model) throws Exception {
		return "redirect:/admincampingList";
	}

	@RequestMapping(value = "/admincampingList", method = RequestMethod.GET)
	public String admincampingList(PageVO pagevo, Locale locale, Model model) throws Exception {
		if (pagevo.getPage() == null) {
			pagevo.setPage(1); // 페이지정보를 넘기지 않은다면 > 없으면 1페이지
		}
		pagevo.setPerPageNum(15);
		pagevo.setTotalCount(cpLSrv.cpcnt()); // 전체 게시글 수 bs작업필요함.
		model.addAttribute("cpList", cpLSrv.admincampingList(pagevo)); // 캠핑리스트
		model.addAttribute("pageVO", pagevo); // 페이지넘버
		return "admin/admincampingList";
	}

	@RequestMapping(value = "/admincpView", method = RequestMethod.GET)
	public String admincampingView(Locale locale, Model model, @RequestParam("cpindex") int cpnum) throws Exception {
		model.addAttribute("oneData", cpLSrv.cpOneview(cpnum));
		//model.addAttribute("commentlist", commentSrv.commentList(cpnum));
		return "admin/admincampingView";
	}

	@RequestMapping(value = "/admincpdel", method = RequestMethod.GET)
	public String admincpdel(@RequestParam("cpdel") int cpno, Locale locale, Model model) throws Exception {
		cpLSrv.campingdel(cpno);
		return "redirect:/admincampingList";
	}

	// 수정 전 정보
	@RequestMapping(value = "/cpModlist", method = RequestMethod.GET)
	public String cpModlist(@RequestParam("cpinfor") String cp, Locale locale, Model model) throws Exception {
		model.addAttribute("cpList", cpLSrv.cpmodList(cp));
		return "admin/admincampingmod";
	}

	// 수정완료후 리턴
	@RequestMapping(value = "/cpMod", method = RequestMethod.POST)
	public String UserModlist(campingVO cpvo, Locale locale, Model model) throws Exception {
		cpLSrv.cpMod(cpvo);
		return "redirect:/admincampingList";
	}

	@RequestMapping(value = "/admincp", method = RequestMethod.GET)
	public String admincp(Locale locale, Model model) throws Exception {
		return "admin/admincpinput";
	}

	@RequestMapping(value = "/admincpinput", method = RequestMethod.POST)
	public String admincpinput(campingVO cpvo, Locale locale, Model model) throws Exception {
		cpLSrv.cpinput(cpvo);
		return "redirect:/admincampingList";
	}



}
