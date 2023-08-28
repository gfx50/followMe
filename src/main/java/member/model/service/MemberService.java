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

	public Member selectMember(String email) {
		Connection conn = getConnection();
		Member member = mdao.selectMember(conn, email);
		close(conn);
		return member;
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = mdao.updateMember(conn, member);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

}
