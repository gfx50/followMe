package trail.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import book.model.dao.BookDao;
import trail.model.dao.TrailDao;
import trail.model.vo.Trail;

public class TrailService {
	private TrailDao tdao = new TrailDao();
	private BookDao bdao = new BookDao();
	
	public TrailService() {}

	public ArrayList<Trail> selectList(int startRow, int endRow) {
		Connection conn = getConnection();
		ArrayList<Trail> list = tdao.selectList(conn,startRow,endRow);
		close(conn);
		return list;
	}

	public ArrayList<Trail> selectCountList() {
		Connection conn = getConnection();
		ArrayList<Trail> list = tdao.selectCountList(conn);
		close(conn);
		return list;
	}

	public ArrayList<Trail> selectGoodList() {
		Connection conn = getConnection();
		ArrayList<Trail> list = tdao.selectGoodList(conn);
		close(conn);
		return list;
	}

	public ArrayList<Trail> selectReportList() {
		Connection conn = getConnection();
		ArrayList<Trail> list = tdao.selectReportList(conn);
		close(conn);
		return list;
	}

	public ArrayList<Trail> selectDateList() {
		Connection conn = getConnection();
		ArrayList<Trail> list = tdao.selectDateList(conn);
		close(conn);
		return list;
	}

	public ArrayList<Trail> selectMyList(String mid, int startRow, int endRow) {
		Connection conn = getConnection();
		ArrayList<Trail> list = tdao.selectMyList(conn, mid, startRow, endRow);
		close(conn);
		return list;
	}

public int getMyListCount(String mid) {
		Connection conn = getConnection();
		int listCount = tdao.getMyListCount(conn, mid);
		close(conn);
		return listCount;
		
	}

	public ArrayList<Trail> selectFollowerList(String mid, int startRow, int endRow) {
		Connection conn = getConnection();
		ArrayList<Trail> list = tdao.selectFollowerList(conn, mid, startRow, endRow);
		close(conn);
		return list;
	}

	public void addReadCount(String trailId) {
		Connection conn = getConnection();
		int result = tdao.addReadCount(conn, trailId);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		
	}

	public Trail selectTrail(String trailId) {
		Connection conn = getConnection();
		Trail trail = tdao.selectTrail(conn, trailId);
		close(conn);
		return trail;
	}

	public ArrayList<Trail> selectSearchBookList(String mid, int startRow, int endRow ) {
		Connection conn = getConnection();
		ArrayList<Trail> list = tdao.selectSearchBookList(conn, mid, startRow, endRow);
		close(conn);
		return list;
	}

	public ArrayList<Trail> selectThreadList(String trailId) {
		Connection conn = getConnection();
		ArrayList<Trail> list = tdao.selectThreadList(conn, trailId);
		close(conn);
		return list;
	}

	public int insertTrail(Trail trail) {
		Connection conn = getConnection();
		int result = tdao.insertTrail(conn, trail);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int updateTrail(Trail trail) {
		Connection conn = getConnection();
		int result = tdao.updateTrail(conn, trail);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int updateTrailRange(String trailId , String range) {
		Connection conn = getConnection();
		int result = tdao.updateTrailRange(conn, trailId , range);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int deleteTrail(String trailId) {
		Connection conn = getConnection();
		int result = tdao.deleteTrail(conn, trailId);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	

	public boolean isBookmarked(String trailId, String mId) {
        Connection conn = getConnection();
        boolean isBookmarked = bdao.isBookmarked(conn, trailId, mId);
        close(conn);
        return isBookmarked;
    }
	public ArrayList<Trail> getTrailPhotos(String trailId) {
		Connection conn = getConnection();
	    // TrailDAO의 selectPhotoList 메서드를 호출하여 데이터베이스에서 이미지 정보를 가져옴
	    ArrayList<Trail> photoList = tdao.selectPhotoList(conn, trailId);
	    close(conn);
	    return photoList;
	}
	public int getListCount() {
		Connection conn = getConnection();
		int listCount = tdao.getListCount(conn);
		close(conn);
		return listCount;
		
	}
	public int getFollowListCount(String mid) {
		Connection conn = getConnection();
		int listCount = tdao.getFollowListCount(conn, mid);
		close(conn);
		return listCount;
		
	}
	public int getBookListCount(String mid) {
		Connection conn = getConnection();
		int listCount = tdao.getBookListCount(conn, mid);
		close(conn);
		return listCount;
		
	}

	public int updateTrailReport(Trail trail, String trailId) {
		Connection conn = getConnection();
		int result = tdao.updateMember(conn, trail, trailId);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public ArrayList<Trail> selectMyList(int startRow, int endRow) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
}
