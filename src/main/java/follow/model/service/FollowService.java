package follow.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import follow.model.dao.FollowDao;
import member.model.vo.Member;

public class FollowService {
	private FollowDao fdao = new FollowDao();

	public ArrayList<Member> selectListFollower(String mid) {
		Connection conn = getConnection();
		ArrayList<Member> list = fdao.selectListFollower(conn, mid);
		close(conn);
		return list;
	}

	public ArrayList<Member> selectListFollowee(String mid) {
		Connection conn = getConnection();
		ArrayList<Member> list = fdao.selectListFollowee(conn, mid);
		close(conn);
		return list;
	}

	public int unFollow(String mid, String loginmid) {
		Connection conn = getConnection();
		System.out.println(mid + " , " + loginmid);
		int result = fdao.unFollow(conn, mid, loginmid);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int following(String mid, String mid2) {
		Connection conn = getConnection();
		int result = fdao.following(conn, mid, mid2);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public String selectFollowYN(String loginmid, String followmid) {
		Connection conn = getConnection();
		String followYN = fdao.selectFollowYN(conn, loginmid, followmid);
		close(conn);
		return followYN;
	}

}
