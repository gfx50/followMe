package follow.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import follow.model.service.FollowService;
import member.model.vo.Member;

/**
 * Servlet implementation class FollowerListServlet
 */
@WebServlet("/aflist")
public class AnotherFollowerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnotherFollowerListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid");
		
		FollowService followservice = new FollowService();
		
		ArrayList<Member> list = followservice.selectListFollower(mid);
		
		ArrayList<Member> list2 = followservice.selectListFollowee(mid);		
		
		RequestDispatcher view = null;
		
		if(list != null) {
			view = request.getRequestDispatcher("views/follow/anotherFollowListView.jsp");
			
			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
			
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
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
