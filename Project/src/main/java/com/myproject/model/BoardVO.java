package com.myproject.model;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	
	private int Bno,boardnumber,Viewcnt,fileSize;
	private String Title,FileName,Content,userID, userPassword;
	private Timestamp Date;
	private MultipartFile uploadFile;
	
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getBno() {
		return Bno;
	}
	public void setBno(int bno) {
		Bno = bno;
	}
	public int getBoardnumber() {
		return boardnumber;
	}
	public void setBoardnumber(int boardnumber) {
		this.boardnumber = boardnumber;
	}
	public int getViewcnt() {
		return Viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		Viewcnt = viewcnt;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getFileName() {
		return FileName;
	}
	public void setFileName(String fileName) {
		FileName = fileName;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public Date getDate() {
		return Date;
	}
	public void setDate(Date date) {
		Date = (Timestamp) date;
	}
	
	@Override
	public String toString() {
		return "BoardVO [Bno=" + Bno + ", boardnumber=" + boardnumber + ", Viewcnt=" + Viewcnt + ", fileSize="
				+ fileSize + ", Title=" + Title + ", FileName=" + FileName + ", Content=" + Content + ", userID="
				+ userID + ", userPassword=" + userPassword + ", Date=" + Date + "]";
	}
	
}
