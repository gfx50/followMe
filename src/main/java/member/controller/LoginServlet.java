package member.controller;

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
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
	
		String useremail = request.getParameter("useremail");
		String userpwd = request.getParameter("userpwd");
		
		System.out.println("userpwd : " + userpwd);
		
		String cryptoUserpwd = null;
		
		try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            
            byte[] pwdValues = userpwd.getBytes(Charset.forName("UTF-8"));
            
            md.update(pwdValues);
            
            cryptoUserpwd = Base64.getEncoder().encodeToString(pwdValues);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		System.out.println(useremail + ", " + cryptoUserpwd);
		Member loginMember = new MemberService().selectLogin(useremail, cryptoUserpwd);
		
		System.out.println("test1");
		System.out.println(loginMember);
		if(loginMember != null) { 
			
			HttpSession session = request.getSession();

			session.setAttribute("loginMember", loginMember);
			
			System.out.println("logintest1");
			
			response.sendRedirect("/fm/tlist");
			
		}else {  
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");

			request.setAttribute("message", "로그인 실패! 아이디 또는 암호를 다시 확인하고 로그인하세요.");
			
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트의 요청을 받는 메소드
		// 전송방식(method)이 post 방식으로 요청이 왔을 때 자동 연결됨
		//System.out.print("post 방식으로 전송 요청옴...");
		doGet(request, response);
	}

}
