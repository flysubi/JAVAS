package model;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FitnessDao {

	@Autowired
	SqlSessionFactory factory;
	
	public boolean setMyFit(Map map) {
		SqlSession session = factory.openSession();
		System.out.println(map);
		try {
			session.insert("fitness.setMyFit",map);
			return true;
		} catch(Exception e) {
			System.out.println("[fitness] setMyFit error ... "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
	
	public Map getMyFit(String id) {
		SqlSession session = factory.openSession();
		try {
			Map map = session.selectOne("fitness.getMyFit",id);
			return map;
		} catch(Exception e) {
			System.out.println("[fitness] getMyFit error ... "+e.toString());
			return null;
		} finally {
			session.close();
		}
	}
	
	public boolean myFitUpdate(Map map) {
		SqlSession session = factory.openSession();
		try {
			session.update("fitness.myFitUpdate",map);
			return true;
		} catch(Exception e) {
			System.out.println("[fitness] myFitUpdate error ... "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
}
