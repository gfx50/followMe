package good.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import book.model.vo.Book;
import good.model.vo.Good;
import member.model.vo.Member;
import trail.model.vo.Trail;

public class GoodDao {

	public int insertGood(Connection conn, Good good, Member member, Trail trail) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into good values "
				+ "(?, ?, 'Y')";
		
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

	public int updateGood(Connection conn, Good good, Member member, Trail trail) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from good where trailId = ? and mid = ?";
		
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

	public Good selectTrailId(Connection conn, String trailId, String mId) {
		Good good = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from good "
				+ "where mid = ? and trailid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mId);
			pstmt.setString(2, trailId);

			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				good = new Good();
				
				good.setmId(rset.getString("mid"));
				good.setTrailId(rset.getString("trailid"));
				good.setLikeYn(rset.getString("likeyn"));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return good;
	}
	
	 public boolean isLiked(Connection conn, String trailId, String mId) {
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        boolean isLiked = false;

	        String query = "SELECT * FROM good WHERE mid = ? AND trailid = ?";
	        
	        try {
	            pstmt = conn.prepareStatement(query);
	            pstmt.setString(1, mId);
	            pstmt.setString(2, trailId);

	            rset = pstmt.executeQuery();
	            
	            if (rset.next()) {
	            	isLiked = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }
	        
	        return isLiked;
	    }

	 public int countGood(Connection conn, String trailId) {
		    int count = 0;
		    PreparedStatement pstmt = null;
		    ResultSet rset = null;

		    String query = "SELECT COUNT(*) FROM good WHERE trailid = ?";

		    try {
		        pstmt = conn.prepareStatement(query);
		        pstmt.setString(1, trailId);

		        rset = pstmt.executeQuery();

		        if (rset.next()) {
		            count = rset.getInt(1); // Get the count from the first column
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        close(rset);
		        close(pstmt);
		    }

		    return count;
		}

}
