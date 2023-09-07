package book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import book.model.service.BookService;
import book.model.vo.Book;
import member.model.vo.Member;
import trail.model.service.TrailService;
import trail.model.vo.Trail;

/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/book")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// 북마크 등록 처리용 컨트롤러
		
				//1. 전송온 값 꺼내서 변수 또는 객체에 저장하기
       

				String trailId = request.getParameter("trailId");
				TrailService tservice = new TrailService();
				System.out.println(trailId);
				Trail trail = tservice.selectTrail(trailId);
				Member member = (Member)request.getSession().getAttribute("loginMember");
				System.out.println(trailId);
				
				Book book = new Book();
				//book.setBookTime(request.getParameter("booktime"));
				book.setBookYN(request.getParameter("bookyn"));
				
				//3. 모델의 서비스 메소드로 값 전달 실행하고 결과받기
				int result = new BookService().insertBook(book, member, trail);
				//에러 페이지 테스트
				//int result = 0;
				
				 JSONObject jsonResponse = new JSONObject();
			        if (result > 0) {
			            jsonResponse.put("success", true);
			           jsonResponse.put("message", "북마크 등록이 완료되었습니다.");
			        } else {
			            jsonResponse.put("success", false);
			            jsonResponse.put("message", "오류가 발생했습니다. 다시 시도해주세요.");
			        }

			        response.setContentType("application/json");
			        response.setCharacterEncoding("UTF-8");
			        response.getWriter().write(jsonResponse.toString());
			    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
