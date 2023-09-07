package member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.ThumbnailMake;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/mupdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		// 회원정보 수정 처리용 컨트롤러
		
		//1. 전송온 값에 한글이 있다면 인코딩 처리함
		request.setCharacterEncoding("UTF-8");
		
		//2. 전송온 값 꺼내서 변수 또는 객체에 저장하기
		Member member = new Member();
		
		member.setEmail(request.getParameter("email"));
		member.setGender(request.getParameter("gender"));
		member.setPhone(request.getParameter("phone"));
		member.setmName(request.getParameter("mname"));

		System.out.println(member.getEmail() + ", " + member.getGender() + ", " + member.getPhone());
		//3. 모델 서비스 메소드로 값 또는 객체 전달 실행하고 결과받기
		int result = new MemberService().updateMember(member);
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
		         }else {
				System.out.println("이미 폴더가 생성되어 있습니다.");
			}
			// 6. 멀티파트리퀘스트 객체 생성함
			// 객체 생성과 동시에 자동 파일 업로드 작동함 
			MultipartRequest mrequest = new MultipartRequest(request, tempPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
//			originalFileName = mrequest.getFilesystemName("imgs[]");
//			System.out.println("/tinsert : " + originalFileName);

			String tId = mrequest.getParameter("tId");
			System.out.println("mId: " + mId + "tId: " + tId);
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/" + tId);
			File saveFolder = new File(savePath);
			tempFolder.renameTo(saveFolder);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
*/
		
		// 샘플 : 사진 첨부파일이 포함된 form 전송 처리 컨트롤러
		
		HttpSession session = request.getSession();
		Member oldLoginMember = (Member)session.getAttribute("loginMember");
		System.out.println("oldLoginMember : " + oldLoginMember);
				// 1. multipart 방식으로 인코딩되어서 전송왔는지 확인
				// 아니면 에러 페이지를 내보냄
				RequestDispatcher view = null;
				if (!ServletFileUpload.isMultipartContent(request)) {
					view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", "form의 enctype='multipart/form-data' 속성 누락됨.");
					view.forward(request, response);
				}

				// 2. 업로드할 파일의 용량 제한 설정 : 10메가바이트로 제한한다면
				int maxSize = 1024 * 1024 * 10;

				// 3. 업로드되는 파일의 저장 폴더 지정
				String savePath = request.getSession().getServletContext().getRealPath(
						"/resources/images");
				// request.getSession().getServletContext() => "/first" + 뒤에 하위 폴더 경로 추가함

				// 4. request 를 MultipartRequest 로 변환해야 함
				// MultipartRequest 클래스는 외부 라이브러리를 사용해야 함 : cos.jar 사용한 경우
				// MultipartRequest 객체가 생성되면, 자동으로 지정 폴더에 업로드된 파일이 저장됨
				MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
						new DefaultFileRenamePolicy());

				// 5. 데이터베이스 board 테이블에 기록할 값 추출
				// mrequest 사용해야 함 (request 사용 못 함)
				Member member = new Member();
				System.out.println("email :" + mrequest.getParameter("email"));
				System.out.println("비교 :" + (mrequest.getParameter("email").isBlank()));
				
				member.setmId(oldLoginMember.getmId());
				member.setEmail(mrequest.getParameter("email").isBlank()?oldLoginMember.getEmail():mrequest.getParameter("email"));
				member.setPwd(mrequest.getParameter("pwd").isBlank()?oldLoginMember.getPwd():mrequest.getParameter("pwd"));
				member.setNickName(mrequest.getParameter("nickname").isBlank()?oldLoginMember.getNickName():mrequest.getParameter("nickname"));
				member.setmName(mrequest.getParameter("mname").isBlank()?oldLoginMember.getmName():mrequest.getParameter("mname"));
				member.setPhone(mrequest.getParameter("phone").isBlank()?oldLoginMember.getPhone():mrequest.getParameter("phone"));
				
				// 6. 업로드된 원본 파일이름 추출
				String originalFileName = mrequest.getFilesystemName("profilepic");		
				System.out.println(originalFileName);
				// 7. 폴더에 저장된 파일의 이름바꾸기 처리
				// 저장 폴더에 같은 이름의 파일이 있을 경우를 대비하기 위함
				// "member_username.확장자" 형식으로 변경할 것임
				if(originalFileName != null && !originalFileName.isBlank()) {
//				String renameFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")); 
//				renameFileName += "_" + oldLoginMember.getmId()
//				+ "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				String renameFileName = oldLoginMember.getmId() + "_" + originalFileName;
					
				if (renameFileName != oldLoginMember.getProfilePic()) {
					// 업로드된 파일이 있을 때만 파일명 바꾸기 실행함
					
					//저장 폴더에 있는 원본 파일의 파일명 바꾸기함 : java.io.File 클래스의 메소드 이용함
					File originFile = new File(savePath + "\\" + originalFileName);
					File renameFile = new File(savePath + "\\" + renameFileName);
					
					if(!originFile.renameTo(renameFile)) {
						//renameTo() 메소드가 실패한 경우 (false), 직접 수동으로 바꾸기함
						//원본 파일의 내용을 읽어서 리네임파일에 복사해 넣고, 끝나면 원본 파일을 삭제함
						
						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout = new FileOutputStream(renameFile);
						
						int data = -1;
						while((data = fin.read()) != -1) {
							fout.write(data);
						}
						
						fin.close();
						fout.close();
						originFile.delete();  //원본 파일 삭제함
					} //직접 이름바꾸기
					ThumbnailMake thumb = new ThumbnailMake();
					thumb.makeUserThumb(savePath, renameFileName);

					member.setProfilePic(renameFileName);
				} else { try {
		            // 파일 삭제
					Path path = Paths.get(savePath + "\\" + originalFileName);
		            Files.delete(path);
		        } catch (NoSuchFileException e) {
		            System.out.println("삭제하려는 파일/디렉토리가 없습니다");
		        } catch (DirectoryNotEmptyException e) {
		            System.out.println("디렉토리가 비어있지 않습니다");
		        } catch (IOException e) {
		            e.printStackTrace();
		        } }
				} else {
					member.setProfilePic(oldLoginMember.getProfilePic());
				}
				
				System.out.println("/mupdate : " + member);
				
				// 모델 서비스 메소드로 전달하고 결과받기		
				int result = new MemberService().updateMember(member);
				// 받은 결과로 성공/실패 페이지 내보내기
			
	
		//4. 받은 결과로 내보낼 뷰 선택 처리
		if(result > 0) {
			//수정 성공시 마이 페이지 뷰가 출력되게 한다면, myinfo 서블릿을 구동시킴
			//서블릿에서 다른 서블릿을 실행시킬 수 있음
			Member newLoginMember = new MemberService().selectMember(member.getEmail());
			session.setAttribute("loginMember", newLoginMember);
			response.sendRedirect("/fm/myinfo?email=" + newLoginMember.getEmail());
			//수정 성공시 메인페이지가 출력되게 한다면
			//response.sendRedirect("/first/index.jsp");
		}else {			
			RequestDispatcher view1 = request.getRequestDispatcher("views/common/error.jsp");
			//상대경로만 사용할 수 있음
			
			//지정한 뷰로 내보낼 정보나 객체가 있으면 request 에 기록 저장함
			//request.setAttribute(String name, Object value);
			request.setAttribute("message", member.getmName() + " 회원 정보 수정 실패!");
			
			//뷰를 포워딩함
			view1.forward(request, response);
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
