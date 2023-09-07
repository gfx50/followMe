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
import common.Paging;
import member.model.vo.Member;
import notice.model.service.NoticeService;

/**
 * Servlet implementation class selectMyCommentsListServlet
 */
@WebServlet("/cmylist")
public class CommentsMyCommentsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsMyCommentsListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 내가 쓴 댓글 확인
		
		Member member = (Member)request.getSession().getAttribute("loginMember");
		//조회용 모델측 서비스 객체 생성
		CommentsService cservice = new CommentsService();
				
		
		//출력할 페이지 지정
		int currentPage = 1;
		//전송온 페이지 값이 있다면 추출함
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		//한 페이지당 출력할 목록 갯수 지정
		int limit = 20;
		//전송온 목록 갯수가 있다면 추출함
		if(request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		//System.out.println("limit : " + limit);
		
		
		//총 페이지 수 계산을 위한 전체 목록 갯수 조회
		int listCount = cservice.getListCount(member.getmId());
		System.out.println("comments : " + listCount);
		Paging paging = new Paging(listCount, currentPage, limit, "cmylist");
		System.out.println("CommentsMyCommentsListServlet start = " + paging.getStartRow());
		System.out.println("CommentsMyCommentsListServlet end = " +paging.getEndRow());
		
		ArrayList<Comments> list = new CommentsService().selectMyCommentsList(member.getmId(), paging);
		
		RequestDispatcher view = null;
		if(list.size() > 0) {
			view = request.getRequestDispatcher("views/member/memberMyCommentsList.jsp");
			request.setAttribute("member", member);
			request.setAttribute("list", list);
			System.out.println(member);
			System.out.println(list);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
