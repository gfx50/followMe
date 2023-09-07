package book.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import book.model.dao.BookDao;
import book.model.vo.Book;
import member.model.vo.Member;
import trail.model.vo.Trail;

public class BookService {
	private BookDao bdao = new BookDao();

	public int insertBook(Book book, Member member, Trail trail) {
		Connection conn = getConnection();
		int result = bdao.insertBook(conn, book, member, trail);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	
	}

	public int updateBook(Book book, Member member, Trail trail) {
		Connection conn = getConnection();
		int result = bdao.updateBook(conn, book, member, trail);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public Book selectTrailId(String trailId, String mId) {
		Connection conn = getConnection();
		Book book = bdao.selectTrailId(conn, trailId, mId);
		close(conn);
		return book;
	}
	
}
