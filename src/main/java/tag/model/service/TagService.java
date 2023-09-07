package tag.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.Paging;
import tag.model.dao.TagDao;
import tag.model.vo.Tag;

public class TagService {
	
	Tag tag = new Tag();
	private TagDao tDao = new TagDao();
	
	
	public TagService() {}

	 public ArrayList<Tag> selectTagList(Paging paging) { 
		Connection conn =getConnection(); 
		ArrayList<Tag> list = tDao.selectTagList(conn, paging);
		close(conn); return list; 
	}
	 

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = tDao.getListCount(conn);
		close(conn);
		return listCount;
	}


	public int deleteTag(String tagName) {
		Connection conn = getConnection();
		int result = tDao.deleteTag(conn, tagName);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}		
		close(conn);
		return result;
	}

	public int updateTag(Tag tag) {
		Connection conn = getConnection();
		int result = tDao.updateTag(conn, tag);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}


	public int selectTag(String tagname) {
		Connection conn =getConnection(); 
		int result = tDao.selectTag(conn, tagname);
		close(conn);
		return result; 
	}
	
	public int insertTagId(String tagname) {
		Connection conn =getConnection(); 
		int result = tDao.insertTagId(conn, tagname);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result; 
	}
	
	public int insertTag(String tagname, String trailid) {
		Connection conn =getConnection(); 
		int result = tDao.insertTag(conn, tagname, trailid);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result; 
	}
	
}
