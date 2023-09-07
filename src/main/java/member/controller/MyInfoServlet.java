package member.controller;

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
import common.Paging;
import follow.model.service.FollowService;
import good.model.service.GoodService;
import good.model.vo.Good;
import member.model.vo.Member;
import trail.model.service.TrailService;
import trail.model.vo.Trail;

/**
 * Servlet implementation class MyInfoServlet
 */
@WebServlet("/myinfo")
public class MyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member)request.getSession().getAttribute("loginMember");
		String mId = member.getmId();
		// 페이지별로 출력되는 게시글 목록 조회 요청 처리용 컨트롤러
				//출력할 페이지 지정
				int currentPage = 1;
				//전송온 페이지 값이 있다면 추출함
				if(request.getParameter("page") != null) {
					currentPage = Integer.parseInt(request.getParameter("page"));
				}
				int limit = 10;
				
				//조회용 모델측 서비스 객체 생성
			    TrailService tservice = new TrailService();
				//총 페이지 수 계산을 위한 전체 목록 갯수 조회
				int listCount = tservice.getMyListCount(mId);
				//System.out.println("blist : " + listCount);
				
				//뷰 페이지에서 사용할 페이징 관련 값 계산 처리
				Paging paging = new Paging(listCount, currentPage, limit, "tlist");
				paging.calculator();
				
				//모델 서비스로 해당 페이지에 출력할 게시글만 조회해 옴
		//1. 전송온 값에 한글이 있으면 인코딩 처리함
		//2. 전송온 값 꺼내서 변수 또는 객체에 저장하기
		/* String email = (String)request.getSession().getAttribute("email"); */
		
		//3. 모델 서비스의 메소드로 값 전달 실행하고 결과 받기
		//Member member = new MemberService().selectMember();
		ArrayList<Trail> list = tservice.selectMyList(member.getmId(), paging.getStartRow(), paging.getEndRow());
	    BookService bservice = new BookService();
	    GoodService gservice = new GoodService();

		for (Trail trail : list) {
	        String trailId = trail.getTrailId(); 
	        Book book = bservice.selectTrailId(trailId, member.getmId());
	        boolean isBookmarked = (book != null);
	        Good good = gservice.selectTrailId(trailId, member.getmId());
	        boolean isLiked = (good != null);
	        int goodc = gservice.countGood(trailId);

	        ArrayList<Trail> photoList = tservice.getTrailPhotos(trailId);
	        
	        // 각 Trail 객체의 trailId를 키로 사용하여 request에 저장
	        request.setAttribute("trailId", trailId);
	        request.setAttribute("isBookmarked_" + trailId, isBookmarked);
	        request.setAttribute("isLiked_" + trailId, isLiked);
	        request.setAttribute("photoList_" + trailId, photoList); // 이미지 정보 속성 추가
		    request.setAttribute("goodc" + trailId, goodc);

	    }
		System.out.println("test list : " + list);
		
		String mid = member.getmId();
		
		FollowService followservice = new FollowService();
		
		ArrayList<Member> followeelist = followservice.selectListFollower(mid);
		
		ArrayList<Member> followerlist = followservice.selectListFollowee(mid);	
		
		System.out.println(list.toString());
		//4. 받은 결과로 성공/실패 페이지 내보내기
		System.out.println("myinfo test1");

		
		RequestDispatcher view = null;
		if(member != null) {  //요청 성공시
			view = request.getRequestDispatcher("views/member/profile.jsp");
			request.setAttribute("member", member);
			request.setAttribute("list", list);
			request.setAttribute("followeelist", followeelist);
			request.setAttribute("followerlist", followerlist);
			request.setAttribute("paging", paging);
			request.setAttribute("currentPage", currentPage);

			System.out.println("myinfo test2");
		}else {  //요청 실패시
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", member.getEmail() + " 회원정보 조회 실패!");
		}
		view.forward(request, response);
		System.out.println("myinfo test3");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
