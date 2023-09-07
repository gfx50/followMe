package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminUpdateLv
 */
@WebServlet("/updateLv")
public class AdminUpdateLvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateLvServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		
		member.setEmail(request.getParameter("email"));
		member.setLoginLv(Integer.parseInt(request.getParameter("lv")));
		
		int result = new MemberService().updateLv(member);
		
		if(result > 0) {
			//수정 성공시 마이 페이지 뷰가 출력되게 한다면, myinfo 서블릿을 구동시킴
			//서블릿에서 다른 서블릿을 실행시킬 수 있음
//			response.sendRedirect("/fm/views/admin/adminprofile.jsp?adminemail=" + admin.getAdminEmail());
			
			response.sendRedirect("/fm/amlist");
			//수정 성공시 메인페이지가 출력되게 한다면
			//response.sendRedirect("/first/index.jsp");
		}else {			
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			//상대경로만 사용할 수 있음
			
			//지정한 뷰로 내보낼 정보나 객체가 있으면 request 에 기록 저장함
			//request.setAttribute(String name, Object value);
			request.setAttribute("message", member.getLoginLv()+ " 레벨 조정 실패!");
			
			//뷰를 포워딩함
			view.forward(request, response);
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
