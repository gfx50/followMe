package search.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import follow.model.vo.Follow;
import tag.model.vo.Tag;
import trail.model.vo.Trail;
public class SearchDao {

	public ArrayList<Trail> selectWeeklyBestReadCount(Connection conn) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select nickName, trailid, mid, traildate, trailjson, trailcount, trailgood, "
				+ "		trailrange, threadyn, trailreport, trailmeta  "
				+ "				from(SELECT *  "
				+ "				        FROM trail  "
				+ "                        JOIN MEMBER USING(MID) "
				+ "				        WHERE traildate >= SYSDATE - 1 and traildate <= sysdate +5  "
				+ "				                and trailrange in('A', 'F')  "
				+ "				        ORDER BY trailcount DESC  "
				+ "				       )  "
				+ "                 where rownum <= 20";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Trail trail = new Trail();
				trail.setTrailId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                trail.setSelectNickName(rset.getString("nickname"));
                list.add(trail);
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Trail> selectWeeklyBestTrail(Connection conn) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select nickname, trailid, mid, traildate, trailjson, trailcount, "
				+ "trailgood, trailrange, threadyn, trailreport, trailmeta "
				+ "   from (select * "
				+ "        from trail "
				+ "        join member using(mid) "
				+ "        where  trailrange in('A', 'F') and  traildate >= SYSDATE - 1 and traildate <= sysdate +5 "
				+ "        order by trailgood desc)";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Trail trail = new Trail();
				
			
				trail.setTrailId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                trail.setSelectNickName(rset.getString("nickname"));
                list.add(trail);
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Follow> selectFolloweeRank(Connection conn) {
		ArrayList<Follow> list = new ArrayList<Follow>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "SELECT ROWNUM rnum, mid2, nickname, follow "
				+ "FROM ( "
				+ "    SELECT f.mid2, COUNT(f.mid) follow "
				+ "    FROM follow f "
				+ "    WHERE f.followyn = 'Y' "
				+ "    GROUP BY f.mid2 "
				+ "    ORDER BY follow DESC "
				+ ") innerSubQuery "
				+ "JOIN member m ON innerSubQuery.mid2 = m.mid "
				+ "WHERE ROWNUM <= 10 "
				+ "ORDER BY follow DESC";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Follow foll = new Follow();
				
				foll.setFollowRank(rset.getInt("rnum"));
				foll.setmID(rset.getString("mid2"));
				foll.setSelectNickName(rset.getString("nickname"));
				foll.setFollowTotal(rset.getInt("follow"));
				
				list.add(foll);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

	public ArrayList<Trail> searchByTag(Connection conn, String keyword) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = " select  trailid, mid, traildate, trailjson, trailcount, trailgood,  "
				+ "             trailrange, threadyn, trailreport, trailmeta, tagname "
				+ "                                   from (select *  "
				+ "                                    from  trail "
				+ "                                    join tag using(trailid)  "
				+ "                                    where  trailrange in('A', 'F') and tagname like ? "
				+ "                                    order by traildate desc)";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "%" + keyword + "%");  

			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Trail trail = new Trail();
				trail.setTrailId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                
                list.add(trail);
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Tag> selectWeeklyBestTag(Connection conn) {
		ArrayList<Tag> list = new ArrayList<Tag>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select runm, tagname "
				+ "       from (select rownum runm,  tagname "
				+ "        from(select tagname, count(trailid) tagcount "
				+ "            from tag "
				+ "            join tagid using(tagname) "
				+ "            where tagdate  >= SYSDATE - 100 AND tagdate <= SYSDATE + 5  "
				+ "            group by tagname "
				+ "            order by tagcount desc) "
				+ "         ) "
				+ "     where runm <= 10";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Tag ta = new Tag();
				
				ta.setTagno(rset.getInt("runm"));
				ta.setTagName(rset.getString("tagname"));
				
				list.add(ta);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

	public ArrayList<Trail> selectWeeklyBestTagMainView(Connection conn, String tagName, int startRow, int endRow) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select trailid, mid, traildate, trailjson, trailcount,  "
				+ "                          trailgood, trailrange, threadyn, trailreport, trailmeta, tagname  "
				+ "       from (select rownum rnum, trailid, mid, traildate, trailjson, trailcount,  "
				+ "                          trailgood, trailrange, threadyn, trailreport, trailmeta, tagname "
				+ "                         from (select *  "
				+ "                               from trail  "
				+ "                              join tag using(trailid)  "
				+ "                               where  trailrange in('A')    "
				+ "                               and tagname like ? "
				+ "                               order by traildate desc)) "
				+ "         where rnum >= ?  and rnum <= ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "%" + tagName + "%");  
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Trail trail = new Trail();
				trail.setTrailId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                trail.setTagName(rset.getString("tagname"));
                list.add(trail);
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Trail> selectFolloweeRankMainView(Connection conn, String nickName, int startRow, int endRow) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select  trailid, mid, traildate, trailjson, trailcount,   "
				+ "				trailgood, trailrange, threadyn, trailreport, trailmeta, nickname                "
				+ "       from (select rownum rnum, trailid, mid, traildate, trailjson, trailcount,   "
				+ "				trailgood, trailrange, threadyn, trailreport, trailmeta, nickname  "
				+ "				from(select *  "
				+ "				    from trail  "
				+ "				    join member using(mid)  "
				+ "				    where  trailrange in('A')    "
				+ "				           and nickname like  ? "
				+ "				           order by traildate desc)) "
				+ "          where rnum >= ?  and rnum <= ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "%" + nickName + "%");  
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Trail trail = new Trail();
				trail.setTrailId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                trail.setSelectNickName(rset.getString("nickname"));
                list.add(trail);
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Trail> selectTodayTopTrail(Connection conn, int startRow, int endRow) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = " select trailid, mid, traildate, trailjson, trailcount,    "
				+ "				      trailgood, trailrange, threadyn, trailreport, trailmeta "
				+ "    from(select rownum rnum, trailid, mid, traildate, trailjson, trailcount,   "
				+ "				      trailgood, trailrange, threadyn, trailreport, trailmeta     "
				+ "				from(select *  "
				+ "				    from trail   "
				+ "				    where trailrange in('A') and trunc(traildate) < trunc(sysdate)  "
				+ "				    order by trailcount desc, trailgood desc)) "
				+ "                    where rnum >= ? and rnum <= ?";
		//지금 값확인을 위해 = 대신 < 사용 실제 이용시 < 를 = 로 변경해야한다 
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Trail trail = new Trail();
				trail.setTrailId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                
                list.add(trail);
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Trail> searchByNickName(Connection conn, String keyword) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select  trailid, mid, traildate, trailjson, trailcount, trailgood,   "
				+ "				             trailrange, threadyn, trailreport, trailmeta, tagname  "
				+ "				                                   from (select *   "
				+ "				                                    from  trail  "
				+ "				                                    join tag using(trailid)   "
				+ "                                                    join member using(mid) "
				+ "				                                    where trailrange in('A', 'F') and nickname like ?  "
				+ "				                                    order by traildate desc)";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "%" + keyword + "%");  

			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Trail trail = new Trail();
				trail.setTrailId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                
                list.add(trail);
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Trail> selectBestOneTag(Connection conn) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select tagname, nickname, trailid, mid, traildate, trailjson, trailcount, trailgood,  "
				+ "        trailrange, threadyn, trailreport, trailmeta  "
				+ "        from trail "
				+ "        join tag using(trailid) "
				+ "        join member using(mid) "
				+ "        where trailrange = 'A'  "
				+ "        and tagname =  (select  tagname "
				+ "                   from (select rownum runm,  tagname "
				+ "                    from(select tagname, count(trailid) tagcount "
				+ "                        from tag "
				+ "                        join tagid using(tagname) "
				+ "                        join trail using(trailid) "
				+ "                        where tagdate  >= SYSDATE - 100 AND tagdate <= SYSDATE + 5  "
				+ "                        and TRAILRANGE = 'A' "
				+ "                        group by tagname "
				+ "                        order by tagcount desc) "
				+ "                     ) "
				+ "                 where runm <= 1) "
				+ "        order by trailgood desc, trailcount desc";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Trail trail = new Trail();
				
