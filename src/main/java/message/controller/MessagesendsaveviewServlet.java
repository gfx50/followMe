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
 * Servlet implementation class MessagesendsaveviewServlet
 */
@WebServlet("/sendview")
public class MessagesendsaveviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessagesendsaveviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	

		
			Member member = (Member) request.getSession().getAttribute("loginMember");
			
			MessageService mservice = new MessageService();
			
			ArrayList<Message> list = mservice.selectListsend(member.getmId());
			
			RequestDispatcher view = null;
			
	
				view = request.getRequestDispatcher("views/message/messagesendsaveForm.jsp");
				
				request.setAttribute("list", list);
			

		
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
