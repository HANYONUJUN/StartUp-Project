package com.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mapper.BoardMapper;
import com.myproject.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

		@Autowired
		private BoardMapper mapper;
		
		//게시물 등록
		public void insert(BoardVO boardVO) {
			
			mapper.insert(boardVO);
		}
		
		//게시글 작성글을 리스트로 불러오기
		@Override
		public List<BoardVO> getList(int bno){
			mapper.updateViewCnt(bno);
			return mapper.getList(bno);
		}
		
		//게시물 상세페이지 불러오기
		@Override
		public BoardVO detail(int bno) {
			
			return mapper.detail(bno);
		}
		
		@Override
		public void update(BoardVO boardVO) {
			mapper.update(boardVO);
		}
		
		@Override
		public void delete(int bno) {
			mapper.delete(bno);
		}
		
		
		@Override
		public void updateViewCnt(int bno) {
			mapper.updateViewCnt(bno);
		}
}
