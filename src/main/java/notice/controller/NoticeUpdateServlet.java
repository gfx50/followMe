package notice.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/nupdate")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
				String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_upfiles");
				// request.getSession().getServletContext() => "/first" + 뒤에 하위 폴더 경로 추가함
		
				// 4. request 를 MultipartRequest 로 변환해야 함
				// MultipartRequest 클래스는 외부 라이브러리를 사용해야 함 : cos.jar 사용한 경우
				// MultipartRequest 객체가 생성되면, 자동으로 지정 폴더에 업로드된 파일이 저장됨
				MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
						new DefaultFileRenamePolicy());
				
		
		
		
		
		
		//2. 전송온 값 꺼내서 변수 또는 객체에 저장하기
		Notice notice = new Notice();
		
		notice.setNoticeId(mrequest.getParameter("num"));
		notice.setNoticeTitle(mrequest.getParameter("title"));
		notice.setAdminEmail(mrequest.getParameter("writer"));
		notice.setNoticeContent(mrequest.getParameter("content"));
		
		String dateStr = mrequest.getParameter("time"); // 사용자로부터 입력받은 날짜 문자열

	
	try {
            notice.setNoticeDate(java.sql.Date.valueOf(dateStr)); // 파싱한 java.sql.Date 객체를 Notice 객체에 설정
        } catch (Exception e) {
          // 날짜를 파싱할 때 오류가 발생할 수 있으므로, 예외 처리가 필요합니다.
            e.printStackTrace(); // 예외 처리 방식을 적절하게 설정하세요.
        }
		
		//이전 첨부파일에 대한 삭제여부 값 추출
				String deleteFlag = mrequest.getParameter("deleteFlag");	
				
				//이전 첨부파일의 파일명 추출
				String originalFilePath = mrequest.getParameter("ofile");
				System.out.println("ofile" +  mrequest.getParameter("ofile"));
				
				// 6. 새로 업로드된 원본 파일이름 추출
				String originalFileName = mrequest.getFilesystemName("afile");
				System.out.println("afile" + mrequest.getFilesystemName("afile"));
				notice.setFileName(originalFileName);
				
				//첨부파일 확인 : 
				// 원래 첨부파일과 새로 업로드된 파일의 이름이 같고, 파일 용량도 동일하면
				// 그대로 board 에 기록함
				// 파일 객체 만들어서 파일크기 비교함
				File newOriginFile = new File(savePath + "\\" + originalFileName);
				File originFile = new File(savePath + "\\" + originalFilePath);
				
				if(originalFilePath.equals(originalFileName) == true 
						&& newOriginFile.length() == originFile.length()) {
					notice.setFileName(originalFileName);
				}
				
				//원래 첨부파일이 있었는데, 변경되지 않은 경우
				if(originalFilePath != null && originalFileName == null) {
					notice.setFileName(originalFilePath);
				}
				
				//원래 첨부파일이 있었는데 파일삭제가 체크된 경우
				if(originalFilePath != null && deleteFlag != null && deleteFlag.equals("yes")) {
					
					
					//저장 폴더에서 제거함
					new File(savePath+"\\"+originalFilePath).delete();
				}

				// 첨부파일이 없었는데 새로 추가된 경우와
				// 첨부파일이 있었는데 변경된 경우 둘 다 처리
				if (originalFileName != null) {
					// 새로 업로드된 파일이 있다면
					notice.setFileName(originalFileName);

//					String renameFileName = FileNameChange.change(
//							originalFileName, savePath, "yyyyMMddHHmmss");

					
					//이전 첨부된 파일이 있었다면 저장 폴더에서 파일 삭제함
					if(originalFilePath != null) {
						new File(savePath+ "\\" + originalFilePath).delete();
					}
				} // 새로 업로드된 파일이 있다면...
		
		//3. 모델 서비스 메소드로 값 또는 객체 전달 실행하고 결과받기
		int result = new NoticeService().updateNotice(notice);
		
		System.out.println(result);
		//4. 받은 결과로 내보낼 뷰 선택 처리
		if(result > 0) {
			//수정 성공시 마이 페이지 뷰가 출력되게 한다면, myinfo 서블릿을 구동시킴
			//서블릿에서 다른 서블릿을 실행시킬 수 있음
//			response.sendRedirect("/fm/views/admin/adminprofile.jsp?adminemail=" + admin.getAdminEmail());
			response.sendRedirect("/fm/nlist");
			//수정 성공시 메인페이지가 출력되게 한다면
			//response.sendRedirect("/first/index.jsp");
		}else {			
			 view = request.getRequestDispatcher("views/common/error.jsp");
			//상대경로만 사용할 수 있음
			
			//지정한 뷰로 내보낼 정보나 객체가 있으면 request 에 기록 저장함
			//request.setAttribute(String name, Object value);
			request.setAttribute("message", notice.getAdminEmail()+ " 공지사항 수정 실패!");
			
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
