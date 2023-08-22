package member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class SelectMemberEmailServlet
 */
@WebServlet("/emailsearch")
public class SelectMemberEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectMemberEmailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 관리자용 회원관리 서비스에서 회원 검색 처리용 컨트롤러

		// 1. 전송온 값에 한글이 있다면 인코딩 처리함
		request.setCharacterEncoding("UTF-8");

		// 2. 전송온 값을 변수에 나눠 담는다
		String email = request.getParameter("email");

		// 3. 모델 서비스로 값 전달 실행하고 결과 받기
		MemberService mservice = new MemberService();
		Member member = new Member();

		member = mservice.selectSearchUserEmail(email);

		// 4. 받은 결과로 성공/실패 페이지 내보내기
		RequestDispatcher view = null;
		if (member != null) {
			System.out.println(member);
			view = request.getRequestDispatcher("views/adm/adm.jsp");
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", email + " 회원이 존재하지 않습니다.");
		}
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
