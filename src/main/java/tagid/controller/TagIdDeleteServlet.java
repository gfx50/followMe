package tagid.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tagid.model.service.TagIdService;
import tagid.model.vo.TagId;

/**
 * Servlet implementation class TagDeleteServlet
 */
@WebServlet("/deletetagid")
public class TagIdDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TagIdDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자용 태그네임 삭제 처리용 컨트롤러
		
				//관리자용 태그네임 삭제 처리용 컨트롤러
				TagId tagid = new TagId();
				

				String tagidname = request.getParameter("tagidname");
				int result = new TagIdService().deleteTagId(tagidname);

				if(result > 0) {
					
					
					response.sendRedirect("/fm/listtagid");
				}else {
					RequestDispatcher view = 
							request.getRequestDispatcher(
									"views/common/error.jsp");
					request.setAttribute("message", 
							tagidname + " 태그 네임 삭제 실패!");
					view.forward(request, response);
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