				trail.setTrailId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                trail.setSelectNickName(rset.getString("nickname"));
                trail.setTagName(rset.getString("tagname"));
                list.add(trail);
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int oneTagSelectListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) "
				+ "from  "
				+ "(select tagname, nickname, trailid, mid, traildate, trailjson, trailcount, trailgood,   "
				+ "				        trailrange, threadyn, trailreport, trailmeta   "
				+ "				        from trail  "
				+ "				       join tag using(trailid)  "
				+ "				        join member using(mid)  "
				+ "                    where trailrange = 'A'   "
				+ "				        and tagname =  (select  tagname  "
				+ "				                   from (select rownum runm,  tagname  "
				+ "				                    from(select tagname, count(trailid) tagcount  "
				+ "				                        from tag  "
				+ "				                       join tagid using(tagname)  "
				+ "				                        join trail using(trailid)  "
				+ "				                        where tagdate  >= SYSDATE - 100 AND tagdate <= SYSDATE + 5   "
				+ "				                        and TRAILRANGE = 'A'  "
				+ "				                        group by tagname  "
				+ "				                        order by tagcount desc)  "
				+ "				                     )  "
				+ "				                where runm <= 1)  "
				+ "				        order by trailgood desc, trailcount desc)";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
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

	public int selectMaxCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*)                                         "
				+ "from (select trailid, mid, traildate, trailjson, trailcount,    "
				+ "								      trailgood, trailrange, threadyn, trailreport, trailmeta  "
				+ "				    from(select rownum rnum, trailid, mid, traildate, trailjson, trailcount,    "
				+ "								      trailgood, trailrange, threadyn, trailreport, trailmeta      "
				+ "								from(select *    "
				+ "								    from trail    "
				+ "								    where trailrange in('A') and trunc(traildate) < trunc(sysdate)   "
				+ "								    order by trailcount desc, trailgood desc)))";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
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

	public int selectMaxViewsCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*)                                  "
				+ "    from (select nickName, trailid, mid, traildate, trailjson, trailcount, trailgood,  "
				+ "						trailrange, threadyn, trailreport, trailmeta   "
				+ "								from(SELECT *   "
				+ "								        FROM trail   "
				+ "				                        JOIN MEMBER USING(MID)  "
				+ "								        WHERE traildate >= SYSDATE -  800 and traildate <= sysdate +5  "
				+ "                                        and trailrange in('A')   "
				+ "								        ORDER BY trailcount DESC   "
				+ "								       ) )";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
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

	public ArrayList<Trail> selectWeeklyBestReadCountViewsMax(Connection conn, int startRow, int endRow) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select nickName, trailid, mid, traildate, trailjson, trailcount, trailgood,  "
				+ "						trailrange, threadyn, trailreport, trailmeta   "
				+ "								from(SELECT rownum rnum , nickName,  "
				+ "                                trailid, mid, traildate, trailjson, trailcount, trailgood,  "
				+ "                                trailrange, threadyn, trailreport, trailmeta   "
				+ "								        FROM trail   "
				+ "				                        JOIN MEMBER USING(MID)  "
				+ "								        WHERE traildate >= SYSDATE - 500 and traildate <= sysdate +5   "
				+ "								                and trailrange in('A')   "
				+ "								        ORDER BY trailcount DESC   "
				+ "								       )   "
				+ "				                 where rnum >= ?  and rnum <= ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Trail trail = new Trail();
				trail.setTrailId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                trail.setSelectNickName(rset.getString("nickname"));
                list.add(trail);
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int selectMaxViewsGoodCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*)			                                                     "
				+ "from (select nickname, trailid, mid, traildate, trailjson, trailcount,  "
				+ "                     trailgood, trailrange, threadyn, trailreport, trailmeta  "
				+ "				   from (select *  "
				+ "				        from trail  "
				+ "                        join member using(mid)  "
				+ "				        where  trailrange in('A') and  traildate >= SYSDATE - 300 and traildate <= sysdate +5  "
				+ "				        order by trailgood desc))";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
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

	public ArrayList<Trail> selectWeeklyBestGoodViews(Connection conn, int startRow, int endRow) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select nickname, trailid, mid, traildate, trailjson, trailcount,  "
				+ "                     trailgood, trailrange, threadyn, trailreport, trailmeta	 "
				+ "from (select rownum rnum , nickname, trailid, mid, traildate, trailjson, trailcount,  "
				+ "                     trailgood, trailrange, threadyn, trailreport, trailmeta  "
				+ "				   from (select *  "
				+ "				        from trail  "
				+ "                        join member using(mid)  "
				+ "				        where  trailrange in('A') and  traildate >= SYSDATE - 300 and traildate <= sysdate +5  "
				+ "				        order by trailgood desc)) "
				+ "           where rnum >= ?  and rnum <= ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Trail trail = new Trail();
				trail.setTrailId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                trail.setSelectNickName(rset.getString("nickname"));
                list.add(trail);
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Trail> selectWeeklyBestOneTagViews(Connection conn, int startRow, int endRow) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select tagname, nickname, trailid, mid, traildate, trailjson, trailcount, trailgood,   "
				+ "				        trailrange, threadyn, trailreport, trailmeta                                             "
				+ "from (select rownum rnum, tagname, nickname, trailid, mid, traildate, trailjson, trailcount, trailgood,   "
				+ "				        trailrange, threadyn, trailreport, trailmeta   "
				+ "				        from trail  "
				+ "				        join tag using(trailid)  "
				+ "				        join member using(mid)  "
				+ "				        where trailrange = 'A'   "
				+ "				        and tagname =  (select  tagname  "
				+ "				                   from (select rownum runm,  tagname  "
				+ "				                    from(select tagname, count(trailid) tagcount  "
				+ "				                        from tag  "
				+ "				                       join tagid using(tagname)  "
				+ "                                      join trail using(trailid)  "
				+ "				                        where tagdate  >= SYSDATE - 100 AND tagdate <= SYSDATE + 5   "
				+ "				                        and TRAILRANGE = 'A'  "
				+ "				                        group by tagname  "
				+ "				                        order by tagcount desc)  "
				+ "				                     )  "
				+ "				                 where runm <= 1)  "
				+ "				        order by trailcount desc, trailgood desc) "
				+ "                        where rnum >= ?  and rnum <= ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Trail trail = new Trail();
				
				trail.setTrailId(rset.getString("trailid"));
                trail.setmId(rset.getString("mid"));
                trail.setTrailDate(rset.getDate("traildate"));
                trail.setTrailJson(rset.getString("trailjson"));
                trail.setTrailCount(rset.getInt("trailcount"));
                trail.setTrailGood(rset.getInt("trailgood"));
                trail.setTrailRange(rset.getString("trailrange"));
                trail.setThreadYn(rset.getString("threadyn"));
                trail.setTrailReport(rset.getString("trailreport"));
                trail.setTrailMeta(rset.getString("trailmeta"));
                trail.setSelectNickName(rset.getString("nickname"));
                trail.setTagName(rset.getString("tagname"));
                list.add(trail);
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int selectUserRankingViewsCount(Connection conn, String nickName) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*)                 "
				+ "        from(select trailid, mid, traildate, trailjson, trailcount,   "
				+ "				trailgood, trailrange, threadyn, trailreport, trailmeta  "
				+ "				from(select *  "
				+ "				    from trail  "
				+ "				    join member using(mid)  "
				+ "				    where  trailrange in('A')    "
				+ "				           and nickname like ?  "
				+ "				          order by traildate desc))";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "%" + nickName + "%");  

			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt(1);
			
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public int selectTagViewsCount(Connection conn, String tagName) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) "
				+ "    from(select  * "
				+ "            from (select *   "
				+ "                    from trail   "
				+ "                    join tag using(trailid)  "
				+ "                    where  trailrange in('A')    "
				+ "                    and tagname like ?  "
				+ "                    order by traildate desc))";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "%" + tagName + "%");  

			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt(1);
			
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	

}
