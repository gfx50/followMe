package book.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Book implements Serializable{
	private static final long serialVersionUID = -8923023145400320865L;
	private String mId;
	private String trailId;
	private java.sql.Date bookTime;
	private String bookYN;
	
	public Book() {}

	public Book(String mId, String trailId, Date bookTime, String bookYN) {
		super();
		this.mId = mId;
		this.trailId = trailId;
		this.bookTime = bookTime;
		this.bookYN = bookYN;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getTrailId() {
		return trailId;
	}

	public void setTrailId(String trailId) {
		this.trailId = trailId;
	}

	public java.sql.Date getBookTime() {
		return bookTime;
	}

	public void setBookTime(java.sql.Date bookTime) {
		this.bookTime = bookTime;
	}

	public String getBookYN() {
		return bookYN;
	}

	public void setBookYN(String bookYN) {
		this.bookYN = bookYN;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Book [mId=" + mId + ", trailId=" + trailId + ", bookTime=" + bookTime + ", bookYN=" + bookYN + "]";
	}
	
	
}
