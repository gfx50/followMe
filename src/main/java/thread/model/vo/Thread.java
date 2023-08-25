package thread.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Thread implements Serializable{
	private static final long serialVersionUID = -7147249134302375101L;
	
	private String trailId;
	private String threadId;
	private Date threadDate;
	
	public Thread() {}

	public Thread(String trailId, String threadId, Date threadDate) {
		super();
		this.trailId = trailId;
		this.threadId = threadId;
		this.threadDate = threadDate;
	}

	public String getTrailId() {
		return trailId;
	}

	public void setTrailId(String trailId) {
		this.trailId = trailId;
	}

	public String getThreadId() {
		return threadId;
	}

	public void setThreadId(String threadId) {
		this.threadId = threadId;
	}

	public Date getThreadDate() {
		return threadDate;
	}

	public void setThreadDate(Date threadDate) {
		this.threadDate = threadDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Thread [trailId=" + trailId + ", threadId=" + threadId + ", threadDate=" + threadDate + "]";
	}
	
	
}
