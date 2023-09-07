package book.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import book.model.vo.Book;
import member.model.vo.Member;
import trail.model.vo.Trail;

public class BookDao {

	public int insertBook(Connection conn, Book book, Member member, Trail trail) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into book values "
				+ "(?, ?, default, 'Y')";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getmId());
			pstmt.setString(2, trail.getTrailId());
			
			result = pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateBook(Connection conn, Book book, Member member, Trail trail) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from book where trailId = ? and mid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, trail.getTrailId());
			pstmt.setString(2, member.getmId());
			
			result = pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Book selectTrailId(Connection conn, String trailId, String mId) {
		Book book = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from book "
				+ "where mid = ? and trailid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mId);
			pstmt.setString(2, trailId);

			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				book = new Book();
				
				book.setmId(rset.getString("mid"));
				book.setTrailId(rset.getString("trailid"));
				book.setBookYN(rset.getString("bookyn"));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return book;
	}
	
	 public boolean isBookmarked(Connection conn, String trailId, String mId) {
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        boolean isBookmarked = false;

	        String query = "SELECT * FROM book WHERE mid = ? AND trailid = ?";
	        
	        try {
	            pstmt = conn.prepareStatement(query);
	            pstmt.setString(1, mId);
	            pstmt.setString(2, trailId);

	            rset = pstmt.executeQuery();
	            
	            if (rset.next()) {
	                isBookmarked = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }
	        
	        return isBookmarked;
	    }
}
