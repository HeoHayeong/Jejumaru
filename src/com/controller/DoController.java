package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.AWriteCommand;
import com.command.write.Command;
import com.command.write.ListCommand;
import com.command.write.MyListCommand;
import com.command.write.SearchCommand;

import com.command.write.PwDeleteCommand;
import com.command.write.DetailCommand;
import com.command.write.MypageCommand;
import com.command.write.NDeleteCommand;
import com.command.write.NListCommand;
import com.command.write.NSelectCommand;
import com.command.write.NUpdateCommand;
import com.command.write.NViewCommand;
import com.command.write.NWriteCommand;
import com.command.write.PlaceCommand;
import com.command.write.QDeleteCommand;
import com.command.write.QListCommand;
import com.command.write.QSelectCommand;
import com.command.write.QUpdateCommand;
import com.command.write.QViewCommand;
import com.command.write.QWriteCommand;
import com.command.write.RecommandCommand;
import com.command.write.ReviewUpdateCommand;
import com.command.write.idfindCommand;
import com.command.write.pwfindCommand;
import com.command.write.ReviewWriteCommand;
import com.command.write.ReviewDeleteCommand;
import com.command.write.PWUpdateCommand;
import com.jeju.mail.Mail;

@WebServlet("*.do")
public class DoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo() 호출");
		
		request.setCharacterEncoding("UTF-8");
		
		// URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 텍스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);
		
		// 컨트롤러는 다음의 두가지를 결정해야 한다
		Command command = null; // 어떠한 로직을 수행할지 결정
		String viewPage = null;
		
		// 컨트롤러는 커맨드에 따라 로직 수행
		// 결과를 보낼 view 를 결정
		switch(com) {
		case "/main.do":
			command = new RecommandCommand();
			command.execute(request, response);
			viewPage = "main.jsp";
			break;
		
		case "/list.do":
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
			break;
			
		case "/search.do":
			command = new SearchCommand();
			command.execute(request, response);
			viewPage = "search.jsp";
			break;
		case "/detailJspPage.do":
			command = new DetailCommand();
			command.execute(request, response);
			new PlaceCommand().execute(request, response);
			viewPage = "detailJspPage.jsp";
			break;
			
//	 나의 리뷰 		
		case "/myreview.do":
			command = new MypageCommand();
			command.execute(request, response);
			viewPage = "myreview.jsp";
			break;
//			end 나의 리뷰 		
			
			
		case "/detailpage/writeOk.do":
			command = new ReviewWriteCommand();
			command.execute(request, response);
			viewPage = "writeOk.jsp";
			break;
			
		case "/detailpage/updateOk.do":
			command = new ReviewUpdateCommand();
			command.execute(request, response);
			viewPage = "updateOk.jsp";
			break;
			
			
		case "/detailpage/deleteOk.do":
			command = new ReviewDeleteCommand();
			command.execute(request, response);
			viewPage = "deleteOk.jsp";
			break;	
			
		case "/login.do":
			viewPage = "login.jsp";
			break;

		case "/logout.do":
			viewPage = "logout.jsp";
			break;
			
		case "/loginOk.do":
			viewPage = "loginOk.jsp"; 	//메인페이지로 이동해야함
			break;

		case "/joinOk.do":
			viewPage = "joinOk.jsp";
			break;
			
		case "/pwfindOk.do":
			command = new pwfindCommand();
			command.execute(request, response);
			viewPage = "pwfindOk.jsp";
			break;

		case "/idfindOk.do":
			command = new idfindCommand();
			command.execute(request, response);
			viewPage = "idfindOk.jsp";
			break;

		case "/find.do":
			viewPage = "find.jsp";
			break;

		case "/infochk.do":
			viewPage = "infochk.jsp";
			break;
			
		case "/infochkOk.do":
			viewPage = "infochkOk.jsp";
			break;

		case "/modifyOk.do":
			command = new PWUpdateCommand();
			command.execute(request, response);
			viewPage = "modifyOk.jsp";
			break;
			
		case "/modify.do":
			viewPage = "modify.jsp";
			break;
			
		case "/deleteOk.do":
			command = new PwDeleteCommand();
			command.execute(request, response);
			viewPage = "deleteOk.jsp";
			break;
		
		case "/sendMail.do":
			new Mail().sendMail(request.getParameter("email") , request.getParameter("num"));
			break;

		case "/sendIdMail.do":
			new Mail().sendIdMail(request.getParameter("email") , request.getParameter("id")); 
			break;
		
		case "/sendPwMail.do":
			new Mail().sendPwMail(request.getParameter("email") , request.getParameter("pw")); 
			break;
			
			
			/////////////////////
			
		case "/notice_list.do":
			command = new NListCommand();
			command.execute(request, response);
			viewPage = "/notice_list.jsp";
			break;
			
		case "/notice_write.do":
			viewPage = "notice_write.jsp";
			break;
			
		case "/notice_writeOk.do":
			command = new NWriteCommand();
			command.execute(request, response);
			viewPage = "notice_writeOk.jsp";
			break;
			
		case "/notice_view.do":
			command = new NViewCommand();
			command.execute(request, response);
			viewPage = "notice_view.jsp";	
			break;
			
		case "/notice_update.do":
			command = new NSelectCommand();
			command.execute(request, response);
			viewPage = "notice_update.jsp";
			break;
			
		case "/notice_updateOk.do":
			command = new NUpdateCommand();
			command.execute(request, response);
			viewPage = "notice_updateOk.jsp";
			break;
			
		case "/notice_deleteOk.do":
			command = new NDeleteCommand();
			command.execute(request, response);
			viewPage = "notice_deleteOk.jsp";
			break;
			
		case "/qanda_list.do":
			command = new QListCommand();
			command.execute(request, response);
			viewPage = "qanda_list.jsp";
			break;
			
		case "/q_write.do":
			viewPage = "q_write.jsp";
			break;
			
		case "/q_writeOk.do":
			command = new QWriteCommand();
			command.execute(request, response);
			viewPage = "q_writeOk.jsp";
			break;
			
		case "/q_view.do":
			command = new QViewCommand();
			command.execute(request, response);
			viewPage = "q_view.jsp";	
			break;
			
		case "/q_update.do":
			command = new QSelectCommand();
			command.execute(request, response);
			viewPage = "q_update.jsp";
			break;
			
		case "/q_updateOk.do":
			command = new QUpdateCommand();
			command.execute(request, response);
			viewPage = "q_updateOk.jsp";
			break;
			
		case "/q_aupdateOk.do":
			command = new AWriteCommand();
			command.execute(request, response);
			viewPage = "q_aupdateOk.jsp";
			break;
			
			
			
		case "/q_deleteOk.do":
			command = new QDeleteCommand();
			command.execute(request, response);
			viewPage = "q_deleteOk.jsp";
			break;
			
		
		case "/My_write_list.do":
			command = new MyListCommand();  // q&a 현재로그인 된 사람 것 가져오기
			command.execute(request, response);
			viewPage = "My_write_list.jsp";
			break;
			
			
			
			////////////////////////
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			

		}	
		
		// 위에서 결정된 view 에 forward 해줌
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

}
