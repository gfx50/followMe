package admin.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.Admin;

/**
 * Servlet implementation class AdminUpdateServlet
 */
@WebServlet("/aupdate")
public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원정보 수정 처리용 컨트롤러
		
				//1. 전송온 값에 한글이 있다면 인코딩 처리함
				request.setCharacterEncoding("UTF-8");
				
				//2. 전송온 값 꺼내서 변수 또는 객체에 저장하기
				Admin admin = new Admin();
				
				admin.setAdminEmail(request.getParameter("email"));
				
				System.out.println(request.getParameter("email"));
				admin.setAdminPwd(request.getParameter("pwd"));
				admin.setAdminLv(Integer.parseInt(request.getParameter("lv")));
			
				String userpwd = request.getParameter("pwd");  //암호화 처리를 위해 변수에 저장함
				
				String cryptoUserpwd = null;
				
				
				try {
					MessageDigest md = MessageDigest.getInstance("SHA-512");
					
					//패스워드 문자열을 암호문으로 바꾸려면, byte[] 로 변환해야 함
					byte[] pwdValues = userpwd.getBytes(Charset.forName("UTF-8"));
					//암호문으로 바꾸기
				    md.update(pwdValues);
				//암호화된 byte[] 을 String 으로 바꿈 : 암호문 상태임
					cryptoUserpwd = Base64.getEncoder().encodeToString(pwdValues);
					
					//확인
					System.out.println("암호화된 패스워드 : " + cryptoUserpwd);
					System.out.println("글자길이 : " + cryptoUserpwd.length());
				} catch (Exception e) {			
					e.printStackTrace();
				}
				
				admin.setAdminPwd(cryptoUserpwd);
				
				

				System.out.println(admin.getAdminPwd() + ", " + admin.getAdminLv());
				//3. 모델 서비스 메소드로 값 또는 객체 전달 실행하고 결과받기
				int result = new AdminService().updateAdmin(admin);
				
				//4. 받은 결과로 내보낼 뷰 선택 처리
				if(result > 0) {
					//수정 성공시 마이 페이지 뷰가 출력되게 한다면, myinfo 서블릿을 구동시킴
					//서블릿에서 다른 서블릿을 실행시킬 수 있음
//					response.sendRedirect("/fm/views/admin/adminprofile.jsp?adminemail=" + admin.getAdminEmail());
					response.sendRedirect("/fm/views/admin/adminMenu.jsp");
					//수정 성공시 메인페이지가 출력되게 한다면
					//response.sendRedirect("/first/index.jsp");
				}else {			
					RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
					//상대경로만 사용할 수 있음
					
					//지정한 뷰로 내보낼 정보나 객체가 있으면 request 에 기록 저장함
					//request.setAttribute(String name, Object value);
					request.setAttribute("message", admin.getAdminEmail()+ " 회원 정보 수정 실패!");
					
					//뷰를 포워딩함
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
