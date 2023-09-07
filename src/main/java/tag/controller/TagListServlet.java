package tag.controller;

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
import common.Paging;
import tag.model.service.TagService;
import tag.model.vo.Tag;

/**
 * Servlet implementation class TagListServlet
 */
@WebServlet("/listtag")
public class TagListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TagListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 내가 쓴 댓글 확인
		
		
		Tag tag = new Tag();

		//조회용 모델측 서비스 객체 생성
		TagService tservice = new TagService();

//출력할 페이지 지정
		int currentPage = 1;
		//전송온 페이지 값이 있다면 추출함
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		//한 페이지당 출력할 목록 갯수 지정
		int limit = 10;
		//전송온 목록 갯수가 있다면 추출함
		if(request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		
		int listCount = tservice.getListCount();
		
		Paging paging = new Paging(listCount, currentPage, limit, "listtag");
		
		ArrayList<Tag> list = new TagService().selectTagList(paging);
		
		RequestDispatcher view = null;
		if(list.size() > 0) {
			view = request.getRequestDispatcher("views/tag/tagList.jsp");
			request.setAttribute("tag", tag);
			request.setAttribute("list", list);
			
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "회원 댓글 조회 실패!");
		}
		view.forward(request, response);
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

}
}