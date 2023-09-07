package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.Admin;


/**
 * Servlet implementation class AdminListServlet
 */
@WebServlet("/alist")
public class AdminListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자용 회원 전체 조회 처리용 컨트롤러
		
				ArrayList<Admin> list = new AdminService().selectAdminList();
				
				RequestDispatcher view = null;
				if(list.size() > 0) {
					view = request.getRequestDispatcher("views/admin/adminlist.jsp");
					request.setAttribute("list", list);
					System.out.println(list);
				}else {
					view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", "회원 전체 조회 실패!");
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
