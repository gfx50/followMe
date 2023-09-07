package admin.model.service;


import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminDao;
import admin.model.vo.Admin;
import member.model.vo.Member;

public class AdminService {
	private AdminDao aDao = new AdminDao();
	
	public AdminService(){}

	public Admin adminLogin(String adminEmail, String adminPwd) {
		Connection conn = getConnection();
		Admin loginAdmin = aDao.adminLogin(conn, adminEmail, adminPwd);
		close(conn);
		return loginAdmin;
	}

	public int registAdmin(Admin Admin) {
		Connection conn = getConnection();
		int result = aDao.registAdmin(conn, Admin);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int updateAdmin(Admin admin) {
		Connection conn = getConnection();
		int result = aDao.updateAdmin(conn, admin);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int removeAdmin(String adminEmail) {
		Connection conn = getConnection();
		int result = aDao.removeAdmin(conn, adminEmail);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public ArrayList<Admin> selectAdminList() {
		Connection conn = getConnection();
		ArrayList<Admin> list = aDao.selectAdminList(conn);
		close(conn);
		return list;
	}

	public Admin selectAdmin(String adminEmail) {
		Connection conn = getConnection();
		Admin admin = aDao.selectAdmin(conn, adminEmail);
		close(conn);
		return admin;
	}

	





	
	
	
	
	
}
