package comments.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Comments implements Serializable{
	private static final long serialVersionUID = -8390641450676877655L;
	
	private String commentsId;
	private String trailId;
	private String mId;
	private String commentsContent;
	private int commentsType;
	private Date commentsTime;
	private String commentsReportYn;
	
	public Comments() {}

	public Comments(String commentsId, String trailId, String mId, String commentsContent, int commentsType, Date commentsTime,
			String commentsReportYn) {
		super();
		this.commentsId = commentsId;
		this.trailId = trailId;
		this.mId = mId;
		this.commentsContent = commentsContent;
		this.commentsType = commentsType;
		this.commentsTime = commentsTime;
		this.commentsReportYn = commentsReportYn;
	}

	public String getCmtId() {
		return commentsId;
	}

	public void setCmtId(String commentsId) {
		this.commentsId = commentsId;
	}

	public String getTrailId() {
		return trailId;
	}

	public void setTrailId(String trailId) {
		this.trailId = trailId;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getCmtContent() {
		return commentsContent;
	}

	public void setCmtContent(String commentsContent) {
		this.commentsContent = commentsContent;
	}

	public int getCmtType() {
		return commentsType;
	}

	public void setCmtType(int commentsType) {
		this.commentsType = commentsType;
	}

	public Date getCmtTime() {
		return commentsTime;
	}

	public void setCmtTime(Date commentsTime) {
		this.commentsTime = commentsTime;
	}

	public String getCmtReportYn() {
		return commentsReportYn;
	}

	public void setCmtReportYn(String commentsReportYn) {
		this.commentsReportYn = commentsReportYn;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Comments [commentsId=" + commentsId + ", trailId=" + trailId + ", mId=" + mId + ", commentsContent=" + commentsContent
				+ ", commentsType=" + commentsType + ", commentsTime=" + commentsTime + ", commentsReportYn=" + commentsReportYn + "]";
	}
	
}
