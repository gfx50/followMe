package follow.model.vo;

import java.io.Serializable;
import java.sql.Date;

import member.model.vo.Member;

public class Follow implements Serializable{
	private static final long serialVersionUID = 7733320022591854233L;
	
	private String mID;
	private String mID2;
	private String followYN;
	private java.sql.Date folllowTime;
	private int followRank;
	private int followTotal;
	private String selectNickName;
	
	public Follow() {
		super();
	}
	
	
	






	public Follow(String mID, String mID2, String followYN, Date folllowTime, int followRank, int followTotal,
			String selectNickName) {
		super();
		this.mID = mID;
		this.mID2 = mID2;
		this.followYN = followYN;
		this.folllowTime = folllowTime;
		this.followRank = followRank;
		this.followTotal = followTotal;
		this.selectNickName = selectNickName;
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







	public int getFollowRank() {
		return followRank;
	}







	public void setFollowRank(int followRank) {
		this.followRank = followRank;
	}







	public int getFollowTotal() {
		return followTotal;
	}







	public void setFollowTotal(int followTotal) {
		this.followTotal = followTotal;
	}







	public String getSelectNickName() {
		return selectNickName;
	}









	public void setSelectNickName(String selectNickName) {
		this.selectNickName = selectNickName;
	}









	@Override
	public String toString() {
		return "Follow [mID=" + mID + ", mID2=" + mID2 + ", followYN=" + followYN + ", folllowTime=" + folllowTime
				+ ", followRank=" + followRank + ", followTotal=" + followTotal + ", selectNickName=" + selectNickName
				+ "]";
	}


	

	
	
	
	
	
}
