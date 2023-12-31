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
 * Servlet implementation class MyTrailListServlet
 */
@WebServlet("/tmylist")
public class MyTrailListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyTrailListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TrailService tservice = new TrailService();

		
		Member member = (Member)request.getSession().getAttribute("loginMember");
		String mid = request.getParameter(member.getmId());
		
		// 내 게시물 최근순으로 불러오기
		int i = 0 , j = 1; // 에러 회피용
		ArrayList<Trail> list = tservice.selectMyList(mid,i,j);
		System.out.println(list.toString());
		

		RequestDispatcher view = null;
		if (list.size() > 0) {
			view = request.getRequestDispatcher("views/member/profile.jsp");
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
