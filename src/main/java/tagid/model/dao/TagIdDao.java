package tagid.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import common.Paging;
import tag.model.vo.Tag;
import tagid.model.vo.TagId;

public class TagIdDao {

	public TagIdDao() {
	}

//	public int insertTag(Connection conn, Tag Tag) {
//		int result = 0;
//		PreparedStatement pstmt = null;
//
//		String query = "insert into Tag values " + "(default, ?, ?, ?, ?, sysdate, 0)";
//		// 보류
//
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, Tag.getAdminEmail());
//			pstmt.setString(2, Tag.getTagTitle());
//			pstmt.setString(3, Tag.getTagContent());
//			pstmt.setString(4, Tag.getFileName());
//
//			System.out.println(Tag.getAdminEmail());
//			System.out.println(Tag.getTagTitle());
//			System.out.println(Tag.getTagContent());
//			System.out.println(Tag.getFileName());
//
//			result = pstmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//
//		return result;
//	}

	
	  public ArrayList<TagId> selectTagIdList(Connection conn, Paging paging) {
	  
	  ArrayList<TagId> list = new ArrayList<TagId>(); PreparedStatement pstmt =
	  null; ResultSet rset = null;
	  
	  String query = "select *  "
	  		+ "	  from (select rownum rnum, TAGNAME, TAGDATE, TAGMETA "
	  		+ "	   from (select * from tagid   "
	  		+ "	  ))   where rnum between ? and ?";
	  
	  try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, paging.getStartRow());
			pstmt.setInt(2, paging.getEndRow());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				TagId tagid = new TagId();
				tagid.setTagName(rset.getString("TAGNAME"));
				tagid.setDate(rset.getDate("TAGDATE"));
				tagid.setTagMeta(rset.getString("TAGMETA"));
				
				
				
				list.add(tagid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	 

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from TagId";

		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public int deleteTagId(Connection conn, String tagidname) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "delete from TagId where tagname = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tagidname);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

//	public int addReadCount(Connection conn, int TagNum) {
//		int result = 0;
//		PreparedStatement pstmt = null;
//		
//		String query = "update Tag "
//				+ "set Tagcount = Tagcount + 1 "
//				+ "where Tagid = ?";
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, TagNum);
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return result;
//	}

//	public Tag selectTag(Connection conn, int TagNum) {
//		Tag Tag = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String query = "select * from Tag "
//				+ "where Tagid = ?";
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, TagNum);
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				Tag = new Tag();
//				
//				Tag.setTagId(rset.getString("TagId"));
//				Tag.setAdminEmail(rset.getString("adminEmail"));
//				Tag.setTagTitle(rset.getString("TagTitle"));
//				Tag.setTagContent(rset.getString("TagContent"));
//				Tag.setFileName(rset.getString("fileName"));
//				Tag.setTagDate(rset.getDate("TagDate"));
//				Tag.setTagCount(rset.getString("TagCount"));
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return Tag;
//	}

//	public Tag updatepageTag(Connection conn, int TagNum) {
//		Tag Tag = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String query = "select * from Tag "
//				+ "where Tagid = ?";
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, TagNum);
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				Tag = new Tag();
//				
//				Tag.setTagId(rset.getString("TagId"));
//				Tag.setAdminEmail(rset.getString("adminEmail"));
//				Tag.setTagTitle(rset.getString("TagTitle"));
//				Tag.setTagContent(rset.getString("TagContent"));
//				Tag.setFileName(rset.getString("fileName"));
//				Tag.setTagDate(rset.getDate("TagDate"));
//				Tag.setTagCount(rset.getString("TagCount"));
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return Tag;
//	}

	public int updateTagId(Connection conn, TagId tagid) {
	    int result = 0;
	    PreparedStatement pstmt = null;

	    String query = "update Tag set TAGNAME = ?";

	    try {
	        pstmt = conn.prepareStatement(query);

	        pstmt.setString(1, tagid.getTagName());
	       
	        
//	        // java.util.Date 객체를 java.sql.Date로 변환
//	        java.util.Date utilDate = Tag.getTagDate();
//	        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//	        pstmt.setDate(4, sqlDate);
	        
//	        pstmt.setString(4, Tag.getTagId());

	        result = pstmt.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);
	    }

	    return result;
	}
}