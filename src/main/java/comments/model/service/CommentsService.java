package comments.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import comments.model.dao.CommentsDao;
import comments.model.vo.Comments;
import common.Paging;

public class CommentsService {
	private CommentsDao cdao = new CommentsDao();
	
	public CommentsService() {}

	public int insertComments(Comments comments) {
		Connection conn = getConnection();
		int result = cdao.insertComments(conn, comments);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	public ArrayList<Comments> selectCommentsReportList() {
		Connection conn = getConnection();
		ArrayList<Comments> list = cdao.selectCommentsReportList(conn);
		close(conn);
		return list;
	}

	public ArrayList<Comments> selectMyCommentsList(String getmId,Paging paging) {
		Connection conn = getConnection();
		ArrayList<Comments> list = cdao.selectMyCommentsList(conn, getmId, paging);
		close(conn);
		return list;
	}

	public int getListCount(String mId) {
		Connection conn = getConnection();
		int listCount = cdao.getListCount(conn, mId);
		close(conn);
		return listCount;
	}

	public int deleteComments(String commentsid) {
		Connection conn = getConnection();
		int result = cdao.deleteComments(conn, commentsid);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}		
		close(conn);
		return result;
	}

	public ArrayList<Comments> selectCommentsList(String trailId) {
		Connection conn = getConnection();
		ArrayList<Comments> list = cdao.selectCommentsList(conn, trailId);
		close(conn);
		return list;
	}

	public int updateCommentsReport(String commentsId) {
		Connection conn = getConnection();
		int result = cdao.updateCommentsReport(conn, commentsId);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}		
		close(conn);
		return result;
	}
	
}
