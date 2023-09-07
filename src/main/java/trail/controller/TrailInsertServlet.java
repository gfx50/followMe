package trail.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.ThumbnailMake;
import member.model.vo.Member;
import trail.model.service.TrailService;
import trail.model.vo.Trail;


/**
 * Servlet implementation class TrailInsertServlet
 */
@WebServlet("/tinsert")
public class TrailInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrailInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/tinsert : request arrived");
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginMember");
		String mId = member.getmId();
//		System.out.println("/tinsert : " + member.getEmail() + ", " + member.getmId());
		
		// 1. 전송값에 한글이 있으면 인코딩 처리 (message, file name)
		request.setCharacterEncoding("utf-8");
		// 2. 전송 파일의 용량 제한 설정 : 10 megabyte 로 정한다면
		int sizeLimit = 1024 * 1024 * 100;
		
		JSONObject tJson = new JSONObject();
		// 3. 멀티파트가 아니면 trailJson 받아서 트레일 등록
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(!isMultipart) {  
			
			System.out.println("json request arrived");
			
			StringBuffer jb = new StringBuffer();
			String line = null;
			try {
			    BufferedReader reader = request.getReader();
			    while ((line = reader.readLine()) != null)
			        jb.append(line);
			} catch (Exception e) { /*report an error*/ }

			try {
			    JSONParser parser = new JSONParser();
			     tJson = (JSONObject) parser.parse(jb.toString());
			} catch (Exception e) {
			    // crash and burn
			    throw new IOException("Error parsing JSON request string");
			}
			System.out.println("/tinsert:trailId: " + tJson.get("trailId"));
			String tId = tJson.get("trailId").toString();
//			
//			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/" + tId);
//			File Folder = new File(savePath);
//			if (!Folder.exists()) {
//				try{
//				    Folder.mkdir(); //폴더 생성합니다.
//				    System.out.println("폴더가 생성되었습니다.");
//			        } 
//			        catch(Exception e){
//				    e.getStackTrace();
//				}        
//		         }else {
//				System.out.println("이미 폴더가 생성되어 있습니다.");
//			}
//			
			Trail trail = new Trail();
			trail.setTrailId(tId);
			trail.setmId(mId);
			trail.setTrailJson(tJson.toJSONString());
			
			int result = new TrailService().insertTrail(trail);
			// multipart 설정이 되어 있지 않다면
//			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
//			request.setAttribute("msg", "multipart 설정을 하지 않았습니다.");
//			view.forward(request, response);
			System.out.println("result : " + result);
			
		} else {
		

		// 4. 업로드되는 파일 저장 위치 지정
		
		
		// 5. 파일명 저장 변수 
//		String originalFileName = null;
		
		try {
			String tempPath = request.getSession().getServletContext().getRealPath("/resources/upfiles/" + mId);
			File tempFolder = new File(tempPath);
			if (!tempFolder.exists()) {
				try{
				    tempFolder.mkdir(); //폴더 생성합니다.
				    System.out.println("폴더가 생성되었습니다.");
			        } 
			        catch(Exception e){
				    e.getStackTrace();
			        }        
		         } else {
		        	 File renameTemp = new File("rename_" + tempPath);
		        	 tempFolder.renameTo(renameTemp);
		        	 tempFolder = new File(tempPath);
		        	 tempFolder.mkdir();
				System.out.println("이미 폴더가 생성되어 있습니다.");
			}
			// 6. 멀티파트리퀘스트 객체 생성함
			// 객체 생성과 동시에 자동 파일 업로드 작동함 
			MultipartRequest mrequest = new MultipartRequest(request, tempPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			String tId = mrequest.getParameter("tId");
			System.out.println("mId: " + mId + "tId: " + tId);
//			originalFileName = mrequest.getFilesystemName("imgs[]");
//			System.out.println("/tinsert : " + originalFileName);

			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/" + tId);
			File saveFolder = new File(savePath);
			tempFolder.renameTo(saveFolder);
			
			ThumbnailMake thumb = new ThumbnailMake();
			thumb.make(savePath);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		response.getWriter().append("file upload ok");
		response.getWriter().append("{}");
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
