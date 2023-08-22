package member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Objects;

public class Member implements Serializable{
	private static final long serialVersionUID = -4952932019676617041L;
	
	private String mId;
	private String email;
	private String socialId;
	private String nickName;
	private String profilePic;
	private String pwd;
	private String mName;
	private Date birthDate;
	private String gender;
	private String phone;
	private Date entranceDate;
	private Date lastLoginDate;
	private Date passModifyDate;
	private int loginLv;
	private String memberMeta;
	
	public Member() {}

	public Member(String mId, String email, String socialId, String nickName, String profilePic, String pwd,
			String mName, Date birthDate, String gender, String phone, Date entranceDate, Date lastLoginDate,
			Date passModifyDate, int loginLv, String memberMeta) {
		super();
		this.mId = mId;
		this.email = email;
		this.socialId = socialId;
		this.nickName = nickName;
		this.profilePic = profilePic;
		this.pwd = pwd;
		this.mName = mName;
		this.birthDate = birthDate;
		this.gender = gender;
		this.phone = phone;
		this.entranceDate = entranceDate;
		this.lastLoginDate = lastLoginDate;
		this.passModifyDate = passModifyDate;
		this.loginLv = loginLv;
		this.memberMeta = memberMeta;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSocialId() {
		return socialId;
	}

	public void setSocialId(String socialId) {
		this.socialId = socialId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEntranceDate() {
		return entranceDate;
	}

	public void setEntranceDate(Date entranceDate) {
		this.entranceDate = entranceDate;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public Date getPassModifyDate() {
		return passModifyDate;
	}

	public void setPassModifyDate(Date passModifyDate) {
		this.passModifyDate = passModifyDate;
	}

	public int getLoginLv() {
		return loginLv;
	}

	public void setLoginLv(int loginLv) {
		this.loginLv = loginLv;
	}

	public String getMemberMeta() {
		return memberMeta;
	}

	public void setMemberMeta(String memberMeta) {
		this.memberMeta = memberMeta;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(birthDate, email, entranceDate, gender, lastLoginDate, loginLv, mId, mName, memberMeta,
				nickName, passModifyDate, phone, profilePic, pwd, socialId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Member other = (Member) obj;
		return Objects.equals(birthDate, other.birthDate) && Objects.equals(email, other.email)
				&& Objects.equals(entranceDate, other.entranceDate) && Objects.equals(gender, other.gender)
				&& Objects.equals(lastLoginDate, other.lastLoginDate) && loginLv == other.loginLv
				&& Objects.equals(mId, other.mId) && Objects.equals(mName, other.mName)
				&& Objects.equals(memberMeta, other.memberMeta) && Objects.equals(nickName, other.nickName)
				&& Objects.equals(passModifyDate, other.passModifyDate) && Objects.equals(phone, other.phone)
				&& Objects.equals(profilePic, other.profilePic) && Objects.equals(pwd, other.pwd)
				&& Objects.equals(socialId, other.socialId);
	}

	@Override
	public String toString() {
		return "Member [mId=" + mId + ", email=" + email + ", socialId=" + socialId + ", nickName=" + nickName
				+ ", profilePic=" + profilePic + ", pwd=" + pwd + ", mName=" + mName + ", birthDate=" + birthDate
				+ ", gender=" + gender + ", phone=" + phone + ", entranceDate=" + entranceDate + ", lastLoginDate="
				+ lastLoginDate + ", passModifyDate=" + passModifyDate + ", loginLv=" + loginLv + ", memberMeta="
				+ memberMeta + "]";
	}
	
	
}
