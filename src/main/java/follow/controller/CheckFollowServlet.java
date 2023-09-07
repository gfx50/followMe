package follow.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import follow.model.service.FollowService;
import member.model.vo.Member;

/**
 * Servlet implementation class CheckFollowServlet
 */
@WebServlet("/followcheck")
public class CheckFollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckFollowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Member member = (Member) request.getSession().getAttribute("loginMember");
        
        // 다른 사용자의 MID와 팔로우 여부를 가져옵니다. 이는 데이터베이스 쿼리 등으로 처리해야 합니다.
        
        FollowService followService = new FollowService();
        
        String followmid = request.getParameter("followmid");
        
        String loginmid = member.getmId();
 
        String isFollowing = followService.selectFollowYN(loginmid, followmid);
        
        System.out.println("로그인 아이디 : " + loginmid + ", 팔로이 아이디 : " + followmid + ", 결과 : " + isFollowing);
        
        // 예: "Y" 또는 "N"
        
        // JSON 형식으로 클라이언트에게 응답을 전달합니다.
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println("{");
        out.println("\"isFollowing\": \"" + isFollowing + "\"");
        out.println("}");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
