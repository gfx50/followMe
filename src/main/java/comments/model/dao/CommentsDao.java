package comments.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import comments.model.vo.Comments;
import common.Paging;

public class CommentsDao {
	public CommentsDao() {
	}

	public int insertComments(Connection conn, Comments comments) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into comments values (sys_guid() , ?, ?, ?, 5, sysdate, 'N')";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, comments.getTrailId());
			pstmt.setString(2, comments.getmId());
			pstmt.setString(3, comments.getCommentsContent());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public ArrayList<Comments> selectMyCommentsList(Connection conn, String mId, Paging paging) {
		ArrayList<Comments> list = new ArrayList<Comments>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select *  "
				+ "from (select rownum rnum,  COMMENTSID, TRAILID, MID, COMMENTSCONTENT, "
				+ "                            COMMENTSTYPE, COMMENTSTIME, COMMENTSREPORTYN "
				+ "        from (select * from comments  "
				+ "				            where mid = ? "
				+ "                            and  commentstype is not null and commentstype >= 5 "
				+ "				            order by commentstime desc, commentsid desc)) "
				+ "where rnum >= ? and rnum <= ?";
		
		try {
			pstmt = conn.prepareStatement(query);	
			pstmt.setString(1, mId);
			pstmt.setInt(2, paging.getStartRow());
			pstmt.setInt(3, paging.getEndRow());
			System.out.println("start = " + paging.getStartRow());
			System.out.println("end = " + paging.getEndRow());
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Comments comments = new Comments();
				
				comments.setCommentsId(rset.getString("COMMENTSID"));
				comments.setTrailId(rset.getString("TRAILID"));
				comments.setmId(rset.getString("MID"));
				comments.setCommentsContent(rset.getString("COMMENTSCONTENT"));
				comments.setCommentsType(rset.getInt("COMMENTSTYPE"));
				comments.setCommentsTime(rset.getDate("COMMENTSTIME"));
				comments.setCommentsReportYn(rset.getString("COMMENTSREPORTYN"));
				
			
				list.add(comments);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public ArrayList<Comments> selectCommentsReportList(Connection conn) {
		ArrayList<Comments> list = new ArrayList<Comments>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from COMMENTS where COMMENTSREPORTYN = 'Y' ";

		try {
			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Comments comments = new Comments();

				// 결과매핑 : 컬럼값 꺼내서 필드에 옮기기
				comments.setCommentsId(rset.getString("COMMENTSID"));
				comments.setTrailId(rset.getString("TRAILID"));
				comments.setmId(rset.getString("MID"));
				comments.setCommentsContent(rset.getString("COMMENTSCONTENT"));
				comments.setCommentsType(rset.getInt("COMMENTSTYPE"));
				comments.setCommentsTime(rset.getDate("COMMENTSTIME"));
				comments.setCommentsReportYn(rset.getString("COMMENTSREPORTYN"));
                

				list.add(comments);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}


	public ArrayList<Comments> selectMyList(Connection conn, String getmId, Paging paging) {
		ArrayList<Comments> list = new ArrayList<Comments>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select *  "
				+ "from (select rownum rnum,  COMMENTSID, TRAILID, MID, COMMENTSCONTENT, "
				+ "                            COMMENTSTYPE, COMMENTSTIME, COMMENTSREPORTYN "
				+ "        from (select * from comments  "
				+ "				            where mid = ? "
				+ "                            and  commentstype is not null and commentstype >= 5 "
				+ "				            order by commentstime desc, commentsid desc)) "
				+ "where rnum >= ? and rnum <= ?";
		
		try {
			pstmt = conn.prepareStatement(query);	
			pstmt.setString(1, getmId);
			pstmt.setInt(2, paging.getStartRow());
			pstmt.setInt(3, paging.getEndRow());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Comments comments = new Comments();
				
				comments.setCommentsId(rset.getString("COMMENTSID"));
				comments.setTrailId(rset.getString("TRAILID"));
				comments.setmId(rset.getString("MID"));
				comments.setCommentsContent(rset.getString("COMMENTSCONTENT"));
				comments.setCommentsType(rset.getInt("COMMENTSTYPE"));
				comments.setCommentsTime(rset.getDate("COMMENTSTIME"));
				comments.setCommentsReportYn(rset.getString("COMMENTSREPORTYN"));
				
			
				list.add(comments);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public int getListCount(Connection conn, String mId) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) count from comments where mid='" + mId +"'";
		System.out.println(mId);
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				listCount = rset.getInt(1);
				System.out.println(listCount);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}		
		
		return listCount;
	}


	public int deleteComments(Connection conn, String commentsid) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "delete from comments where COMMENTSID = ?";
		System.out.println(" COMMENTSID dao = " + commentsid);

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, commentsid);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Comments> selectCommentsList(Connection conn, String trailId) {
		ArrayList<Comments> list = new ArrayList<Comments>();
		PreparedStatement pstmt = null;

		ResultSet rset = null;
		
		String query = "select commentsid , trailid, comments.mid , commentscontent, commentstype, commentstime, commentsreportyn, nickname, profilepic from comments join member on comments.mid = member.mid where trailid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);	
			pstmt.setString(1, trailId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Comments comments = new Comments();
				
				comments.setCommentsId(rset.getString("COMMENTSID"));
				comments.setTrailId(rset.getString("TRAILID"));
				comments.setmId(rset.getString("MID"));
				comments.setCommentsContent(rset.getString("COMMENTSCONTENT"));
				comments.setCommentsType(rset.getInt("COMMENTSTYPE"));
				comments.setCommentsTime(rset.getDate("COMMENTSTIME"));
				comments.setCommentsReportYn(rset.getString("COMMENTSREPORTYN"));
				comments.setNickName(rset.getString("nickname"));
				comments.setProfilepic(rset.getString("profilepic"));
				System.out.println("CommentsDao : " + comments.getNickName());

				list.add(comments);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int updateCommentsReport(Connection conn, String commentsId) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update comments set COMMENTSREPORTYN = 'Y' where COMMENTSID = ?";
		System.out.println(" COMMENTSID dao = " + commentsId);

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, commentsId);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


}
