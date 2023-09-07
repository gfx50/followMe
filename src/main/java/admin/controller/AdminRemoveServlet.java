package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.service.MemberService;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/aremove")
public class AdminRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자회원(삭제) 처리용 컨트롤러
		
		String adminEmail = request.getParameter("adminEmail");
		System.out.println("AdminRemoveServlet : " + adminEmail );
		
		int result = new AdminService().removeAdmin(adminEmail);
		System.out.println(result);
		
		if(result > 0) {
			//회원 정보 삭제 성공시, logout 서블릿 실행함
			response.sendRedirect("/fm/views/admin/adminMenu.jsp");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			//상대경로만 사용할 수 있음
			
			//지정한 뷰로 내보낼 정보나 객체가 있으면 request 에 기록 저장함
			//request.setAttribute(String name, Object value);
			request.setAttribute("message", adminEmail + " 회원 정보 삭제(탈퇴) 실패!");
			
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
