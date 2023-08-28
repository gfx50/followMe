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
	
	
}
