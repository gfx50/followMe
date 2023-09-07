package comments.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comments.model.service.CommentsService;
import comments.model.vo.Comments;

/**
 * Servlet implementation class CommentsWriteServlet
 */
@WebServlet("/cwrite")
public class CommentsWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String trailId = request.getParameter("trailId");
		String mId = request.getParameter("mId");
		String body = request.getParameter("body");
		System.out.println("cwrite : " + body);
		Comments comments = new Comments();
		
		comments.setTrailId(trailId);
		comments.setmId(mId);
		comments.setCommentsContent(body);
		
		CommentsService cservice = new CommentsService();
		int result = cservice.insertComments(comments);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.print(body);
		} else {
			out.print("update failed");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
