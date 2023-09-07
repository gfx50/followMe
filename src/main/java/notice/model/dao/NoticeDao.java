package notice.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import common.Paging;
import notice.model.vo.Notice;

public class NoticeDao {

	public NoticeDao() {
	}

	public int insertNotice(Connection conn, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into notice values " + "(default, ?, ?, ?, ?, sysdate, 0)";
		// 보류

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, notice.getAdminEmail());
			pstmt.setString(2, notice.getNoticeTitle());
			pstmt.setString(3, notice.getNoticeContent());
			pstmt.setString(4, notice.getFileName());

			System.out.println(notice.getAdminEmail());
			System.out.println(notice.getNoticeTitle());
			System.out.println(notice.getNoticeContent());
			System.out.println(notice.getFileName());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	
	  public ArrayList<Notice> selectList(Connection conn, Paging paging) {
	  
	  ArrayList<Notice> list = new ArrayList<Notice>(); PreparedStatement pstmt =
	  null; ResultSet rset = null;
	  
	  String query = "select * " +
	  "from (select rownum rnum, noticeid, noticetitle, " +
	 "ADMINEMAIL, noticecontent, filename, noticedate, "
	  + "noticecount" +
	  " from (select * from notice " +
	  "order by noticedate desc, noticeid desc)" +
	  ") " + "where rnum between ? and ?";
	  
	  try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, paging.getStartRow());
			pstmt.setInt(2, paging.getEndRow());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice notice = new Notice();
				
				notice.setNoticeId(rset.getString("noticeId"));
				notice.setAdminEmail(rset.getString("adminEmail"));
				notice.setNoticeTitle(rset.getString("noticeTitle"));
				notice.setNoticeContent(rset.getString("noticeContent"));
				notice.setFileName(rset.getString("fileName"));
				notice.setNoticeDate(rset.getDate("noticeDate"));
				notice.setNoticeCount(rset.getString("noticeCount"));
				
				
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	 

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from notice";

		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public int deleteNotice(Connection conn, int noticeId) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "delete from notice where noticeId = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeId);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	public int addReadCount(Connection conn, int noticeNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update notice "
				+ "set noticecount = noticecount + 1 "
				+ "where noticeid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNum);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Notice selectNotice(Connection conn, int noticeNum) {
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice "
				+ "where noticeid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				notice = new Notice();
				
				notice.setNoticeId(rset.getString("noticeId"));
				notice.setAdminEmail(rset.getString("adminEmail"));
				notice.setNoticeTitle(rset.getString("noticeTitle"));
				notice.setNoticeContent(rset.getString("noticeContent"));
				notice.setFileName(rset.getString("fileName"));
				notice.setNoticeDate(rset.getDate("noticeDate"));
				notice.setNoticeCount(rset.getString("noticeCount"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return notice;
	}

	public Notice updatepageNotice(Connection conn, int noticeNum) {
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice "
				+ "where noticeid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				notice = new Notice();
				
				notice.setNoticeId(rset.getString("noticeId"));
				notice.setAdminEmail(rset.getString("adminEmail"));
				notice.setNoticeTitle(rset.getString("noticeTitle"));
				notice.setNoticeContent(rset.getString("noticeContent"));
				notice.setFileName(rset.getString("fileName"));
				notice.setNoticeDate(rset.getDate("noticeDate"));
				notice.setNoticeCount(rset.getString("noticeCount"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return notice;
	}

	public int updateNotice(Connection conn, Notice notice) {
	    int result = 0;
	    PreparedStatement pstmt = null;

	    String query = "update notice set noticetitle = ?, noticecontent = ?, FILENAME = ?  where noticeid = ?";

	    try {
	        pstmt = conn.prepareStatement(query);

	        pstmt.setString(1, notice.getNoticeTitle());
	        pstmt.setString(2, notice.getNoticeContent());
	        pstmt.setString(3, notice.getFileName());
	        
//	        // java.util.Date 객체를 java.sql.Date로 변환
//	        java.util.Date utilDate = notice.getNoticeDate();
//	        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//	        pstmt.setDate(4, sqlDate);
	        
	        pstmt.setString(4, notice.getNoticeId());

	        result = pstmt.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);
	    }

	    return result;
	}
}