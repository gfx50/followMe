package good.model.vo;

import java.io.Serializable;

public class Good implements Serializable{
	private static final long serialVersionUID = -4795571806483889072L;
	
	private String mId;
	private String trailId;
	private String likeYn;
	
	public Good() {}

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

	public String getLikeYn() {
		return likeYn;
	}

	public void setLikeYn(String likeYn) {
		this.likeYn = likeYn;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Good [mId=" + mId + ", trailId=" + trailId + ", likeYn=" + likeYn + "]";
	}
	
	
}
