package trail.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.Book;
import comments.model.service.CommentsService;
import comments.model.vo.Comments;
import good.model.service.GoodService;
import good.model.vo.Good;
import member.model.vo.Member;
import thread.model.service.ThreadService;
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
				// String mId = request.getParameter("mId");
				//모델 서비스 객체 생성
				TrailService tservice = new TrailService();
				ThreadService thservice = new ThreadService();
				//해당 게시글 리턴 받음 : select
				Trail trail = tservice.selectTrail(trailId);
				BookService bservice = new BookService();
				Member member = (Member)request.getSession().getAttribute("loginMember");
				GoodService gservice = new GoodService();

				//해당 게시글에 대한 조회수 1증가 처리 : update
				tservice.addReadCount(trailId);
				
				
				CommentsService cservice = new CommentsService();
				
				ArrayList<Comments> clist = cservice.selectCommentsList(trailId); 

				
				Book book = bservice.selectTrailId(trailId, member.getmId());
				Good good = gservice.selectTrailId(trailId, member.getmId());
				int goodc = gservice.countGood(trailId);
			    boolean isBookmarked = (book != null); // 만약 book 객체가 null이 아니면 북마크된 상태
				boolean isLiked = (good != null);
			    System.out.println(isBookmarked);
		        ArrayList<Trail> photoListm = tservice.getTrailPhotos(trailId);

				
				ArrayList<Trail> list = thservice.selectThreadList(trailId);
				for (Trail t : list) {
				    String currentTrailId = t.getTrailId(); // 현재 처리 중인 Trail의 trailId를 따로 저장
				    book = bservice.selectTrailId(currentTrailId, member.getmId());
				    boolean isBookmarked_ = (book != null);
				    good = gservice.selectTrailId(currentTrailId, member.getmId());
				    boolean isLiked_ = (good != null);
				    int goodtc = gservice.countGood(currentTrailId);
				   
			        ArrayList<Trail> photoList = tservice.getTrailPhotos(currentTrailId);
			     // 각 Trail 객체의 trailId를 키로 사용하여 request에 저장
				    request.setAttribute("trailId", currentTrailId);
				    request.setAttribute("isBookmarked_" + currentTrailId, isBookmarked_);
				    request.setAttribute("isLiked_" + currentTrailId, isLiked_);
				    request.setAttribute("goodtc" + currentTrailId, goodtc);
			        request.setAttribute("photoList_" + currentTrailId, photoList); // 이미지 정보 속성 추가

				    System.out.println(currentTrailId);
				}
			        
				
				RequestDispatcher view = null;
				if(trail != null) {
					view = request.getRequestDispatcher("views/trail/trailDetailView.jsp");
					
					request.setAttribute("trail", trail);
					request.setAttribute("clist", clist);
					request.setAttribute("list", list);
			     	request.setAttribute("isBookmarked", isBookmarked);
			     	request.setAttribute("isLiked", isLiked);
			     	request.setAttribute("goodc", goodc);
			        request.setAttribute("photoListm", photoListm); // 이미지 정보 속성 추가
					
					
				}else {
					view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", "상세 보기 에러");
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
