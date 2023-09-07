package search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import search.model.service.SearchService;
import trail.model.vo.Trail;

/**
 * Servlet implementation class ViewsMaxCountServlet
 */
@WebServlet("/viewsmax")
public class ViewsMaxCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewsMaxCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 주간 조회 수 메인 뷰
		
		int currentPage = 1; // 기본으로 1페이지를 보여줌

		// 만약 요청 파라미터로 페이지 번호가 제공되었다면 해당 페이지를 사용
		String pageParam = request.getParameter("page");
		if (pageParam != null) {
			currentPage = Integer.parseInt(pageParam);
		}
		
		int limit = 10;
		
		int listCount = new SearchService().selectMaxViewsCount();
		System.out.println("listCount : " + listCount);
		
		Paging paging = new Paging(listCount, currentPage, limit, "viewsmax");
		paging.calculator();
		
		
		// 오늘의 게시물 목록 가져오기 (페이징 처리 적용)
		ArrayList<Trail> list = new SearchService().selectWeeklyBestReadCountViewsMax(paging.getStartRow(), paging.getEndRow());
		System.out.println("list 서블릿  :" + list.toString());
		// 총 게시물 수 (페이징 계산에 사용)
		System.out.println(list.size());
		RequestDispatcher view = null;
		if (list.size() > 0) {
			view = request.getRequestDispatcher("views/trail/weeklyviewsmaxcount.jsp");
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);	
			request.setAttribute("currentPage", currentPage);
			
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", currentPage + "페이지에 대한 목록 조회 실패");
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
