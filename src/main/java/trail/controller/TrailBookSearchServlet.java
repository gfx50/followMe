package trail.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import trail.model.service.TrailService;
import trail.model.vo.Trail;

/**
 * Servlet implementation class TrailBookSearchServlet
 */
@WebServlet("/tbook")
public class TrailBookSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrailBookSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TrailService tservice = new TrailService();
		
		Member member = (Member)request.getSession().getAttribute("loginMember");
		String mid = member.getmId();		
		
		// 북마크 한 게시물 최근순으로 불러오기
		ArrayList<Trail> list = tservice.selectSearchBookList(mid);
		System.out.println(list.toString());

		RequestDispatcher view = null;
		if (list.size() > 0) {
			view = request.getRequestDispatcher("views/trail/main.jsp");
			request.setAttribute("list", list);
		} else {
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
