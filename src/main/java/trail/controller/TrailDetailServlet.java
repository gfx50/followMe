package trail.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import trail.model.service.TrailService;
import trail.model.vo.Trail;

/**
 * Servlet implementation class TrailDetailServlet
 */
@WebServlet("/tdetail")
public class TrailDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrailDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 (원글, 댓글, 대댓글) 상세보기 처리용 컨트롤러
		
				String trailId = request.getParameter("trailId");
				
				//모델 서비스 객체 생성
				TrailService tservice = new TrailService();
				
				//해당 게시글에 대한 조회수 1증가 처리 : update
				tservice.addReadCount(trailId);
				
				//해당 게시글 리턴 받음 : select
				Trail trail = tservice.selectTrail(trailId);
				
				
				RequestDispatcher view = null;
				if(trail != null) {
					view = request.getRequestDispatcher("views/trail/trailDetailView.jsp");
					
					request.setAttribute("trail", trail);
					
				}else {
					view = request.getRequestDispatcher("views/common/error.jsp");
					
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
