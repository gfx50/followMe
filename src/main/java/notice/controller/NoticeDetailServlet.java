package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;



/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/ndetail")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 (원글, 댓글, 대댓글) 상세보기 처리용 컨트롤러
		
				int noticeNum = Integer.parseInt(request.getParameter("nnum"));
				
				//페이징 처리를 위한 페이지 변수
				int currentPage = 1;
				if(request.getParameter("page") != null) {
					currentPage = Integer.parseInt(request.getParameter("page"));
				}
				
				//모델 서비스 객체 생성
				NoticeService nservice = new NoticeService();
				
				//해당 게시글에 대한 조회수 1증가 처리 : update
				nservice.addReadCount(noticeNum);
				
				//해당 게시글 리턴 받음 : select
				Notice notice = nservice.selectNotice(noticeNum);
				
				RequestDispatcher view = null;
				if(notice != null) {
					view = request.getRequestDispatcher("views/notice/noticeDetail.jsp");
					
					request.setAttribute("notice", notice);
					request.setAttribute("currentPage", currentPage);
				}else {
					view = request.getRequestDispatcher("views/common/error.jsp");
					
					request.setAttribute("message", noticeNum + "번 글 상세조회 실패!");
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
