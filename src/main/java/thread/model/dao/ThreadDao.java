package thread.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import trail.model.vo.Trail;
import thread.model.vo.Thread;

public class ThreadDao {
	
	public ArrayList<Trail> selectThreadList(Connection conn, String trailId) {
		 ArrayList<Trail> list = new ArrayList<Trail>();
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        
	        //? 가 threadid 이고 상위 게시물들을 나열하는 query문임(이 게시물을 쓰레드로 사용한 원 게시물 목록)
//	        String query = "select * from trail t where t.trailid in (select h.trailid"
//	        		+ " from thread h left join trail t2 on h.trailid = t2.trailid where h.threadid = ?)";
	        
	        //?가 trailid 이고 하위 쓰레드들을 나열하는 query문임
//	        String query = "select * from trail t "
//	        		+ "where t.trailid in (select threadid from thread h left join trail t on h.trailid = t.trailid where t.trailid = ?) "
//	        		+ "order by traildate desc";
	        
	        String query = "select t.* from trail t join thread h on t.trailid = h.threadid "
	        			+ "where h.trailid = ? order by t.traildate desc";
	        
	        try {
	            pstmt = conn.prepareStatement(query);
	            pstmt.setString(1, trailId);
	            
	            rset = pstmt.executeQuery();
	            
	           
	            
	            while(rset.next()) {
	                Trail trail = new Trail();
	                
	                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
	                trail.setTrailId(rset.getString("trailid"));
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
