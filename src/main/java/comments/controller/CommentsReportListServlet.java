package comments.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comments.model.service.CommentsService;
import comments.model.vo.Comments;


/**
 * Servlet implementation class CommentsReportListServlet
 */
@WebServlet("/creportlist")
public class CommentsReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsReportListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자용 회원 전체 조회 처리용 컨트롤러
		
				ArrayList<Comments> list = new CommentsService().selectCommentsReportList();
				
				RequestDispatcher view = null;
				if(list.size() > 0) {
					view = request.getRequestDispatcher("views/admin/adminCommentsReportList.jsp");
					request.setAttribute("list", list);
					System.out.println(list);
				}else {
					view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", "회원 전체 조회 실패!");
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
