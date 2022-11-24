package com.camping.cp1;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.VO.CommentVO;
import com.camping.service.CommentService;

@Controller
public class CommentController {
	@Inject
	CommentService commentSer;
	
	//댓글 등록
	@RequestMapping("/Commentinput")
	@ResponseBody
	private int commentinput(@RequestParam int no, @RequestParam String memo, @RequestParam String id) throws Exception {
		CommentVO comment = new CommentVO();
		comment.setId(id); //id
		comment.setBno(no); //댓글 번호
		comment.setMemo(memo); //댓글 내용
		return commentSer.insert(comment); 
	}
	//댓글전체보기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	private List<CommentVO> commentList(int bno) throws Exception{
		return commentSer.cmList(bno);
	}
	//댓글삭제
	@RequestMapping("/del/{no}")
	@ResponseBody
	private int del(@PathVariable int no) throws Exception{
		return commentSer.del(no);
	}
}