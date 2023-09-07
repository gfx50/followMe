package tag.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tag.model.service.TagService;

/**
 * Servlet implementation class CreateTagServlet
 */
@WebServlet("/createtag")
public class CreateTagServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTagServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("createTag : request arrived");
		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
		
		int inserttagresult = 0;
		
		String longtagname = request.getParameter("tagname");
		String trailid = request.getParameter("trailid");
		
		
		String[] arrTagname = longtagname.strip().split("#");
		
		System.out.println("0 번" + arrTagname[0]);
		for(int i = 1; i < arrTagname.length; i++) {
			
			System.out.println(arrTagname[i]);
		}
		
		TagService tagService = new TagService();
		
		int result = 0;
		
		for(int i = 1; i < arrTagname.length; i ++) {
			
			int selectresult = tagService.selectTag(arrTagname[i]);
			
			if(selectresult < 1) {
				String tagname = arrTagname[i];
				
				inserttagresult = tagService.insertTagId(tagname);
				
				System.out.println("insertTagId : succeed");
				tagService.insertTag(tagname, trailid);

			}
			
		}
		out.print("태그가 등록되었습니다.");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
