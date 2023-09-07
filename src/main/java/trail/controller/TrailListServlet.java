package trail.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.Book;
import common.Paging;
import good.model.service.GoodService;
import good.model.vo.Good;
import member.model.vo.Member;
import trail.model.service.TrailService;
import trail.model.vo.Trail;

/**
 * Servlet implementation class TrailListServlet
 */
@WebServlet("/tlist")
public class TrailListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TrailListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		// 페이지별로 출력되는 게시글 목록 조회 요청 처리용 컨트롤러
		//출력할 페이지 지정
		int currentPage = 1;
		//전송온 페이지 값이 있다면 추출함
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		
		//조회용 모델측 서비스 객체 생성
	    TrailService tservice = new TrailService();
		//총 페이지 수 계산을 위한 전체 목록 갯수 조회
		int listCount = tservice.getListCount();
		//System.out.println("blist : " + listCount);
		
		//뷰 페이지에서 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "tlist");
		paging.calculator();
		
		//모델 서비스로 해당 페이지에 출력할 게시글만 조회해 옴
		
		
	    
	    BookService bservice = new BookService();
	    GoodService gservice = new GoodService();
	    Member member = (Member) request.getSession().getAttribute("loginMember");
		

	    // 모든 게시글을 조회해 옴 
		ArrayList<Trail> list = tservice.selectList(paging.getStartRow(), paging.getEndRow());
	    
	    for (Trail trail : list) {
	        String trailId = trail.getTrailId(); 
	        Book book = bservice.selectTrailId(trailId, member.getmId());
	        boolean isBookmarked = (book != null);
	        Good good = gservice.selectTrailId(trailId, member.getmId());
	        boolean isLiked = (good != null);
	        int goodc = gservice.countGood(trailId);

	        
	        ArrayList<Trail> photoList = tservice.getTrailPhotos(trailId);
	        
	        
	        
	        // 각 Trail 객체의 trailId를 키로 사용하여 request에 저장
	        request.setAttribute("trailId", trailId);
	        request.setAttribute("isBookmarked_" + trailId, isBookmarked);
	        request.setAttribute("isLiked_" + trailId, isLiked);
	        request.setAttribute("photoList_" + trailId, photoList); // 이미지 정보 속성 추가
		    request.setAttribute("goodc" + trailId, goodc);

	    }
	    
	    RequestDispatcher view = null;
	    if (list.size() > 0) {
	        view = request.getRequestDispatcher("views/trail/main.jsp");
	        request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			request.setAttribute("currentPage", currentPage);

	    } else {
	        view = request.getRequestDispatcher("views/common/error.jsp");
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
