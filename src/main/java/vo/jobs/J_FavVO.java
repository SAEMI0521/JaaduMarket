package vo.jobs;


public class J_FavVO {
	
	private int j_fav_seq;
	private int m_seq;
	private int j_seq;
	
	public J_FavVO() {
		// TODO Auto-generated constructor stub
	}
	
	public J_FavVO(int j_fav_seq, int m_seq, int j_seq) {
		super();
		this.j_fav_seq = j_fav_seq;
		this.m_seq = m_seq;
		this.j_seq = j_seq;
	}
	
	public int getJ_fav_seq() {
		return j_fav_seq;
	}
	public void setJ_fav_seq(int j_fav_seq) {
		this.j_fav_seq = j_fav_seq;
	}
	public int getM_seq() {
		return m_seq;
	}
	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}
	public int getJ_seq() {
		return j_seq;
	}
	public void setJ_seq(int j_seq) {
		this.j_seq = j_seq;
	}
	
	

}
