package com.command.write;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.sun.org.apache.bcel.internal.generic.INEG;

import com.lec.beans.WriteDAO;

public class ReviewWriteCommand implements Command {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      int cnt = 0;
      WriteDAO dao = new WriteDAO();
      
      //--------------------------------
      // 1. MultipartRequest 객체 생성 --> 파일 업로드 됨
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
      
      
      //--------------------------------
      // 2. 업로드된 파일의 '원본이름'과 '저장된 이름' 받아오기
/*      List<String> originalFileNames = new ArrayList<String>();*/ 
      List<String> fileSystemNames = new ArrayList<String>();
      
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
      
      //-------------------------------------------------------------------------
      // 3. 게시글 및 첨부파일 -> DB저장
      
      
      //입력한 값 받아오기 : int rmno, int rstar, String rcontent, int rplace, String rimg
      int rmno = Integer.parseInt(multi.getParameter("rmno"));
      String star = multi.getParameter("rstar");
      if(star == null) {
    	  star = "0";
      }
      double rstar = Double.parseDouble(star);
      
      String rcontent = multi.getParameter("rcontent");
      int rplace = Integer.parseInt(multi.getParameter("rplace"));
      String rimg = "";
      
      
      for (int i = 0; i < fileSystemNames.size(); i++) {
    	  if(i != fileSystemNames.size() - 1) {
    		  rimg += fileSystemNames.get(i) + ";";    		  
    	  } else {
    		  rimg += fileSystemNames.get(i);
    	  }
	}
      
      
      
      //유효성 체크 : rmno, rplace 빼고 
      if(rcontent != null && !rcontent.trim().equals("")) {
         try {
            // 첨부파일 정보도 같이 INSERT 
            cnt = dao.insert( rmno, rstar, rcontent, rplace, rimg);
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      
      request.setAttribute("result", cnt);
   }

}