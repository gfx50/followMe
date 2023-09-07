package member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.service.MemberService;
import member.model.vo.Member;



/**
 * Servlet implementation class EnrollServlet
 */
@WebServlet("/enroll")
public class EnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher view = null;
		if (!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "form의 enctype='multipart/form-data' 속성 누락됨.");
			view.forward(request, response);
		}
		
		int maxSize = 1024 * 1024 * 10;
		
		String savePath = request.getSession().getServletContext().getRealPath(
				"/resources/images");
		
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
			
		Member member = new Member();  
		
		member.setmName(mrequest.getParameter("mName"));
		
		member.setNickName(mrequest.getParameter("nickname"));
		
		String birthDateStr = mrequest.getParameter("birthDate");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
		    java.util.Date utilBirthDate = dateFormat.parse(birthDateStr);
		    java.sql.Date sqlBirthDate = new java.sql.Date(utilBirthDate.getTime());
		    member.setBirthDate(sqlBirthDate);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		
		member.setGender(mrequest.getParameter("gender"));
		member.setPhone(mrequest.getParameter("phone"));
		member.setEmail(mrequest.getParameter("email"));
		
		String userpwd = mrequest.getParameter("pwd"); 
		
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
		
		String originalFileName = mrequest.getFilesystemName("profilepic");		
		System.out.println(originalFileName);
		
		String mid = UUID.randomUUID().toString().replaceAll("-", "");
		
		if(originalFileName != null) {
			
			String renameFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")); 
			renameFileName += "_" + mid
			+ "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			
			member.setProfilePic(renameFileName);
		}
		
		member.setmId(mid);
		
		int result = new MemberService().insertMember(member);
		
		if(result > 0) {

			response.sendRedirect("/fm/views/member/login.jsp");
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");

			request.setAttribute("message", "회원가입 실패!");
			
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
