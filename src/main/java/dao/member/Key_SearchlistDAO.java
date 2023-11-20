package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.member.Key_SearchlistVO;
import vo.used.U_ChatVO;
import vo.used.U_FavVO;
import vo.used.U_TradelistVO;
import vo.used.UsedVO;

public class Key_SearchlistDAO {

	private SqlSession sqlSession;
	
	public Key_SearchlistDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int keyInsert(Key_SearchlistVO vo) {
		return sqlSession.insert("key_searchlist.insert", vo);
	}
	
	public List<String> myKey(int m_seq){
		return sqlSession.selectList("key_searchlist.myKey", m_seq);
	}
	
}
