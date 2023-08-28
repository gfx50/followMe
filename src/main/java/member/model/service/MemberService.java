package member.model.service;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import static common.JDBCTemplate.*;

public class MemberService {
	private MemberDao mdao = new MemberDao();
	
	public MemberService() {}

	public Member selectSearchUserEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	public Member selectLogin(String useremail, String userpwd) {
		Connection conn = getConnection();
		Member loginMember = mdao.selectLogin(conn, useremail, userpwd);
		close(conn);
		return loginMember;
	}

}
