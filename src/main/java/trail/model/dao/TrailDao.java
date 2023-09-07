package trail.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import trail.model.vo.Trail;


public class TrailDao {
	public TrailDao() {}

	public ArrayList<Trail> selectList(Connection conn, int startRow, int endRow) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM " 
				+ "(SELECT ROWNUM rnum, t.trailid, t.mid, t.traildate, t.trailjson, t.trailcount, t.trailgood, t.trailrange, t.threadyn, t.trailreport, t.trailmeta, m.email, m.socialid, m.nickname, m.profilepic, m.pwd, m.mname, m.birthdate, m.gender, m.phone, m.entrancedate, m.lastlogindate, m.passmodifydate, m.loginlv, m.membermeta " 
				+ "FROM (SELECT trailid, mid, traildate, trailjson, trailcount, trailgood, trailrange, threadyn, trailreport, trailmeta FROM trail where trailrange = 'A' ORDER BY traildate DESC) t "
				+ "LEFT JOIN member m ON t.mid = m.mid) " 
			    + "WHERE rnum >= ? AND rnum <= ?";

		
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
	                trail.setNickName(rset.getString("nickname"));

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

	public ArrayList<Trail> selectCountList(Connection conn) {
		 ArrayList<Trail> list = new ArrayList<Trail>();
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        
	        String query = "select * from trail where rownum <= 20 order by trailcount desc"; 
	        
	        try {
	            pstmt = conn.prepareStatement(query);
	            
	            rset = pstmt.executeQuery();
	            
	            while(rset.next()) {
	                Trail trail = new Trail();
	                
	                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
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

	public ArrayList<Trail> selectGoodList(Connection conn) {
		ArrayList<Trail> list = new ArrayList<Trail>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = "select * from trail where rownum <= 20 order by trailgood desc"; 
        
        try {
            pstmt = conn.prepareStatement(query);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Trail trail = new Trail();
                
                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
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

	public ArrayList<Trail> selectReportList(Connection conn) {
		ArrayList<Trail> list = new ArrayList<Trail>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = "select * from trail where trailreport = 'Y' and rownum <= 20"; 
        
        try {
            pstmt = conn.prepareStatement(query);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Trail trail = new Trail();
                
                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
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

	public ArrayList<Trail> selectDateList(Connection conn) {
		ArrayList<Trail> list = new ArrayList<Trail>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = "select * from trail where rownum <= 20 order by traildate desc"; 
        
        try {
            pstmt = conn.prepareStatement(query);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Trail trail = new Trail();
                
                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
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

	public ArrayList<Trail> selectMyList(Connection conn, String mid, int startRow, int endRow) {
		ArrayList<Trail> list = new ArrayList<Trail>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = "SELECT * FROM "
        		+ "(SELECT ROWNUM rnum, t.trailid, t.mid, t.traildate, t.trailjson, t.trailcount, t.trailgood, t.trailrange, t.threadyn, t.trailreport, t.trailmeta, m.email, m.socialid, m.nickname, m.profilepic, m.pwd, m.mname, m.birthdate, m.gender, m.phone, m.entrancedate, m.lastlogindate, m.passmodifydate, m.loginlv, m.membermeta "
        		+ "FROM (SELECT trailid, mid, traildate, trailjson, trailcount, trailgood, trailrange, threadyn, trailreport, trailmeta FROM trail ORDER BY traildate DESC) t "
        		+ "LEFT JOIN member m ON t.mid = m.mid "
        		+ "WHERE m.mid = ?) "
        		+ "WHERE rnum >= ? AND rnum <= ?";
        System.out.println(mid);
        
        try {
            pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, mid);
            pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Trail trail = new Trail();
                
                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
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
	public ArrayList<Trail> selectFollowerList(Connection conn, String mid, int startRow, int endRow) {
		ArrayList<Trail> list = new ArrayList<Trail>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = "SELECT * "
        		+ "FROM (SELECT rownum rnum, t.trailid, t.mid, t.traildate, t.trailjson, t.trailcount, t.trailgood, t.trailrange, t.threadyn, t.trailreport, t.trailmeta,  "
        		+ "m.email, m.socialid, m.nickname, m.profilepic, m.pwd, m.mname, m.birthdate, m.gender, m.phone, m.entrancedate, m.lastlogindate, m.passmodifydate, m.loginlv, m.membermeta  "
        		+ "FROM (  "
        		+ "SELECT t.* FROM trail t WHERE EXISTS (SELECT 1 FROM follow f  "
        		+ "WHERE f.mid = t.mid  "
        		+ "AND f.mid2 = ? "
        		+ "AND f.followyn = 'Y')  "
        		+ "AND (t.trailrange = 'A' OR t.trailrange = 'F') "
        		+ "ORDER BY t.traildate DESC "
        		+ ") t JOIN member m ON t.mid = m.mid  "
        		+ ") WHERE rnum >= ? AND rnum <= ?";

        		 
        System.out.println(mid);
        
        try {
            pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, mid);
            pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Trail trail = new Trail();
                
                
                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
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
                trail.setNickName(rset.getString("nickname"));

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
	
	
	public Trail selectTrail(Connection conn, String trailId) {
		Trail trail = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from trail "
				+ "where trailId = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, trailId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				trail = new Trail();
				
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
                
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return trail;

	}

	public int addReadCount(Connection conn, String trailId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update trail "
				+ "set trailcount = trailcount + 1 "
				+ "where trailId = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, trailId);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Trail> selectSearchBookList(Connection conn, String mid, int startRow, int endRow) {
		ArrayList<Trail> list = new ArrayList<Trail>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String query = "SELECT * "
        		+ "FROM (SELECT rownum rnum, t.trailid, t.mid, t.traildate, t.trailjson, t.trailcount, t.trailgood, t.trailrange, t.threadyn, t.trailreport, t.trailmeta, "
        			 + "m.nickname, m.profilepic "
        			 + "FROM (SELECT t.* FROM trail t "
        			 + "WHERE EXISTS (SELECT 1 FROM book b "
        			 + "WHERE b.mid = ? "
        			 + "AND b.trailid = t.trailid) "
        			 + "ORDER BY t.traildate DESC "
        			 + ")t JOIN member m ON t.mid = m.mid) "
        			 + "WHERE rnum >= ? AND rnum <= ?";

        		 
        System.out.println(mid);
        
        try {
            pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, mid);            
            pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                Trail trail = new Trail();
                
                
                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
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
                trail.setNickName(rset.getString("nickname"));

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

	public ArrayList<Trail> selectThreadList(Connection conn, String trailId) {
		 ArrayList<Trail> list = new ArrayList<Trail>();
	        PreparedStatement pstmt = null;
	        ResultSet rset = null;
	        
	        //? 가 threadid 이고 상위 게시물들을 나열하는 query문임(이 게시물을 쓰레드로 사용한 원 게시물 목록)
//	        String query = "select * from trail t where t.trailid in (select h.trailid"
//	        		+ " from thread h left join trail t2 on h.trailid = t2.trailid where h.threadid = ?)";
	        
	        //?가 trailid 이고 하위 쓰레드들을 나열하는 query문임
	        String query = "select * from trail t left join thread h on h.trailid = t.trailid "
	        		+ "where t.trailid in (select threadid from thread where trailid = ?) "
	        		+ "order by traildate desc";
	       
	        
	        try {
	            pstmt = conn.prepareStatement(query);
	            pstmt.setString(1, trailId);
	            
	            rset = pstmt.executeQuery();
	            
	           
	            
	            while(rset.next()) {
	                Trail trail = new Trail();
	                
	                // Trail 객체에 rset에서 가져온 값을 설정하는 부분
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

    // 새 트레일 등록
	public int insertTrail(Connection conn, Trail trail) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into trail values (?, ?, default, ?, 0, 0, default, 'N', 'N', null)";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, trail.getTrailId());
			pstmt.setString(2, trail.getmId());
			pstmt.setString(3, trail.getTrailJson());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateTrail(Connection conn, Trail trail) {
		int result = 0;
		
		PreparedStatement pstmt = null;

		String query = "update trail set trailJson = ? where trailid = ?";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, trail.getTrailJson());
			pstmt.setString(2, trail.getTrailId());

			result = pstmt.executeUpdate();
			System.out.println("traildao : " + result);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateTrailRange(Connection conn, String trailId, String range) {
		int result = 0;
		
		PreparedStatement pstmt = null;

		String query = "update trail set TRAILRANGE = ? where TRAILID = ?";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, range);
			pstmt.setString(2, trailId);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteTrail(Connection conn, String trailId) {
		int result = 0;
		
		PreparedStatement pstmt = null;

		String query = "delete trail where TRAILID = ?";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, trailId);

			result = pstmt.executeUpdate();
			System.out.println("deleteTrail() : " + result );
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateMember(Connection conn, Trail trail, String trailId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update trail set trailreport = 'Y' where trailid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);			
			
			pstmt.setString(1, trailId);
			
			result = pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<Trail> selectAdminReportBoardList(Connection conn) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from Trail where TRAILREPORT = 'Y' ";

		try {
			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Trail trail = new Trail();

				// 결과매핑 : 컬럼값 꺼내서 필드에 옮기기
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

	public int updateReport(Connection conn, Trail trail) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update trail set  TRAILREPORT = ? where TRAILID = ?";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, trail.getTrailReport());
			pstmt.setString(2, trail.getTrailId());
			
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Trail> selectPhotoList(Connection conn, String trailId) {
		ArrayList<Trail> list = new ArrayList<Trail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "SELECT j.originFileName FROM trail,JSON_TABLE(trail.trailjson,'$.trailPhotos[*]'COLUMNS(originFileName PATH '$.originFileName')) j where trailId = ? "
				+ "UNION "
				+ "SELECT j.originFileName FROM trail,JSON_TABLE(trail.trailjson,'$.nonTrailPhotos[*]'COLUMNS(originFileName PATH '$.originFileName')) j where trailId = ?";


		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, trailId); // trailId 매개 변수 설정
			pstmt.setString(2, trailId); // trailId 매개 변수 설정

			rset = pstmt.executeQuery();

			while (rset.next()) {
				String originFileName = rset.getString("originFileName");

				System.out.println(originFileName);
				// originFileName을 사용하여 원하는 작업을 수행하거나
				// Trail 객체를 생성하여 list에 추가할 수 있음
				Trail trail = new Trail();
				trail.setOriginFileName(originFileName);
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
	public int getBookListCount(Connection conn, String mid) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from trail t left join book b on (b.trailid = t.trailid) left join member m on(t.mid = m.mid) where b.mid = ?";

		
		try {
	        pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mid);
			
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
	
	public int getFollowListCount(Connection conn, String mid) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT SUM(total_count) AS total_count "
				+ "FROM ( "
				+ "    SELECT COUNT(*) AS total_count "
				+ "    FROM trail t "
				+ "    LEFT JOIN follow f ON (f.mid = t.mid) "
				+ "    LEFT JOIN member m ON (t.mid = m.mid) "
				+ "    WHERE f.mid2 = ? AND t.trailrange = 'A' "
				+ "    UNION ALL "
				+ "    SELECT COUNT(*) AS total_count "
				+ "    FROM trail t "
				+ "    LEFT JOIN follow f ON (f.mid = t.mid) "
				+ "    LEFT JOIN member m ON (t.mid = m.mid) "
				+ "    WHERE f.mid2 = ? AND t.trailrange = 'F' "
				+ ") subquery";
		
		try {
	        pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mid);
			pstmt.setString(2, mid);

			
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
	public int getListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from trail where trailrange = 'A'";
		
		try {
			pstmt = conn.prepareStatement(query);
			
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

	public int getMyListCount(Connection conn, String mid) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from trail where mid = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mid);
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
