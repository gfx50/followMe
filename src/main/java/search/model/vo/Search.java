package search.model.vo;

import follow.model.vo.Follow;

public class Search implements java.io.Serializable{
	private static final long serialVersionUID = -1821857995930160164L;
	private Follow searchfollowee;
	private Follow searchfollower;
	private int no;
	
	public Search() {}

	public Search(Follow searchfollowee, Follow searchfollower, int no) {
		super();
		this.searchfollowee = searchfollowee;
		this.searchfollower = searchfollower;
		this.no = no;
	}

	public Follow getSearchfollowee() {
		return searchfollowee;
	}

	public void setSearchfollowee(Follow searchfollowee) {
		this.searchfollowee = searchfollowee;
	}

	public Follow getSearchfollower() {
		return searchfollower;
	}

	public void setSearchfollower(Follow searchfollower) {
		this.searchfollower = searchfollower;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Search [searchfollowee=" + searchfollowee + ", searchfollower=" + searchfollower + ", no=" + no + "]";
	}
	
	
	

}
