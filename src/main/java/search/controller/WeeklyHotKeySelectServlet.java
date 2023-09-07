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
 * Servlet implementation class WeeklyHotKeySelectServlet
 */
@WebServlet("/weeklyhotselect")
public class WeeklyHotKeySelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WeeklyHotKeySelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 태그 클릭시 메인뷰 연결
		
		request.setCharacterEncoding("UTF-8");
		
		String tagName = request.getParameter("tagname");
		int currentPage = 1; // 기본으로 1페이지를 보여줌

		// 만약 요청 파라미터로 페이지 번호가 제공되었다면 해당 페이지를 사용
		String pageParam = request.getParameter("page");
		if (pageParam != null) {
			currentPage = Integer.parseInt(pageParam);
		}
		
		int limit = 5;
		
		int listCount = new SearchService().selectTagViewsCount(tagName);
		System.out.println("listCount : " + listCount);
		Paging paging = new Paging(listCount, currentPage, limit, "userrankingselect");
		paging.calculator();
		
		SearchService sservice = new SearchService();
		
		ArrayList<Trail> list = sservice.selectWeeklyBestTagMainView(tagName, paging.getStartRow(), paging.getEndRow());
		 System.out.println(list.toString()); 
		
		
		RequestDispatcher view = null;
		if (list.size() > 0) {
			view = request.getRequestDispatcher("views/trail/clickTagRankingView.jsp");
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
