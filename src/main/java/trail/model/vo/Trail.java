package trail.model.vo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.util.Objects;

import book.model.dao.BookDao;
import book.model.vo.Book;

public class Trail implements Serializable{
	private static final long serialVersionUID = -5749985199797769034L;
	
	private String trailId;
	private String mId;
	private Date trailDate;
	private String trailJson;
	private int trailCount;
	private int trailGood;
	private String trailRange;
	private String threadYn;
	private String trailReport;
	private String trailMeta;
	private String selectNickName;
	private String tagName;
	private String originFileName;
	private String nickName;
	public Trail() {}


	public Trail(String trailId, String mId, Date trailDate, String trailJson, int trailCount, int trailGood,
			String trailRange, String threadYn, String trailReport, String trailMeta, String selectNickName,
			String tagName) {
		super();
		this.trailId = trailId;
		this.mId = mId;
		this.trailDate = trailDate;
		this.trailJson = trailJson;
		this.trailCount = trailCount;
		this.trailGood = trailGood;
		this.trailRange = trailRange;
		this.threadYn = threadYn;
		this.trailReport = trailReport;
		this.trailMeta = trailMeta;
		this.selectNickName = selectNickName;
		this.tagName = tagName;
	}




	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
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

	public Date getTrailDate() {
		return trailDate;
	}

	public void setTrailDate(Date trailDate) {
		this.trailDate = trailDate;
	}

	public String getTrailJson() {
		return trailJson;
	}

	public void setTrailJson(String trailJson) {
		this.trailJson = trailJson;
	}

	public int getTrailCount() {
		return trailCount;
	}

	public void setTrailCount(int trailCount) {
		this.trailCount = trailCount;
	}

	public int getTrailGood() {
		return trailGood;
	}

	public void setTrailGood(int trailGood) {
		this.trailGood = trailGood;
	}

	public String getTrailRange() {
		return trailRange;
	}

	public void setTrailRange(String trailRange) {
		this.trailRange = trailRange;
	}

	public String getThreadYn() {
		return threadYn;
	}

	public void setThreadYn(String threadYn) {
		this.threadYn = threadYn;
	}

	public String getTrailReport() {
		return trailReport;
	}

	public void setTrailReport(String trailReport) {
		this.trailReport = trailReport;
	}

	public String getTrailMeta() {
		return trailMeta;
	}

	public void setTrailMeta(String trailMeta) {
		this.trailMeta = trailMeta;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getSelectNickName() {
		return selectNickName;
	}



	public void setSelectNickName(String selectNickName) {
		this.selectNickName = selectNickName;
	}

	public String getTagName() {
		return tagName;
	}


	public void setTagName(String tagName) {
		this.tagName = tagName;
	}







	@Override
	public int hashCode() {
		return Objects.hash(mId, threadYn, trailId, trailCount, trailDate, trailGood, trailJson, trailMeta, trailRange,
				trailReport);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Trail other = (Trail) obj;
		return Objects.equals(mId, other.mId) && Objects.equals(threadYn, other.threadYn)
				&& Objects.equals(trailId, other.trailId) && trailCount == other.trailCount
				&& Objects.equals(trailDate, other.trailDate) && trailGood == other.trailGood
				&& Objects.equals(trailJson, other.trailJson) && Objects.equals(trailMeta, other.trailMeta)
				&& Objects.equals(trailRange, other.trailRange) && Objects.equals(trailReport, other.trailReport);
	}



	@Override
	public String toString() {
		return "Trail [trailId=" + trailId + ", mId=" + mId + ", trailDate=" + trailDate + ", trailJson=" + trailJson
				+ ", trailCount=" + trailCount + ", trailGood=" + trailGood + ", trailRange=" + trailRange
				+ ", threadYn=" + threadYn + ", trailReport=" + trailReport + ", trailMeta=" + trailMeta
				+ ", selectNickName=" + selectNickName + ", tagName=" + tagName + "]";
	}


	
	}

