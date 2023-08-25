package notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable{
	private static final long serialVersionUID = 5875954839993211121L;
	
	private String noticeId;
	private String admEmail;
	private String noticeTitle;
	private String noticeContent;
	private String fileName;
	private Date noticeDate;
	private String noticeCount;
	
	public Notice() {}

	public Notice(String noticeId, String admEmail, String noticeTitle, String noticeContent, String fileName,
			Date noticeDate, String noticeCount) {
		super();
		this.noticeId = noticeId;
		this.admEmail = admEmail;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.fileName = fileName;
		this.noticeDate = noticeDate;
		this.noticeCount = noticeCount;
	}

	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public String getAdmEmail() {
		return admEmail;
	}

	public void setAdmEmail(String admEmail) {
		this.admEmail = admEmail;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(String noticeCount) {
		this.noticeCount = noticeCount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", admEmail=" + admEmail + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", fileName=" + fileName + ", noticeDate=" + noticeDate
				+ ", noticeCount=" + noticeCount + "]";
	}



}
