package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDao;
import member.model.vo.Member;

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

	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = mdao.insertMember(conn, member);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public Member selectEmail(String mid) {
		Connection conn = getConnection();
		Member member = mdao.selectEmail(conn, mid);
		close(conn);
		return member;
	}

	public int selectCheckm(Member member) {
		Connection conn = getConnection();
		int checkm = mdao.selectCheckm(conn, member);
		if(checkm > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return checkm;
	}
	
	public int deleteMember(Member member) {
		Connection conn = getConnection();
		int result = mdao.deleteMember(conn, member);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int selectCheckemail(String email) {
		Connection conn = getConnection();
		int idCount = mdao.selectCheckemail(conn, email);
		close(conn);
		return idCount;
	}

	public ArrayList<Member> selectAdminMemberList() {
		Connection conn = getConnection();
		ArrayList<Member> list = mdao.selectAdminMemberList(conn);
		close(conn);
		return list;
	}

	public Member selectFollowMember(String mid) {
		Connection conn = getConnection();
		Member member = mdao.selectFollowMember(conn, mid);
		close(conn);
		return member;
	}
	
	public Member snsLogin(String nemail) {
		Connection conn = getConnection();
		Member member = mdao.snsLogin(conn, nemail);
		close(conn);
		return member;
	}

	public int updateLv(Member member) {
		Connection conn = getConnection();
		int result = mdao.updateLv(conn, member);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

}
