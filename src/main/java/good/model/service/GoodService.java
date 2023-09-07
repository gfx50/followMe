package good.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import good.model.dao.GoodDao;
import good.model.vo.Good;
import member.model.vo.Member;
import trail.model.vo.Trail;

public class GoodService {
	private GoodDao gdao = new GoodDao();

	public int insertGood(Good good, Member member, Trail trail) {
		Connection conn = getConnection();
		int result = gdao.insertGood(conn, good, member, trail);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	
	}

	public int updateGood(Good good, Member member, Trail trail) {
		Connection conn = getConnection();
		int result = gdao.updateGood(conn, good, member, trail);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public Good selectTrailId(String trailId, String mId) {
		Connection conn = getConnection();
		Good good = gdao.selectTrailId(conn, trailId, mId);
		close(conn);
		return good;
	}
	public int countGood(String trailId) {
	    Connection conn = null;
	    int count = 0;

	    try {
	        conn = getConnection();
	        count = gdao.countGood(conn, trailId);
	    } finally {
	        close(conn);
	    }

	    return count;
	}
}
