package follow.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Follow implements Serializable{
	private static final long serialVersionUID = 7733320022591854233L;
	
	private String mID;
	private String mID2;
	private String followYN;
	private java.sql.Date folllowTime;
	public Follow() {
		super();
	}
	public Follow(String mID, String mID2, String followYN, Date folllowTime) {
		super();
		this.mID = mID;
		this.mID2 = mID2;
		this.followYN = followYN;
		this.folllowTime = folllowTime;
	}
	public String getmID() {
		return mID;
	}
	public void setmID(String mID) {
		this.mID = mID;
	}
	public String getmID2() {
		return mID2;
	}
	public void setmID2(String mID2) {
		this.mID2 = mID2;
	}
	public String getFollowYN() {
		return followYN;
	}
	public void setFollowYN(String followYN) {
		this.followYN = followYN;
	}
	public java.sql.Date getFolllowTime() {
		return folllowTime;
	}
	public void setFolllowTime(java.sql.Date folllowTime) {
		this.folllowTime = folllowTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Follow [mID=" + mID + ", mID2=" + mID2 + ", followYN=" + followYN + ", folllowTime=" + folllowTime
				+ "]";
	}
	
	
	
}
