package trail.controller;


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

/**
 * Servlet implementation class CheckBookmark
 */
@WebServlet("/checkbm")
public class CheckBookmark extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckBookmark() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 내 bookmarked 상태 가져오기 컨트롤러
		 //1. 전송온 값에 한글이 있으면 인코딩 처리함
	    //2. 전송온 값 꺼내서 변수 또는 객체에 저장하기
	    String trailId = request.getParameter("trailId");
	    Member member = (Member)request.getSession().getAttribute("loginMember");
	    BookService bservice = new BookService();
	    System.out.println(trailId);

	    //3. 모델 서비스의 메소드로 값 전달 실행하고 결과 받기
	    //Member member = new MemberService().selectMember();
	    Book book = bservice.selectTrailId(trailId, member.getmId());

	    // 북마크 상태 판단 로직
	    boolean isBookmarked = (book != null); // 만약 book 객체가 null이 아니면 북마크된 상태
	    System.out.println(isBookmarked);
	    request.setAttribute("isBookmarked", isBookmarked);
	    
	    
		
		 // JSON 형식으로 응답 데이터 생성
	     JSONObject responseData = new JSONObject();
		 responseData.put("isBookmarked", isBookmarked);
		 
		 
		 System.out.println(responseData);
		 
		 //응답 데이터 전송
		 response.setContentType("application/json");
		 response.setCharacterEncoding("UTF-8");
		 response.getWriter().write(responseData.toString());
		 
		 System.out.println(isBookmarked);
		 	RequestDispatcher view = request.getRequestDispatcher("views/trail/trailDetailView.jsp");
			//상대경로만 사용할 수 있음
			
			//지정한 뷰로 내보낼 정보나 객체가 있으면 request 에 기록 저장함
			//request.setAttribute(String name, Object value);
			
			//뷰를 포워딩함
			view.forward(request, response);
	    
	    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
