package com.myproject.service;

import java.util.List;

import com.myproject.model.BoardVO;

public interface BoardService {
		
	public void insert(BoardVO boardVO);

    public List<BoardVO> getList(int bno);
    
    public BoardVO detail(int bno);
    
    public void update(BoardVO boardVO);
    
    public void delete(int bno);
    
    public void updateViewCnt(int bno);
    
    
}
