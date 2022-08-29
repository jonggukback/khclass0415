package com.mvc.step3;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.util.MyBatisCommonFactory;

public class MemberDao {
	Logger logger = Logger.getLogger(MemberDao.class);
	SqlSessionFactory sqlSessionFactory = null;
	SqlSession sqlSession = null;
	
	public MemberDao() {
		sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
	}
	
	public List<Map<String, Object>> memberList(Map<String, Object> pMap) {
		logger.info("MemberDao: memberList 호출 성공");
		
		List<Map<String, Object>> memberList = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			memberList = sqlSession.selectList("memberList", pMap);
			// insert here
			logger.info(memberList);
		} catch (Exception e) {
			logger.info("Exception : "+e.toString());
		} finally {
			sqlSession.close();
		}
		return memberList;
	}
}
