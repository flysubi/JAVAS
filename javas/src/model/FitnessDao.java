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
	
	public boolean setMyFit(String id) {
		SqlSession session = factory.openSession();
		try {
			session.insert("fitness.setMyFit",id);
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
	
	public List<Map> calSort() {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = session.selectList("fitness.calSort");
			return list;
		} catch(Exception e) {
			System.out.println("[fitness] calSort error ... "+e.toString());
			return null;
		} finally {
			session.close();
		}
	}
	
	public List<Map> calName(String sort) {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = session.selectList("fitness.calName",sort);
			return list;
		} catch(Exception e) {
			System.out.println("[fitness] calName error ... "+e.toString());
			return null;
		} finally {
			session.close();
		}
	}
	
	public int calKcal(String name) {
		SqlSession session = factory.openSession();
		try {
			int n = session.selectOne("fitness.calKcal",name);
			return n;
		} catch(Exception e) {
			System.out.println("[fitness] calKcal error ... "+e.toString());
			return -1;
		} finally {
			session.close();
		}
	}
	
	public boolean myMenu(Map map) {
		SqlSession session = factory.openSession();
		try {
			session.update("fitness.myMenu",map);
			return true;
		} catch(Exception e) {
			System.out.println("[fitness] myMenu error ... "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
	
	public int totalCal(String id) {
		SqlSession session = factory.openSession();
		try {
			int n = session.selectOne("fitness.totalCal",id);
			return n;
		} catch(Exception e) {
			System.out.println("[fitness] totalCal error ... "+e.toString());
			return 0;
		} finally {
			session.close();
		}
	}
	
	public List<Map> todayMenu(String id) {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = session.selectList("fitness.todayMenu",id);
			return list;
		} catch(Exception e) {
			System.out.println("[fitness] todayMenu error ... "+e.toString());
			return null;
		} finally {
			session.close();
		}
	}
	
	public boolean myMenuDel(int num) {
		SqlSession session = factory.openSession();
		try {
			session.update("fitness.myMenuDel",num);
			return true;
		} catch(Exception e) {
			System.out.println("[fitness] myMenuDel error ... "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
	
	public List<Map> exerSort() {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = session.selectList("fitness.exerSort");
			return list;
		} catch(Exception e) {
			System.out.println("[fitness] exerSort error ... "+e.toString());
			return null;
		} finally {
			session.close();
		}
	}
	
	public List<Map> exerName(String sort) {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = session.selectList("fitness.exerName",sort);
			return list;
		} catch(Exception e) {
			System.out.println("[fitness] exerName error ... "+e.toString());
			return null;
		} finally {
			session.close();
		}
	}
	
	public int exerKcal(Map map) {
		SqlSession session = factory.openSession();
		try {
			int n = session.selectOne("fitness.exerKcal",map);
			return n;
		} catch(Exception e) {
			System.out.println("[fitness] exerKcal error ... "+e.toString());
			return -1;
		} finally {
			session.close();
		}
	}
	
	public boolean myExercise(Map map) {
		SqlSession session = factory.openSession();
		try {
			session.update("fitness.myExercise",map);
			return true;
		} catch(Exception e) {
			System.out.println("[fitness] myExercise error ... "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
	
	public int totalExer(String id) {
		SqlSession session = factory.openSession();
		try {
			int n = session.selectOne("fitness.totalExer",id);
			return n;
		} catch(Exception e) {
			System.out.println("[fitness] totalExer error ... "+e.toString());
			return 0;
		} finally {
			session.close();
		}
	}
	
	public List<Map> todayExer(String id) {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = session.selectList("fitness.todayExer",id);
			return list;
		} catch(Exception e) {
			System.out.println("[fitness] todayExer error ... "+e.toString());
			return null;
		} finally {
			session.close();
		}
	}
	
	public boolean myExerDel(int num) {
		SqlSession session = factory.openSession();
		try {
			session.update("fitness.myExerDel",num);
			return true;
		} catch(Exception e) {
			System.out.println("[fitness] myExerDel error ... "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
	
	public boolean myWeight(Map map) {
		SqlSession session = factory.openSession();
		try {
			session.insert("fitness.myWeight",map);
			return true;
		} catch(Exception e) {
			System.out.println("[fitness] myWeight error ... "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
	
	public List<Map> WeightGraph(String id) {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = session.selectList("fitness.WeightGraph",id);
			return list;
		} catch(Exception e) {
			System.out.println("[fitness] WeightGraph error ... "+e.toString());
			return null;
		} finally {
			session.close();
		}
	}
}
