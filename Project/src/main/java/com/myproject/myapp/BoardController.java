package com.myproject.myapp;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myproject.model.BoardVO;
import com.myproject.service.BoardService;


@Controller
@RequestMapping(value = "/board/*")
public class BoardController {
		    
	
	 private static final Logger logger= LoggerFactory.getLogger(BoardController.class);
	
	 @Autowired
	 private BoardService service;
	 
	 @RequestMapping(value = "boardlist", method = RequestMethod.GET)
	 public void boardListGet(Model model){
		
		logger.info("게시판 목록 출력 페이지 진입");
		
		List<BoardVO> list = service.getList();
		
		model.addAttribute("list", list);
	 }
	 
	 @RequestMapping(value="enroll", method = RequestMethod.GET)
	 public void boardEnrollGet() {
		 logger.info("글쓰기 페이지 진입");
	 }
	 
	 /*게시판 등록 */
	 @RequestMapping(value= "/enroll", method=RequestMethod.POST)
	     public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr, Model model) throws IOException {
		 
		 //파일 업로드 처리
		 String fileName = null;
		 MultipartFile uploadFile = board.getUploadFile();
		 if(!uploadFile.isEmpty()) {
			 String originalFileName=uploadFile.getOriginalFilename();
			 String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
			 UUID uuid =UUID.randomUUID(); //UUID = 파일의 이름의 대한 중복을 방지하기 위해 사용
			 fileName = uuid+"."+ext;
			 uploadFile.transferTo(new File("C:\\upload\\" + fileName));
			 
		 }
		 
		 board.setFileName(fileName);
		 service.insert(board);
		 rttr.addFlashAttribute("result", "insert success");
		 logger.info("BoardVO :" + board);
		 
		 return "redirect:/board/boardlist";
	 } 
	 
}
