package com.myproject.mapper;

import java.util.List;

import com.myproject.model.ReplyVO;

public interface ReplyMapper {

	//댓글 조회
    public List<ReplyVO> replyselect(int bno);	
	
	//댓글 작성
	public void replyinsert(ReplyVO reply);
}
