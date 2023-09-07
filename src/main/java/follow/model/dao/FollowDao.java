package follow.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import member.model.vo.Member;
import message.model.vo.Message;

public class FollowDao {

	public ArrayList<Member> selectListFollower(Connection conn, String mid) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT M.*,F.followtime "
				+ "FROM FOLLOW F "
				+ "LEfT JOIN MEMBER M ON F.MID2 = M.MID "
				+ "WHERE F.MID = ? AND F.FOLLOWYN = 'Y'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				
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
				String fullDateTime = rset.getString("followtime");
				String datePart = fullDateTime.substring(0, 10);
				member.setFollowtime(datePart);
				
				list.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Member> selectListFollowee(Connection conn, String mid) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT M.*,F.followtime "
				+ "FROM FOLLOW F "
				+ "LEfT JOIN MEMBER M ON F.MID = M.MID "
				+ "WHERE F.MID2 = ? AND F.FOLLOWYN = 'Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				
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
				String fullDateTime = rset.getString("followtime");
				String datePart = fullDateTime.substring(0, 10);
				member.setFollowtime(datePart);				
				list.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int unFollow(Connection conn, String mid, String loginmid) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		System.out.println("test2");
		
		String query = "update follow "
				+ "set followyn = 'N' "
				+ "where mid = ? and mid2 = ?";
		
		System.out.println("쿼리: " + query);
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, loginmid);
			pstmt.setString(2, mid);
			
			System.out.println("test3");
			
			result = pstmt.executeUpdate();
			
			System.out.println("test4");
			System.out.println("result: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("test5");
		return result;
	}

	public int following(Connection conn, String mid, String mid2) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into follow values "
				+ "(?, ?, 'Y', sysdate)";		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, mid2);
			pstmt.setString(2, mid);
			
			result = pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String selectFollowYN(Connection conn, String loginmid, String followmid) {
		String followyn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT followyn from follow where mid = ? and mid2 = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginmid);
			pstmt.setString(2, followmid);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
	            followyn = rset.getString("followyn");
	        } else {
	            followyn = "N";
	        }

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return followyn;
	}

}
