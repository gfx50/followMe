package tagid.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class TagId implements Serializable {
	private static final long serialVersionUID = -1321270341407366147L;
	
	private String tagName;
	private Date date;
	private String tagMeta;
	
	public TagId() {}

	public TagId(String tagName, Date date, String tagMeta) {
		super();
		this.tagName = tagName;
		this.date = date;
		this.tagMeta = tagMeta;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTagMeta() {
		return tagMeta;
	}

	public void setTagMeta(String tagMeta) {
		this.tagMeta = tagMeta;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "TagId [tagName=" + tagName + ", date=" + date + ", tagMeta=" + tagMeta + "]";
	}
	
	
}
