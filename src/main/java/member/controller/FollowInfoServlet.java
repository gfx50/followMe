package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import follow.model.service.FollowService;
import member.model.service.MemberService;
import member.model.vo.Member;
import trail.model.service.TrailService;
import trail.model.vo.Trail;

/**
 * Servlet implementation class FollowInfoServlet
 */
@WebServlet("/info")
public class FollowInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid");
		
		MemberService memberservice = new MemberService();
		
		TrailService tservice = new TrailService();
		Member member = memberservice.selectFollowMember(mid);
		
		ArrayList<Trail> list = tservice.selectMyList(mid);
		
		FollowService followservice = new FollowService();
		
		ArrayList<Member> followeelist = followservice.selectListFollower(mid);
		
		ArrayList<Member> followerlist = followservice.selectListFollowee(mid);	
		
		RequestDispatcher view = null;
		
		if(member != null) {  //요청 성공시
			view = request.getRequestDispatcher("views/member/anotherProfile.jsp");
			request.setAttribute("member", member);
			request.setAttribute("list", list);
			request.setAttribute("followeelist", followeelist);
			request.setAttribute("followerlist", followerlist);
		}else {  //요청 실패시
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message"," 회원정보 조회 실패!");
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
