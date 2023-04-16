package com.myproject.service;

import java.util.List;

import com.myproject.model.ReplyVO;

public interface ReplyService {
	
	 //댓글 조회
     public List<ReplyVO> replyselect(int bno);	
	
	 //댓글 작성
	 public void replyinsert(ReplyVO reply);
}
