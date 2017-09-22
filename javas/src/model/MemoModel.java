package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.catalina.Session;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemoModel {
	
	@Autowired
	DataSource ds;
	@Autowired
	SqlSessionFactory factory;
	
	public boolean send(Map<String,String> map) {
		boolean flag = false;
		try {
			SqlSession session =factory.openSession();
			try {
				System.out.println(map);
				session.insert("memo.send", map);
				flag = true;
			}catch(Exception e){
				session.rollback();
				System.out.println("[JDBC] Exception MemoModel.send : " + e.getMessage());
			}finally {
				session.close();
			}
		}catch(Exception i) {
		}
		return flag;
	}
	
	
	public List<Map<String, String>> list(String id) {
		List<Map<String, String>> list = new ArrayList<>();
		try {
			SqlSession session = factory.openSession();
			try {
				list = session.selectList("memo.list", id);
			}catch(Exception e) {
				System.out.println("[JDBC Exception] MemoModel.list() : " + e.getMessage());
			}finally {
				session.close();
			}
		}catch(Exception i) {
		}
		return list;
	}
	
	public List<Map<String, String>> mylist(String id) {
		List<Map<String, String>> list = new ArrayList<>();
		try {
			SqlSession session = factory.openSession();
			try {
				list = session.selectList("memo.mylist", id);
			}catch(Exception e) {
				System.out.println("[JDBC Exception] MemoModel.mylist() : " + e.getMessage());
			}finally {
				session.close();
			}
		}catch(Exception i) {
		}
		return list;
	}
	
	public Map<String, Object> memoDetail(int num) {
		Map<String, Object> map = new HashMap<>();
		SqlSession session = factory.openSession();
		try {
			System.out.println("num"+num);		
			map = session.selectOne("memo.detail", +num);
		} catch (Exception e) {
			System.out.println("[JDBC] MemoModelException boardDetail : " + e.getMessage());
		} finally {
			session.close();
		}

		return map;
	}

	

	public int countAll(String id) {
		int c = 0;
		try {
			SqlSession session = factory.openSession();
			try {
				c = session.selectOne("memo.countAll", id);
				
			}catch(Exception e) {
				System.out.println("[JDBC Exception] MemoModel.countAll() : " + e.getMessage());
			}finally {
				session.close();
			}
		}catch(Exception i) {
			
		}
		return c;
	}
	
	public int myCount(String id) {
		int c = 0;
		try {
			SqlSession session = factory.openSession();
			try {
				c = session.selectOne("memo.myCount", id);
			}catch(Exception e) {
				System.out.println("[JDBC Exception] MemoModel.myCount() : " + e.getMessage());
			}finally {
				session.close();
			}
		}catch(Exception i) {
			
		}
		return c;
	}
	
	public void delete(String[] num, String id ) {
		SqlSession session = factory.openSession();
		Map <String, Object> map = new HashMap<String, Object>();
		map.put("arr", num);
		map.put("id", id);
		try {
				session.delete("memo.delete", map);
		}catch(Exception e) {
			session.rollback();
			System.out.println("[JDBC] Exception MemoModel.delete" + e.getMessage());
		}finally {
			session.close();
		}
	}
	
}