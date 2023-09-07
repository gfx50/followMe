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
	
	private String nickName;
	private String profilepic;

	
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

	public String getCommentsId() {
		return commentsId;
	}

	public void setCommentsId(String commentsId) {
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

	public String getCommentsContent() {
		return commentsContent;
	}

	public void setCommentsContent(String commentsContent) {
		this.commentsContent = commentsContent;
	}

	public int getCommentsType() {
		return commentsType;
	}

	public void setCommentsType(int commentsType) {
		this.commentsType = commentsType;
	}

	public Date getCommentsTime() {
		return commentsTime;
	}

	public void setCommentsTime(Date commentsTime) {
		this.commentsTime = commentsTime;
	}

	public String getCommentsReportYn() {
		return commentsReportYn;
	}

	public void setCommentsReportYn(String commentsReportYn) {
		this.commentsReportYn = commentsReportYn;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getProfilepic() {
		return profilepic;
	}

	public void setProfilepic(String profilepic) {
		this.profilepic = profilepic;
	}

	@Override
	public String toString() {
		return "Comments [commentsId=" + commentsId + ", trailId=" + trailId + ", mId=" + mId + ", commentsContent=" + commentsContent
				+ ", commentsType=" + commentsType + ", commentsTime=" + commentsTime + ", commentsReportYn=" + commentsReportYn + "]";
	}
	
}
