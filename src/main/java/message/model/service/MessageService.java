package message.model.service;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import message.model.dao.MessageDao;
import message.model.vo.Message;

public class MessageService {
	private MessageDao mdao = new MessageDao();
	
	public MessageService() {}

	public ArrayList<Message> selectList(String mid) {
		Connection conn = getConnection();
		ArrayList<Message> list = mdao.selectList(conn, mid);
		close(conn);
		return list;
	}

	public int insertMessage(Message message) {
		Connection conn = getConnection();
		int result = mdao.insertMessage(conn, message);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public ArrayList<Message> selectListsend(String getmId) {
		Connection conn = getConnection();
		ArrayList<Message> list = mdao.selectListsend(conn, getmId);
		close(conn);
		return list;
	}

	public String selectMid(String email) {
		Connection conn = getConnection();
		String mid = mdao.selectMid(conn, email);
		close(conn);
		return mid;
	}

	public int deleteMessage(String mid, String content) {
		Connection conn = getConnection();
		int result = mdao.deleteMember(conn, mid, content);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int checkMessage(String mid, String content) {
		Connection conn = getConnection();
		int result = mdao.checkMessage(conn, mid, content);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	
}
