package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static common.JDBCTemplate.*;
import member.model.vo.Member;

public class MemberDao {
	public MemberDao () {}
	
	public Member selectMember(Connection conn, String userid) {
		Member member = null;

		String query = "select * from member where email = ?";

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, userid);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				member = new Member();

				// 결과매핑 : 컬럼값 꺼내서 필드에 옮기기
				member.setmId(rset.getString("mid"));
				member.setEmail(rset.getString("email"));
				member.setSocialId(rset.getString("socialid"));
				member.setNickName(rset.getString("nickname"));
				member.setProfilePic(rset.getString("profilepic"));
				member.setPwd(rset.getString("pwd"));
				member.setmName(rset.getString("mname"));
				member.setBirthDate(rset.getDate("birthdate"));
				member.setGender(rset.getString("gender"));
				member.setPhone(rset.getNString("phone"));
				member.setEntranceDate(rset.getDate("entrancedate"));
				member.setLastLoginDate(rset.getDate("lastlogindate"));
				member.setPassModifyDate(rset.getDate("passmodifydate"));
				member.setLoginLv(rset.getInt("loginlv"));
				member.setMemberMeta(rset.getString("membermeta"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}
}
