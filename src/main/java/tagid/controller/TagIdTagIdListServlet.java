package tagid.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import tag.model.vo.Tag;
import tagid.model.service.TagIdService;
import tagid.model.vo.TagId;

/**
 * Servlet implementation class TagListServlet
 */
@WebServlet("/listtagid")
public class TagIdTagIdListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TagIdTagIdListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 유저 태그 아이디 관리
		
		
		TagId tagid = new TagId();

		//조회용 모델측 서비스 객체 생성
		TagIdService tidservice = new TagIdService();

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
		
		int listCount = tidservice.getListCount();
		
		Paging paging = new Paging(listCount, currentPage, limit, "listtagid");
		
		ArrayList<TagId> list = new TagIdService().selectTagIdList(paging);
		
		RequestDispatcher view = null;
		if(list.size() > 0) {
			view = request.getRequestDispatcher("views/tagid/tagidList.jsp");
			request.setAttribute("tagid", tagid);
			request.setAttribute("list", list);
			
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "유저 태그 아이디 조회 실패!");
		}
		view.forward(request, response);
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

}
}