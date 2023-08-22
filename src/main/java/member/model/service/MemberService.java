package member.model.service;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;

import static common.JDBCTemplate.*;

public class MemberService {
	private MemberDao mdao = new MemberDao();
	
	public MemberService() {}

	public Member selectSearchUserEmail(String email) {
		Connection conn = getConnection();
		Member member = mdao.selectSearchUserEmail(conn, email);
		
		close(conn);
		return member;
	}
}
