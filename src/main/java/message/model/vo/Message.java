package message.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Message implements Serializable{
	private static final long serialVersionUID = 7165494915971948627L;
	
	private  int messageId;
	private String mId;
	private String rcvmId;
	private String messageContent;
	private java.sql.Date messageTime;
	private String rcvYN;
	
	public Message() {}

	public Message(int messageId, String mId, String rcvmId, String messageContent, Date messageTime, String rcvYN) {
		super();
		this.messageId = messageId;
		this.mId = mId;
		this.rcvmId = rcvmId;
		this.messageContent = messageContent;
		this.messageTime = messageTime;
		this.rcvYN = rcvYN;
	}

	public int getMsgId() {
		return messageId;
	}

	public void setMsgId(int messageId) {
		this.messageId = messageId;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getRcvmId() {
		return rcvmId;
	}

	public void setRcvmId(String rcvmId) {
		this.rcvmId = rcvmId;
	}

	public String getMsgContent() {
		return messageContent;
	}

	public void setMsgContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public java.sql.Date getMsgTime() {
		return messageTime;
	}

	public void setMsgTime(java.sql.Date messageTime) {
		this.messageTime = messageTime;
	}

	public String getRcvYN() {
		return rcvYN;
	}

	public void setRcvYN(String rcvYN) {
		this.rcvYN = rcvYN;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Msg [messageId=" + messageId + ", mId=" + mId + ", rcvmId=" + rcvmId + ", messageContent=" + messageContent
				+ ", messageTime=" + messageTime + ", rcvYN=" + rcvYN + "]";
	}
	
	
}
