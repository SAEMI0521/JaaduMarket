package dao.jobs;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.jobs.J_FavVO;

public class J_FavDAO {
	
	private SqlSession sqlSession;

	public J_FavDAO(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	public int jFavInsert(J_FavVO jfvo) {
		return sqlSession.insert("j_fav.jFavInsert",jfvo);
	}
	
	public int jFavDelete(Map<String, Object> map) {
		return sqlSession.delete("j_fav.jFavDelete", map);
	}
	
	public int jFavCnt(Map<String, Object> map) {
		return sqlSession.selectOne("j_fav.jFavCnt",map);
		
	}
	
	public int jFavAllCnt() {
		return sqlSession.selectOne("j_fav.jFavAllCnt");
		
	}
	

}
