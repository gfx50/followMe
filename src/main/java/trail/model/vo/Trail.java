package trail.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Objects;

public class Trail implements Serializable{
	private static final long serialVersionUID = -5749985199797769034L;
	
	private String traiIId;
	private String mId;
	private Date trailDate;
	private String trailJson;
	private int trailCount;
	private int trailGood;
	private String trailRange;
	private String threadYn;
	private String trailReport;
	private String trailMeta;
	
	public Trail() {}

	public Trail(String traiIId, String mId, Date trailDate, String trailJson, int trailCount, int trailGood,
			String trailRange, String threadYn, String trailReport, String trailMeta) {
		super();
		this.traiIId = traiIId;
		this.mId = mId;
		this.trailDate = trailDate;
		this.trailJson = trailJson;
		this.trailCount = trailCount;
		this.trailGood = trailGood;
		this.trailRange = trailRange;
		this.threadYn = threadYn;
		this.trailReport = trailReport;
		this.trailMeta = trailMeta;
	}

	public String getTraiIId() {
		return traiIId;
	}

	public void setTraiIId(String traiIId) {
		this.traiIId = traiIId;
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

	@Override
	public int hashCode() {
		return Objects.hash(mId, threadYn, traiIId, trailCount, trailDate, trailGood, trailJson, trailMeta, trailRange,
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
				&& Objects.equals(traiIId, other.traiIId) && trailCount == other.trailCount
				&& Objects.equals(trailDate, other.trailDate) && trailGood == other.trailGood
				&& Objects.equals(trailJson, other.trailJson) && Objects.equals(trailMeta, other.trailMeta)
				&& Objects.equals(trailRange, other.trailRange) && Objects.equals(trailReport, other.trailReport);
	}

	@Override
	public String toString() {
		return "Trail [traiIId=" + traiIId + ", mId=" + mId + ", trailDate=" + trailDate + ", trailJson=" + trailJson
				+ ", trailCount=" + trailCount + ", trailGood=" + trailGood + ", trailRange=" + trailRange
				+ ", threadYn=" + threadYn + ", trailReport=" + trailReport + ", trailMeta=" + trailMeta + "]";
	}
	
	
}
