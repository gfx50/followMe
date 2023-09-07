package thread.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import thread.model.dao.ThreadDao;
import trail.model.vo.Trail;
import thread.model.vo.Thread;

public class ThreadService {
	private ThreadDao thdao = new ThreadDao();
	
	public ThreadService() {}

	public ArrayList<Trail> selectThreadList(String trailid) {
		Connection conn = getConnection();
		ArrayList<Trail> list = thdao.selectThreadList(conn, trailid);
		close(conn);
		return list;
	}


}
