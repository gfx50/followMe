package message.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import message.model.vo.Message;

import static common.JDBCTemplate.*;

public class MessageDao {
	public MessageDao() {}

	public ArrayList<Message> selectList(Connection conn, String mid) {
		ArrayList<Message> list = new ArrayList<Message>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from MESSAGE A left join member B on A.mid = B.mid where RCVMID = ? ORDER BY MESSAGETIME";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Message message = new Message();
				
				message.setMsgId(rset.getInt("MESSAGEID"));
				
				message.setmId(rset.getString("MID"));
				message.setRcvmId(rset.getString("RCVMID"));
				message.setMsgContent(rset.getString("MESSAGECONTENT"));
				message.setMsgTime(rset.getDate("MESSAGETIME"));
				message.setRcvYN(rset.getString("RCVYN"));
				message.setEmail(rset.getString("email"));
				message.setProfilepic(rset.getString("PROFILEPIC"));
				
				list.add(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertMessage(Connection conn, Message message) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into message values (default, ?, ?, ?, sysdate, 'N')";
		
		System.out.println(message.getmId() + ", " + message.getRcvmId() + "," + message.getMsgContent());
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, message.getmId());
			pstmt.setString(2, message.getRcvmId());
			pstmt.setString(3, message.getMsgContent());
			
			System.out.println(message.getMsgContent());
			result = pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public ArrayList<Message> selectListsend(Connection conn, String getmId) {
		ArrayList<Message> list = new ArrayList<Message>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from MESSAGE A left join member B on A.rcvmid = B.mid where A.MID = ? ORDER BY MESSAGETIME";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, getmId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Message message = new Message();
				
				message.setMsgId(rset.getInt("MESSAGEID"));
				message.setmId(rset.getString("MID"));
				message.setRcvmId(rset.getString("RCVMID"));
				message.setMsgContent(rset.getString("MESSAGECONTENT"));
				message.setMsgTime(rset.getDate("MESSAGETIME"));
				message.setRcvYN(rset.getString("RCVYN"));
				message.setNickName(rset.getString("email"));
				message.setProfilepic(rset.getString("PROFILEPIC"));
				
				list.add(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public String selectMid(Connection conn, String email) {
		ArrayList<Message> list = new ArrayList<Message>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where email = ?";
		String mid = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			
			
			while(rset.next()) {
				mid = rset.getString("MID");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mid;
	}

	public int deleteMember(Connection conn, String mid, String content) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from message where mid = ? and MESSAGECONTENT=?";
		
		try {
			pstmt = conn.prepareStatement(query);				
			
			pstmt.setString(1, mid);
			pstmt.setString(2, content);
			
			result = pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int checkMessage(Connection conn, String mid, String content) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update message set RCVYN = 'Y' where mid = ? and MESSAGECONTENT=?";
		
		try {
			pstmt = conn.prepareStatement(query);				
			
			pstmt.setString(1, mid);
			pstmt.setString(2, content);
			
			result = pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
}
