package model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarDao {

	@Autowired
	SqlSessionFactory factory;
	
	public boolean addCal(Map map) {
		SqlSession session = factory.openSession();
		try {
			session.insert("calendar.addCal",map);
			return true;
		} catch(Exception e) {
			System.out.println("[calendar] addCal error ... "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
	
	public List<Map> getCal(String id) {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = session.selectList("calendar.getCal",id);
			return list;
		} catch(Exception e) {
			System.out.println("[calendar] getCal error ... "+e.toString());
			return null;
		} finally {
			session.close();
		}
	}
	
	public boolean updateCal(Map map) {
		SqlSession session = factory.openSession();
		try {
			session.insert("calendar.updateCal",map);
			return true;
		} catch(Exception e) {
			System.out.println("[calendar] updateCal error ... "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
	
	public boolean deleteCal(int num) {
		SqlSession session = factory.openSession();
		try {
			session.insert("calendar.deleteCal",num);
			return true;
		} catch(Exception e) {
			System.out.println("[calendar] deleteCal error ... "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
}
