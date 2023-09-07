package search.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import follow.model.vo.Follow;
import search.model.dao.SearchDao;
import tag.model.vo.Tag;
import trail.model.vo.Trail;

public class SearchService {
	private SearchDao sdao = new SearchDao();


	public ArrayList<Trail> selectWeeklyBestReadCount() {
		Connection conn = getConnection();
		ArrayList<Trail> list = sdao.selectWeeklyBestReadCount(conn);
		close(conn);
		return list;
	
	}

	public ArrayList<Trail> selectWeeklyBestTrail() {
		Connection conn = getConnection();
		ArrayList<Trail> list = sdao.selectWeeklyBestTrail(conn);
		close(conn);
		return list;
	}

	public ArrayList<Follow> selectFolloweeRank() {
		Connection conn = getConnection();
		ArrayList<Follow> list = sdao.selectFolloweeRank(conn);
		close(conn);
		return list;
	}

	public ArrayList<Trail> searchByTag(String keyword) {
		Connection conn = getConnection();
		ArrayList<Trail> list = sdao.searchByTag(conn, keyword);
		close(conn);
		return list;
	}

	public ArrayList<Tag> selectWeeklyBestTag() {
		Connection conn = getConnection();
		ArrayList<Tag> list = sdao.selectWeeklyBestTag(conn);
		close(conn);
		return list;
	}

	public ArrayList<Trail> selectWeeklyBestTagMainView(String tagName, int StartRow, int EndRow) {
		Connection conn = getConnection();
		ArrayList<Trail> list = sdao.selectWeeklyBestTagMainView(conn, tagName,StartRow, EndRow);
		close(conn);
		return list;
	}

	public ArrayList<Trail> selectFolloweeRankMainView(String nickName, int StartRow, int EndRow) {
		Connection conn = getConnection();
		ArrayList<Trail> list = sdao.selectFolloweeRankMainView(conn, nickName, StartRow, EndRow);
		close(conn);
		return list;
	}

	public ArrayList<Trail> selectTodayTopTrail(int StartRow, int EndRow){
		Connection conn = getConnection();
		ArrayList<Trail> list = sdao.selectTodayTopTrail(conn, StartRow, EndRow );
		close(conn);
		return list;
	}

	public ArrayList<Trail> searchByNickName(String keyword) {
		Connection conn = getConnection();
		ArrayList<Trail> list = sdao.searchByNickName(conn, keyword);
		close(conn);
		return list;
	}

	public ArrayList<Trail> selectBestOneTag() {
		Connection conn = getConnection();
		ArrayList<Trail> list = sdao.selectBestOneTag(conn);
		close(conn);
		return list;
	}

	public int oneTagSelectListCount() {
		Connection conn = getConnection();
		int listCount = sdao.oneTagSelectListCount(conn);
		close(conn);
		return listCount;
	}

	public int selectMaxCount() {
		Connection conn = getConnection();
		int listCount = sdao.selectMaxCount(conn);
		close(conn);
		return listCount;
	}

	public int selectMaxViewsCount() {
		Connection conn = getConnection();
		int listCount = sdao.selectMaxViewsCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Trail> selectWeeklyBestReadCountViewsMax(int startRow, int endRow) {
		Connection conn = getConnection();
		ArrayList<Trail> list = sdao.selectWeeklyBestReadCountViewsMax(conn, startRow, endRow);
		close(conn);
		return list;
	}

	public int selectMaxViewsGoodCount() {
		Connection conn = getConnection();
		int listCount = sdao.selectMaxViewsGoodCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Trail> selectWeeklyBestGoodViews(int startRow, int endRow) {
		Connection conn = getConnection();
		ArrayList<Trail> list = sdao.selectWeeklyBestGoodViews(conn, startRow, endRow);
		close(conn);
		return list;
	}

	public ArrayList<Trail> selectWeeklyBestOneTagViews(int startRow, int endRow) {
		Connection conn = getConnection();
		ArrayList<Trail> list = sdao.selectWeeklyBestOneTagViews(conn, startRow, endRow);
		close(conn);
		return list;
	}

	public int selectUserRankingViewsCount(String nickName) {
		Connection conn = getConnection();
		int listCount = sdao.selectUserRankingViewsCount(conn, nickName);
		close(conn);
		return listCount;
	}

	public int selectTagViewsCount(String tagName) {
		Connection conn = getConnection();
		int listCount = sdao.selectTagViewsCount(conn, tagName);
		close(conn);
		return listCount;
	}

	

}
