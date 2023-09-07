package message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import message.model.service.MessageService;
import message.model.vo.Message;

/**
 * Servlet implementation class MessageCollectionServlet
 */
@WebServlet("/msgcol")
public class MessageCollectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageCollectionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * MessageService mservice = new MessageService();
		 * 
		 * 
		 * ArrayList<Message> list = bservice.selectList(paging.getStartRow(),
		 * paging.getEndRow());
		 */
		
		//request.getSession().getAttribute("loginMember");
		
		
		System.out.println("불러온 session 객체 확인 : " + request.getSession().getAttribute("loginMember"));
		
		RequestDispatcher view = null;
		if(request.getSession().getAttribute("loginMember") != null) {
		
			Member member = (Member) request.getSession().getAttribute("loginMember");
			
			MessageService mservice = new MessageService();
			
			ArrayList<Message> list = mservice.selectList(member.getmId());
			
			
				view = request.getRequestDispatcher("views/message/messageList.jsp");
				
				request.setAttribute("list", list);
			
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			
			request.setAttribute("message", "먼저 로그인 해주세요.");
		}
		
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
