package admin.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import admin.model.vo.Admin;
import member.model.vo.Member;


public class AdminDao {

	public AdminDao() {
	}

	public Admin adminLogin(Connection conn, String AdminEmail, String AdminPwd) {
		Admin Admin = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from Admin where AdminEMAIL = ? and AdminPWD = ?";
		System.out.println(AdminEmail + " , " + AdminPwd);
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, AdminEmail);
			pstmt.setString(2, AdminPwd);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				Admin = new Admin();

				Admin.setAdminEmail(rset.getString("AdminEMAIL"));
				Admin.setAdminPwd(rset.getString("AdminPWD"));
				Admin.setAdminLv(rset.getInt("ADMINLV"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return Admin;
	}

	public int registAdmin(Connection conn, Admin admin) {
		int result = 0;
		PreparedStatement pstmt = null;
		System.out.println("admin :" + admin);
		String query = "insert into admin values " + "(?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, admin.getAdminEmail());
			pstmt.setString(2, admin.getAdminPwd());
			pstmt.setInt(3, admin.getAdminLv());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateAdmin(Connection conn, Admin admin) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update admin set  adminpwd = ?, adminlv = ?  where adminemail = ?";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, admin.getAdminPwd());
			pstmt.setInt(2, admin.getAdminLv());
			pstmt.setString(3, admin.getAdminEmail());
			System.out.println("adminDao : " + admin);
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int removeAdmin(Connection conn, String adminEmail) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "delete from admin where adminemail= ? ";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, adminEmail);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Admin> selectAdminList(Connection conn) {
		ArrayList<Admin> list = new ArrayList<Admin>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 관리자를 제외한 일반회원만 전체 조회
		String query = "select * from ADMIN";

		try {
			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Admin admin = new Admin();

				// 결과매핑 : 컬럼값 꺼내서 필드에 옮기기
				admin.setAdminEmail(rset.getString("ADMINEMAIL"));
				admin.setAdminPwd(rset.getString("ADMINPWD"));
				admin.setAdminLv(rset.getInt("ADMINLV"));

				list.add(admin);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public Admin selectAdmin(Connection conn, String adminEmail) {
		Admin admin = null;

		String query = "select * from admin where adminemail = ?";

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, adminEmail);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				admin = new Admin();

				// 결과매핑 : 컬럼값 꺼내서 필드에 옮기기
				admin.setAdminEmail(rset.getString("adminEmail"));
				admin.setAdminPwd(rset.getString("adminpwd"));
				admin.setAdminLv(rset.getInt("adminlv"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return admin;
	}


}