package com.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mapper.ReplyMapper;
import com.myproject.model.ReplyVO;


@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper mapper;
	
	//댓긓 조회
	@Override
	public List<ReplyVO> replyselect(int bno){
		return mapper.replyselect(bno);
	}
	
	
	//댓글 작성
	@Override
	public void replyinsert(ReplyVO reply){
		mapper.replyinsert(reply);
	}
	
}
