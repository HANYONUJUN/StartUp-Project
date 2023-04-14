package com.myproject.myapp;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;


import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	 public void boardListGet(BoardVO board,Model model){
		
		logger.info("게시판 목록 출력 페이지 진입");
		
		service.updateViewCnt(board.getBno());
		List<BoardVO> list = service.getList(board.getBno());
		model.addAttribute("list", list);
	 }
	 
	 @RequestMapping(value="enroll", method = RequestMethod.GET)
	 public void boardEnrollGet(BoardVO board) {
		 logger.info("글쓰기 페이지 진입");
	 }
	 
	 /*게시판 등록 */
	 @RequestMapping(value= "/enroll", method=RequestMethod.POST)
	     public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr, Model model) throws IOException {
		 
		 //비밀번호 암호화
		 BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		 String securePW = encoder.encode(board.getUserPassword());
		 board.setUserPassword(securePW);
		
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
	 
	 /*게시물 상세 페이지*/
	 @RequestMapping(value="/detail" ,method = RequestMethod.GET)
	 public String getdetail(Model model, int bno) throws Exception{
		 
		 logger.info("게시글 상세 페이지 진입");

		 BoardVO data = service.detail(bno); //bno값으로 넘김
         model.addAttribute("data", data);		 
		 return "board/detail";
	 }
	 
	 //게시글 수정 페이지로 이동
	 @RequestMapping(value="/update", method =RequestMethod.GET)
	 public String getupdate(int bno, Model model)throws Exception {
		 
		 logger.info("게시글 수정 페이지 진입");
		 
		 BoardVO data = service.detail(bno);
		 model.addAttribute("data",data);	 
		 return "board/update";
	 }
	 
	 // 게시글 수정 post
	 @RequestMapping(value="/update" ,method =RequestMethod.POST)
	 public String postupdate(BoardVO boardVO, RedirectAttributes rttr) throws Exception {
		 
		 service.update(boardVO);
		 return "redirect:boardlist"; //리스트 페이지로 리다이렉트
	 }
	 
	 //게시물 삭제
	 @RequestMapping(value="/postdelete",method = {RequestMethod.POST, RequestMethod.GET})
	 public String postdelete(@RequestParam(value="userpassword",required = false) String password, @RequestParam(value="bno")int bno ,Model model) throws Exception {
	          
		      BoardVO board = service.detail(bno);
		      BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		      	      
			  if(encoder.matches(password, board.getUserPassword())) {
				  service.delete(bno);
				  return "board/boardlist";
				  
			  }else {
			    model.addAttribute("errorMessage", "잘못된 비밀번호입니다."); 
			    String movePage = "redirect:detail?bno="+bno;
			    return movePage;
			  }
			  
			
	 
	 }
	 	 
}
