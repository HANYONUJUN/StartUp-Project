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

import com.myproject.mapper.PageMakeDTO;
import com.myproject.model.BoardVO;
import com.myproject.model.Criteria;
import com.myproject.model.ReplyVO;
import com.myproject.service.BoardService;
import com.myproject.service.ReplyService;


@Controller
@RequestMapping(value = "/board/*")
public class BoardController {
		   
	 private static final Logger logger= LoggerFactory.getLogger(BoardController.class);
	
	 @Autowired
	 private BoardService service;
	 
	 @Autowired
	 private ReplyService replyservice;
	  
	 //게시글 목록 (페이징 기능 추가)
	 @RequestMapping(value="list", method= RequestMethod.GET)
	 public void boardListPage(Model model,Criteria cri) {
		 
		
		 model.addAttribute("getlist",service.getListPaging(cri));
		 
		 int total =service.getTotal(cri);
		 
		 PageMakeDTO pageMake = new PageMakeDTO(cri, total);
		 
		 model.addAttribute("pageMaker", pageMake);
		 
		 
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
		 
		 return "redirect:/board/list";
	 } 
	 
	 /*게시물 상세 페이지*/
	 @RequestMapping(value="/detail" ,method = RequestMethod.GET)
	 public String getdetail(Model model, @RequestParam("bno")int bno) throws Exception{
		 
		 logger.info("게시글 상세 페이지 진입");
		 /*
		 BoardVO data = service.detail(bno); //bno값으로 넘김
		 */
		  
         model.addAttribute("data", service.detail(bno));
         
         service.updateViewCnt(bno); 
         
         //댓글조회
         List<ReplyVO> reply = null;
         reply = replyservice.replyselect(bno);
         model.addAttribute("reply",reply);
	
		 return "board/detail";
		 
	 }
	 
	 //게시글 수정 페이지로 이동
	 @RequestMapping(value="/update", method = {RequestMethod.POST, RequestMethod.GET})
	 public String getupdate(@RequestParam(value="userpassword",required = false) String password, @RequestParam(value="bno")int bno, Model model)throws Exception {
		  
		 BoardVO data = service.detail(bno);
		 BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		 System.out.println(data.getUserPassword());
		 System.out.println("수정 비밀번호 입력 패스워드 " + password);
		 if(encoder.matches(password, data.getUserPassword())) {
		 logger.info("게시글 수정 페이지 진입");
		 model.addAttribute("data",data);	 
		 return "board/update";
		 
		 }else {
			 model.addAttribute("errorMessage", "잘못된 비밀번호입니다."); 
			 String movePage = "redirect:detail?bno="+bno;
			 return movePage;
		 }
	 }
	 
	 // 게시글 수정 post
	 @RequestMapping(value="/postupdate" ,method =RequestMethod.POST)
	 public String postupdate(BoardVO boardVO) throws Exception {
		  
		 service.update(boardVO);
		 
		 return "redirect:/board/list"; //리스트 페이지로 리다이렉트
	 }
	 
	 //게시물 삭제
	 @RequestMapping(value="/postdelete",method = {RequestMethod.POST, RequestMethod.GET})
	 public String postdelete(@RequestParam(value="userpassword",required = false) String password, @RequestParam(value="bno")int bno ,Model model) throws Exception {
	          
		      BoardVO board = service.detail(bno);
		      BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		      System.out.println("내가 지금 입력한 비밀번호 확인" + password);
		      
		      // (암호화) 입력한 비밀번호가 일치하면
			  if(encoder.matches(password, board.getUserPassword())) {
				  service.delete(bno);
				  return "redirect:list";
				  
			  // 비밀번호가 일치하지 않으면	  
			  }else {
			    model.addAttribute("errorMessage", "잘못된 비밀번호입니다."); 
			    String movePage = "redirect:detail?bno="+bno;
			    return movePage;
			  }
			  
	   }
	 
	 @RequestMapping(value="/replyDelete")
	    public String deleteReply(@RequestParam("rno") int rno, 
	    		@RequestParam("bno") int bno, 
	    		@RequestParam("replypassword") String replypassword,
	    		Model model) {
	        // 여기에 댓글 삭제 로직을 구현합니다.
		    List<ReplyVO> reply = replyservice.replyselect(bno);
		    String repass=" ";
		    
		    for(int i=0;  i < reply.size(); i++) {
		    	 if(rno == reply.get(i).getRno()) {
		    		repass=reply.get(i).getRepassword();
		    		 
		    	 }  	 
		    }
		    
		    if(replypassword.equals(repass)) {
		    	replyservice.redelete(rno);
		    	return "redirect:/board/detail?bno=" + bno;
		    }else {
		    	System.out.println("삭제실패");
		    }
		 
	        // 삭제 후 원하는 페이지로 이동하도록 redirect 경로를 반환합니다.
	        return "redirect:/board/detail?bno=" + bno;
	    }
	 
	 @RequestMapping(value="/replyModify")
	 public String modifyReply(@RequestParam("rno") int rno, 
	                           @RequestParam("bno") int bno, 
	                           @RequestParam("replypassword") String replypassword,
	                           @RequestParam("recontent") String replycontent,
	                           Model model) {

	     // 댓글 수정 로직을 구현.
	     List<ReplyVO> reply = replyservice.replyselect(bno);
	     String repass = " ";

	     for (int i = 0; i < reply.size(); i++) {
	         if (rno == reply.get(i).getRno()) {
	             repass = reply.get(i).getRepassword();
	         }
	     }

	     if (replypassword.equals(repass)) {
	         replyservice.reupdate(rno, replycontent);
	         return "redirect:/board/detail?bno=" + bno;
	         
	     } else {
	         System.out.println("수정 실패");
	     }

	     // 삭제 후 원하는 페이지로 이동하도록 redirect 경로를 반환합니다.
	     return "redirect:/board/detail?bno=" + bno;
	 }
	 
}
