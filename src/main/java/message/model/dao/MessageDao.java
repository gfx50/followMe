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
		
		String query = "select * from MESSAGE where RCVMID = ?";
		
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
	
	
}
