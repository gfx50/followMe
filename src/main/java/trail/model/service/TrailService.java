package trail.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import trail.model.dao.TrailDao;
import trail.model.vo.Trail;

public class TrailService {
	private TrailDao tdao = new TrailDao();
	
	public TrailService() {}

	public ArrayList<Trail> selectList() {
		Connection conn = getConnection();
		ArrayList<Trail> list = tdao.selectList(conn);
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

	public ArrayList<Trail> selectMyList(String mid) {
		Connection conn = getConnection();
		ArrayList<Trail> list = tdao.selectMyList(conn, mid);
		close(conn);
		return list;
	}


	
	
	
}
