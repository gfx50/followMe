package notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.Paging;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {

	private NoticeDao nDao = new NoticeDao();
	
	
	public NoticeService() {}


	public int insertNotice(Notice notice) {
		Connection conn = getConnection();
		int result = nDao.insertNotice(conn, notice);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}		
		close(conn);
		return result;
	}


	
	 public ArrayList<Notice> selectNoticeList(Paging paging) { 
	Connection conn = getConnection(); 
	ArrayList<Notice> list = nDao.selectList(conn, paging);
	  close(conn); return list;
	  
	 }
	 

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = nDao.getListCount(conn);
		close(conn);
		return listCount;
	}


	public int deleteNotice(int noticeId) {
		Connection conn = getConnection();
		int result = nDao.deleteNotice(conn, noticeId);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}		
		close(conn);
		return result;
	}


	public void addReadCount(int noticeNum) {
		Connection conn = getConnection();
		int result = nDao.addReadCount(conn, noticeNum);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);		
		
	}


	public Notice selectNotice(int noticeNum) {
		Connection conn = getConnection();
		Notice notice = nDao.selectNotice(conn, noticeNum);
		close(conn);
		return notice;
	}


	public Notice updatepageNotice(int noticeNum) {
		Connection conn = getConnection();
		Notice notice = nDao.updatepageNotice(conn, noticeNum);
		close(conn);
		return notice;
	}


	public int updateNotice(Notice notice) {
		Connection conn = getConnection();
		int result = nDao.updateNotice(conn, notice);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	
	
	
}
