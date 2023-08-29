package trail.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import trail.model.vo.Trail;


public class TrailDao {
	public TrailDao() {}

	public ArrayList<Trail> selectList(Connection conn) {
		 ArrayList<Trail> list = new ArrayList<Trail>();
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        
	        String query = "select * from trail where rownum <= 20 order by traildate desc"; 
	        
	        try {
	            pstmt = conn.prepareStatement(query);
	            
	            rset = pstmt.executeQuery();
	            
	            while(rset.next()) {
	                Trail trail = new Trail();
	                
	                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
	                trail.setTraiIId(rset.getString("trailid"));
	                trail.setmId(rset.getString("mid"));
	                trail.setTrailDate(rset.getDate("traildate"));
	                trail.setTrailJson(rset.getString("trailjson"));
	                trail.setTrailCount(rset.getInt("trailcount"));
	                trail.setTrailGood(rset.getInt("trailgood"));
	                trail.setTrailRange(rset.getString("trailrange"));
	                trail.setThreadYn(rset.getString("threadyn"));
	                trail.setTrailReport(rset.getString("trailreport"));
	                trail.setTrailMeta(rset.getString("trailmeta"));
	                
	                list.add(trail);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }
	        
	        return list;
	    }
	public ArrayList<Trail> selectCountList(Connection conn) {
		 ArrayList<Trail> list = new ArrayList<Trail>();
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        
	        String query = "select * from trail where rownum <= 20 order by trailcount desc"; 
	        
	        try {
	            pstmt = conn.prepareStatement(query);
	            
	            rset = pstmt.executeQuery();
	            
	            while(rset.next()) {
	                Trail trail = new Trail();
	                
	                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
	                trail.setTraiIId(rset.getString("trailid"));
	                trail.setmId(rset.getString("mid"));
	                trail.setTrailDate(rset.getDate("traildate"));
	                trail.setTrailJson(rset.getString("trailjson"));
	                trail.setTrailCount(rset.getInt("trailcount"));
	                trail.setTrailGood(rset.getInt("trailgood"));
	                trail.setTrailRange(rset.getString("trailrange"));
	                trail.setThreadYn(rset.getString("threadyn"));
	                trail.setTrailReport(rset.getString("trailreport"));
	                trail.setTrailMeta(rset.getString("trailmeta"));
	                
	                list.add(trail);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }
	        
	        return list;
	    }

	private void add(Trail trail) {
		// TODO Auto-generated method stub
		
	}

	public ArrayList<Trail> selectGoodList(Connection conn) {
		ArrayList<Trail> list = new ArrayList<Trail>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = "select * from trail where rownum <= 20 order by trailgood desc"; 
        
        try {
            pstmt = conn.prepareStatement(query);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Trail trail = new Trail();
                
                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
                trail.setTraiIId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                
                list.add(trail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
    }

	public ArrayList<Trail> selectReportList(Connection conn) {
		ArrayList<Trail> list = new ArrayList<Trail>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = "select * from trail where trailreport = 'Y' and rownum <= 20"; 
        
        try {
            pstmt = conn.prepareStatement(query);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Trail trail = new Trail();
                
                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
                trail.setTraiIId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                
                list.add(trail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
	}

	public ArrayList<Trail> selectDateList(Connection conn) {
		ArrayList<Trail> list = new ArrayList<Trail>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = "select * from trail where rownum <= 20 order by traildate desc"; 
        
        try {
            pstmt = conn.prepareStatement(query);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Trail trail = new Trail();
                
                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
                trail.setTraiIId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                
                list.add(trail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
	}

	public ArrayList<Trail> selectMyList(Connection conn, String mid) {
		ArrayList<Trail> list = new ArrayList<Trail>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = "select * from trail where mid = ? order by traildate desc"; 
        System.out.println(mid);
        
        try {
            pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, mid);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Trail trail = new Trail();
                
                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
                trail.setTraiIId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                
                list.add(trail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
	}

	public ArrayList<Trail> selectFollowerList(Connection conn, String mid) {
		ArrayList<Trail> list = new ArrayList<Trail>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = "select * from trail t where exists (select 1 from follow f where f.mid = t.mid and f.mid2 = ?)"
        		+ "order by traildate desc";
        		 
        System.out.println(mid);
        
        try {
            pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, mid);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Trail trail = new Trail();
                
                
                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
                trail.setTraiIId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                
                list.add(trail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
	}

	public Trail selectTrail(Connection conn, String trailId) {
		Trail trail = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from trail "
				+ "where trailId = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, trailId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				trail = new Trail();
				
				trail.setTraiIId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return trail;

	}

	public int addReadCount(Connection conn, String trailId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update trail "
				+ "set trailcount = trailcount + 1 "
				+ "where trailId = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, trailId);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Trail> selectSearchBookList(Connection conn, String trailId) {
		ArrayList<Trail> list = new ArrayList<Trail>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = "select t.*, m.nickname, m.profilepic from trail t join book b on t.trailid = b.trailid join member m on b.mid = m.mid"
        		+ "		where m.mid = ? order by t.traildate desc";
        
        		 
        System.out.println(trailId);
        
        try {
            pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, trailId);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Trail trail = new Trail();
                
                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
                trail.setTraiIId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                
                list.add(trail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
	}


	
}
