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
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/nupview")
public class NoticeUpdatepageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdatepageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 수정페이지 출력 요청 처리용 컨트롤러
				// 전송받은 글번호를 조회해서, 수정페이지에 수정할 글 내용이 출력되게 전달해야 함
				
				int noticeNum = Integer.parseInt(request.getParameter("nnum"));
				int currentPage = Integer.parseInt(request.getParameter("page"));
				
				Notice notice = new NoticeService().updatepageNotice(noticeNum);
				
				RequestDispatcher view = null;
				if(notice != null) {
					view = request.getRequestDispatcher("views/notice/noticeUpdate.jsp");
					request.setAttribute("notice", notice);
					request.setAttribute("currentPage", currentPage);
				}else {
					view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", noticeNum + "번 게시글 수정페이지로 이동 실패!");
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
