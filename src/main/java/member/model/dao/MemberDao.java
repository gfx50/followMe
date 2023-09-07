package member.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import member.model.vo.Member;

public class MemberDao {
	public MemberDao () {}
	
	public Member selectMember(Connection conn, String email) {
		Member member = null;

		String query = "select * from member where email = ?";

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, email);

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

	public Member selectLogin(Connection conn, String useremail, String userpwd) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println("memberDao : " + useremail + ", " + userpwd);
		String query = "select * from member where EMAIL = ? and PWD = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, useremail);
			pstmt.setString(2, userpwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				
				member.setmId(rset.getString("mid"));
				member.setEmail(useremail);
				member.setSocialId(rset.getString("socialid"));
				member.setNickName(rset.getString("nickname"));
				member.setProfilePic(rset.getString("profilepic"));
				member.setPwd(userpwd);
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

	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update member set email = ?, pwd = ?, nickname = ?,  mname = ?, phone = ?"
				+ " , profilepic = ? where mid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);			
			
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getNickName());
			pstmt.setString(4, member.getmName());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getProfilePic());
			pstmt.setString(7, member.getmId());
			
			result = pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectCheckm(Connection conn, Member member) {
	    int count = 0; 
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;

	    String query = "select * from member "
	                 + "where email = ? AND pwd = ?";

	    try {
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, member.getEmail());
	        pstmt.setString(2, member.getPwd());

	        rset = pstmt.executeQuery();
	        
	        if (rset != null && rset.next()) {
	            count = 1;
	            System.out.println("count : " + count);
	        }
	        System.out.println("count2 : " + count );
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }

	    return count;
	}

	public int insertMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into member values "
				+ "(default, ?, ?, ?, ?, ?, ?, sysdate , ?, ?, sysdate, sysdate, sysdate, default, default)";		
		try {
			pstmt = conn.prepareStatement(query);
			
			
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getSocialId());
			pstmt.setString(3, member.getNickName());
			pstmt.setString(4, member.getProfilePic());
			pstmt.setString(5, member.getPwd());
			pstmt.setString(6, member.getmName());
			pstmt.setString(7, member.getGender());
			pstmt.setString(8, member.getPhone());
			
			result = pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member selectEmail(Connection conn, String mid) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where mid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, mid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				
				member.setEmail(rset.getString("email"));
				System.out.println(rset.getString("email"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

	public int deleteMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update member set LOGINLV = -1 where email = ? AND pwd = ? ";
		
		try {
			pstmt = conn.prepareStatement(query);			
			
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPwd());
			
			result = pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectCheckemail(Connection conn, String email) {
		int idCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(email) from member "
				+ "where email = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				idCount = rset.getInt(1); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return idCount;

	}

	public ArrayList<Member> selectAdminMemberList(Connection conn) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 관리자를 제외한 일반회원만 전체 조회
		String query = "select * from MEMBER";

		try {
			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Member member = new Member();

				// 결과매핑 : 컬럼값 꺼내서 필드에 옮기기
				member.setmId(rset.getString("MID"));
				member.setEmail(rset.getString("EMAIL"));
				member.setSocialId(rset.getString("SOCIALID")); 
				member.setNickName(rset.getString("NICKNAME")); 
				member.setProfilePic(rset.getString("PROFILEPIC")); 
				member.setPwd(rset.getString("PWD")); 
				member.setmName(rset.getString("MNAME")); 
				member.setBirthDate(rset.getDate("BIRTHDATE")); 
				member.setGender(rset.getString("GENDER")); 
				member.setPhone(rset.getString("PHONE")); 
				member.setEntranceDate(rset.getDate("ENTRANCEDATE")); 
				member.setLastLoginDate(rset.getDate("LASTLOGINDATE")); 
				member.setPassModifyDate(rset.getDate("PASSMODIFYDATE")); 
				member.setLoginLv(rset.getInt("LOGINLV"));
				member.setMemberMeta(rset.getString("MEMBERMETA")); 

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

	public Member selectFollowMember(Connection conn, String mid) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where mid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, mid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				
				member.setmId(rset.getString("MID"));
				member.setEmail(rset.getString("EMAIL"));
				member.setSocialId(rset.getString("SOCIALID")); 
				member.setNickName(rset.getString("NICKNAME")); 
				member.setProfilePic(rset.getString("PROFILEPIC")); 
				member.setPwd(rset.getString("PWD")); 
				member.setmName(rset.getString("MNAME")); 
				member.setBirthDate(rset.getDate("BIRTHDATE")); 
				member.setGender(rset.getString("GENDER")); 
				member.setPhone(rset.getString("PHONE")); 
				member.setEntranceDate(rset.getDate("ENTRANCEDATE")); 
				member.setLastLoginDate(rset.getDate("LASTLOGINDATE")); 
				member.setPassModifyDate(rset.getDate("PASSMODIFYDATE")); 
				member.setLoginLv(rset.getInt("LOGINLV"));
				member.setMemberMeta(rset.getString("MEMBERMETA")); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

	public int updateLv(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update member set  LOGINLV = ? where EMAIL = ?";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, member.getLoginLv());
			pstmt.setString(2, member.getEmail());
			
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Member snsLogin(Connection conn, String nemail) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where email = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, nemail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				
				member.setmId(rset.getString("MID"));
				member.setEmail(rset.getString("EMAIL"));
				member.setSocialId(rset.getString("SOCIALID")); 
				member.setNickName(rset.getString("NICKNAME")); 
				member.setProfilePic(rset.getString("PROFILEPIC")); 
				member.setPwd(rset.getString("PWD")); 
				member.setmName(rset.getString("MNAME")); 
				member.setBirthDate(rset.getDate("BIRTHDATE")); 
				member.setGender(rset.getString("GENDER")); 
				member.setPhone(rset.getString("PHONE")); 
				member.setEntranceDate(rset.getDate("ENTRANCEDATE")); 
				member.setLastLoginDate(rset.getDate("LASTLOGINDATE")); 
				member.setPassModifyDate(rset.getDate("PASSMODIFYDATE")); 
				member.setLoginLv(rset.getInt("LOGINLV"));
				member.setMemberMeta(rset.getString("MEMBERMETA")); 
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
