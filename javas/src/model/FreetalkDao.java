package model;

import java.util.*;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreetalkDao {


	@Autowired
	SqlSessionFactory factory;
	
	public List<Map> allTalks(Map map) {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = session.selectList("freetalk.getTalks",map);
			return list;
		} catch(Exception e) {
			System.out.println("[freetalk] allTalks error ... "+e.toString());
			return null;
		} finally {
			session.close();
		}
	}
	
	public boolean addNew(Map map) {
		SqlSession session = factory.openSession();
		try {
			session.insert("freetalk.addNew",map);
			return true;
		} catch(Exception e) {
			System.out.println("[freetalk] addNew error ... "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
	
	public Map oneTalks(int num) {
		SqlSession session = factory.openSession();
		try {
			Map map = session.selectOne("freetalk.getOne",num);
			return map;
		} catch(Exception e) {
			System.out.println("[freetalk] oneTalks error ... "+e.toString());
			return null;
		} finally {
			session.close();
		}
	}
	
	public boolean addComment(Map map) {
		SqlSession session  = factory.openSession();
		try {
			session.insert("freetalk.addComment",map); 
			return true;
		} catch(Exception e) {
			System.out.println("[freetalk] addComment error ... "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
	
	public List<Map> getComment(int num) {
		SqlSession session  = factory.openSession();
		try {
			List<Map> list = session.selectList("freetalk.getComment",num); 
			return list;
		} catch(Exception e) {
			System.out.println("[freetalk] getComment error ... "+e.toString());
			return null;
		} finally {
			session.close();
		}
	}
	
	public int countAll(Map map) {
		SqlSession session = factory.openSession();
		try {
			int n = session.selectOne("freetalk.countAll",map);
			return n;
		} catch(Exception e) {
			return -1; 
		} finally {
			session.close();
		}
	}
	
	public boolean loveUp(Map map) {
		SqlSession session = factory.openSession();
		try {
			session.insert("freetalk.loveUp",map);
			return true;
		} catch(Exception e) {
			return false; 
		} finally {
			session.close();
		}
	}
	
}
