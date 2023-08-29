package thread.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thread.model.service.ThreadService;
import trail.model.vo.Trail;
import thread.model.vo.Thread;

/**
 * Servlet implementation class ThreadListServlet
 */
@WebServlet("/thlist")
public class ThreadListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThreadListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 ArrayList<Thread> threadList = new ThreadService().getThreadList(); // ThreadService 클래스에 getThreadList 메소드를 구현해야 함

        // 쓰레드 목록을 request 속성에 저장
        request.setAttribute("threadList", threadList);

        // JSP로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/path/to/your/threadlist.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
