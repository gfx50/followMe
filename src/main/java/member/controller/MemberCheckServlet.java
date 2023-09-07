package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberCheckServlet
 */
@WebServlet("/checkm")
public class MemberCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member member =new Member();
		
		member.setEmail(request.getParameter("email"));
		
		String userpwd = request.getParameter("pwd");
		
		System.out.println(userpwd);
		
		String cryptoUserpwd = null;
		 
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");

			byte[] pwdValues = userpwd.getBytes(Charset.forName("UTF-8"));

			md.update(pwdValues);

			cryptoUserpwd = Base64.getEncoder().encodeToString(pwdValues);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		member.setPwd(cryptoUserpwd);
		
		System.out.println("email : " + member.getEmail() + ", pwd : " + member.getPwd());
		
		int checkm = new MemberService().selectCheckm(member);
		
		String returnValue = null;
		if(checkm == 0) {
			returnValue = "no";
		}else {
			returnValue = "ok";
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(returnValue);
		out.flush();
		out.close();
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
