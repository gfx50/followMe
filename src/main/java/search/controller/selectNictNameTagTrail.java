package search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import search.model.service.SearchService;
import trail.model.vo.Trail;

/**
 * Servlet implementation class selectTagTrail
 */
@WebServlet("/tagnicknamesearch")
public class selectNictNameTagTrail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectNictNameTagTrail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 태그 검색 서블릿
		
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		
		
		
		
		
		
		
		ArrayList<Trail> list = new SearchService().searchByTag(keyword);
		System.out.println(list.toString());
		
		RequestDispatcher view = null;
		
		
		if (list.size() > 0) {
		    view = request.getRequestDispatcher("views/trail/main.jsp");
		    request.setAttribute("list", list);
		} else {
		    list = new SearchService().searchByNickName(keyword);
		    if (list.size() > 0) {
		        view = request.getRequestDispatcher("views/trail/main.jsp");
		        request.setAttribute("list", list);
		    } else {
		        view = request.getRequestDispatcher("views/common/error.jsp");
		    }
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
