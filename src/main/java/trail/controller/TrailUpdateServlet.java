package trail.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import trail.model.service.TrailService;
import trail.model.vo.Trail;

/**
 * Servlet implementation class TrailUpdateServlet
 */
@WebServlet("/tupdate")
public class TrailUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrailUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/tupdate : request arrived");
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginMember");
		String mId = member.getmId();
		// 1. 전송값에 한글이 있으면 인코딩 처리 (message, file name)
		request.setCharacterEncoding("utf-8");
		String trailId = request.getParameter("trailId").toUpperCase();
		System.out.println("/tupdate : " + trailId);
		
		String tjson = request.getParameter("trailJson");
		System.out.println("/tupdate: " + tjson);
		TrailService tservice = new TrailService();
		Trail trail = tservice.selectTrail(trailId);
		
		trail.setTrailJson(tjson);
		
		int result = tservice.updateTrail(trail);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.print("ok");
		} else {
			out.print("update failed");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
