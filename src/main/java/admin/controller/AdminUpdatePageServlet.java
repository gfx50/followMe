package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.Admin;

/**
 * Servlet implementation class AdminUpdatePageServlet
 */
@WebServlet("/aoveup")
public class AdminUpdatePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdatePageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// 회원정보 수정페이지로 이동 처리용 컨트롤러
		
		//1. 전송온 값에 한글이 있으면 인코딩 처리함
		//2. 전송온 값 꺼내서 변수 또는 객체에 저장하기
		String adminEmail = request.getParameter("adminEmail");
		
		//3. 모델 서비스의 메소드로 값 전달 실행하고 결과 받기
		Admin admin = new AdminService().selectAdmin(adminEmail);
		
		//4. 받은 결과로 성공/실패 페이지 내보내기
		RequestDispatcher view = null;
		if(admin != null) {  //요청 성공시
			view = request.getRequestDispatcher("views/admin/adminUpdatePage.jsp");
			request.setAttribute("admin", admin);
		}else {  //요청 실패시
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", adminEmail + " 회원정보 조회 실패!");
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
