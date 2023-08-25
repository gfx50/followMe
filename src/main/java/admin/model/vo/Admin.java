package admin.model.vo;

import java.io.Serializable;

public class Admin implements Serializable{
	private static final long serialVersionUID = -1319274500324210330L;
	private String adminEmail;
	private String adminPwd;
	private int adminLv;
	
	public Admin() {}

	public Admin(String adminEmail, String adminPwd, int adminLv) {
		super();
		this.adminEmail = adminEmail;
		this.adminPwd = adminPwd;
		this.adminLv = adminLv;
	}

	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public int getAdminLv() {
		return adminLv;
	}

	public void setAdminLv(int adminLv) {
		this.adminLv = adminLv;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Admin [adminEmail=" + adminEmail + ", adminPwd=" + adminPwd + ", adminLv=" + adminLv + "]";
	}
	
	
}
