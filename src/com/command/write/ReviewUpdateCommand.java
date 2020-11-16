package com.command.write;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.lec.beans.WriteDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class ReviewUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();
		
		System.out.println("티 : " +request.getParameter("review-text"));
		
// 수정은 내용이랑 사진만 		
//------------------------------------------------------------------------------------
		
//	       1. MultipartRequest 객체 생성 --> 파일 업로드 됨
	      ServletContext context = request.getServletContext();
	      
	      //서블릿 산의 upload폴더 경로 가져오기
	      String saveDirectory = context.getRealPath("upload");
	      System.out.println("업로드 경로: "+saveDirectory);
	      
	      int maxPostSize = 5 * 1024 * 1024; //최대 5M
	      String encoding = "UTF-8"; //인코딩
	      FileRenamePolicy policy = new DefaultFileRenamePolicy(); //중복 파일명에 대한 rename 정책
	      MultipartRequest multi = null;
	      
	      try {
	         multi = new MultipartRequest(
	               request,
	               saveDirectory,
	               maxPostSize,
	               encoding,
	               policy
	               );
	      } catch(IOException e) {
	         e.printStackTrace();
	      }
	      
	      List<String> fileSystemNames = new ArrayList<String>();
	      System.out.print("==========" + multi.getFileNames());
	      Enumeration<String> names = multi.getFileNames(); //type='file' 요소 name들 추출
	      while(names.hasMoreElements()) {
	         String name = (String)names.nextElement();
	         /*String originalFileName = multi.getOriginalFileName(name);*/
	         String fileSystemName = multi.getFilesystemName(name);
	         
	         System.out.println("첨부파일: " + "->" + fileSystemName);
	         
	         if(fileSystemName != null) {
	            /*originalFileNames.add(originalFileName);*/ 
	            fileSystemNames.add("upload/" + fileSystemName);
	         }
	         System.out.println(fileSystemNames);
	      }

		
		// parameter : MultiparRequest 객체에서 가져온다.
		int rno = Integer.parseInt(multi.getParameter("rno"));
		String rcontent = "";
		String rimg = "";
		try {
			rcontent = new String(multi.getParameter("rcontent").getBytes("8859_1"),"UTF-8");
			rimg = multi.getParameter("rimg");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("수정rno" + rno);
		System.out.println("수정rcontent"+rcontent);
		System.out.println("수정rcontent"+rimg);
		if(rcontent != null && rcontent.trim().length() > 0) {
			try {
				cnt = dao.update(rno, rcontent, rimg);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
		request.setAttribute("rno", rno); // multi part 로 받은뒤 updateOk.jsp 로 넘겨야한다. 
		request.setAttribute("result", cnt);

	}

}
