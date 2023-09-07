package tag.model.vo;

import java.io.Serializable;

public class Tag implements Serializable{
	private static final long serialVersionUID = -2162268269167674469L;
	
	private String trailId;
	private String tagName;
	private int tagno;
	
	public Tag() {}

	public Tag(String trailId, String tagName) {
		super();
		this.trailId = trailId;
		this.tagName = tagName;
	}

	public String getTrailId() {
		return trailId;
	}

	public void setTrailId(String trailId) {
		this.trailId = trailId;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

	public int getTagno() {
		return tagno;
	}

	public void setTagno(int tagno) {
		this.tagno = tagno;
	}

	@Override
	public String toString() {
		return "Tag [trailId=" + trailId + ", tagName=" + tagName + "]";
	}
	
	

}
