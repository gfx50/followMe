package thread.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import trail.model.vo.Trail;
import thread.model.vo.Thread;

public class ThreadDao {

	public ArrayList<Thread> getThreadList(Connection conn) {
		 ArrayList<Thread> threadList = new ArrayList<>();

	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        String sql = "SELECT * FROM thread"; // 실제 쿼리에 맞게 수정해야 함

	        try {
	            pstmt = conn.prepareStatement(sql);
	            rset = pstmt.executeQuery();

	            while (rset.next()) {
	                Thread thread = new Thread();
	                // 쓰레드 정보를 ResultSet에서 읽어와 thread 객체에 설정
	                thread.setTrailId(rset.getString("TRAILID"));
	                thread.setThreadId(rset.getString("THREADID"));
	                thread.setThreadDate(rset.getDate("THREADDATE"));
	                // 나머지 필드도 읽어와 설정해야 함

	                threadList.add(thread);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            close(rset);
	            close(pstmt);
	        }

	        return threadList;
	}

}
