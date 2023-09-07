package tagid.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.Paging;
import tag.model.vo.Tag;
import tagid.model.dao.TagIdDao;
import tagid.model.vo.TagId;

public class TagIdService {

	private TagIdDao tidDao = new TagIdDao();
	
	
	public TagIdService() {}


//	public int insertTagId(TagId TagId) {
//		Connection conn = getConnection();
//		int result = tidDao.insertTagId(conn, TagId);
//		if(result > 0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}		
//		close(conn);
//		return result;
//	}


	
	 public ArrayList<TagId> selectTagIdList(Paging paging) { 
		Connection conn =getConnection(); 
		ArrayList<TagId> list = tidDao.selectTagIdList(conn, paging);
		close(conn); return list; }
	 

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = tidDao.getListCount(conn);
		close(conn);
		return listCount;
	}


	public int deleteTagId(String tagidname) {
		Connection conn = getConnection();
		int result = tidDao.deleteTagId(conn, tagidname);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}		
		close(conn);
		return result;
	}


//	public void addReadCount(int TagIdNum) {
//		Connection conn = getConnection();
//		int result = tidDao.addReadCount(conn, TagIdNum);
//		if(result > 0)
//			commit(conn);
//		else
//			rollback(conn);
//		close(conn);		
//		
//	}


//	public TagId selectTagId(int TagIdNum) {
//		Connection conn = getConnection();
//		TagId TagId = tidDao.selectTagId(conn, TagIdNum);
//		close(conn);
//		return TagId;
//	}
//
//
//	public TagId updatepageTagId(int TagIdNum) {
//		Connection conn = getConnection();
//		TagId TagId = tidDao.updatepageTagId(conn, TagIdNum);
//		close(conn);
//		return TagId;
//	}


	public int updateTagId(TagId TagId) {
		Connection conn = getConnection();
		int result = tidDao.updateTagId(conn, TagId);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}


	


	
	
	
	
	
}
