package com.jhta.planit.user.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.user.vo.MembersVo;

@Repository
public class MypageDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.user.mybatis.mypageMapper";

	public HashMap<Object, Object> profileInfo(HashMap<String, String> parammap) {
		return sqlSession.selectOne(NAMESPACE + ".profileInfo", parammap);
	}

	public void joinProfileImg(String mem_id) {
		sqlSession.insert(NAMESPACE + ".joinProfileImg", mem_id);
	}

	public void joinProfileInfo(MembersVo vo) {
		sqlSession.insert(NAMESPACE + ".joinProfileInfo", vo);
	}

	public List<HashMap<Object, Object>> followedlist(String mem_id) {
		return sqlSession.selectList(NAMESPACE + ".followedlist", mem_id);
	}

	public List<HashMap<Object, Object>> followlist(String mem_id) {
		return sqlSession.selectList(NAMESPACE + ".followlist", mem_id);
	}

	public List<HashMap<Object, Object>> postslist(String mem_id) {
		return sqlSession.selectList(NAMESPACE + ".postslist", mem_id);
	}

	public List<HashMap<Object, Object>> travel(String mem_id) {
		return sqlSession.selectList(NAMESPACE + ".travel", mem_id);
	}

	public List<HashMap<Object, Object>> comments(String mem_id) {
		return sqlSession.selectList(NAMESPACE + ".comments", mem_id);
	}

	public List<HashMap<Object, Object>> book(String mem_id) {
		return sqlSession.selectList(NAMESPACE + ".book", mem_id);
	}

	public int follow(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE + ".follow", map);
	}

	public int unfollow(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE + ".unfollow", map);
	}

	public int followedcnt(String mem_id) {
		return sqlSession.selectOne(NAMESPACE + ".followedcnt", mem_id);
	}

	public int withdrawal(String mem_id) {
		return sqlSession.update(NAMESPACE + ".withdrawal", mem_id);
	}
}
