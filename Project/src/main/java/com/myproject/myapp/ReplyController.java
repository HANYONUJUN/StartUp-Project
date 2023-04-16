package com.myproject.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.model.ReplyVO;
import com.myproject.service.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	
	 @Autowired
	 private ReplyService service;
	 
	 //댓글 조회
	 
	 //댓글 작성
	 @RequestMapping(value = "/write", method = RequestMethod.POST)
	 public String postreWirte(ReplyVO vo, Model model) throws Exception {		 
		 service.replyinsert(vo);
		 return "redirect:/board/detail?bno=" + vo.getBno();
	 }
	 
	 //댓글 수정
	 
	 
	 //댓글 삭제
	
}
