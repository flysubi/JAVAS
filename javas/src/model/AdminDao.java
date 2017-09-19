package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminDao {

	@Autowired
	SqlSessionFactory factory;
	
	public boolean login(Map map) {
		SqlSession session = factory.openSession();
		try {
			System.out.println("login : " + map);
			HashMap rst = session.selectOne("admin.login", map);
			
			return rst != null;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		} finally {
			session.close();
		}
		
	}

	
	
	public List<Map<String, Object>> statics() {
		List<Map<String, Object>> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("admin.infoStatic");			
		} catch (Exception e) {
			System.out.println("[JDBC] AdminDao Exception statics : " + e.getMessage());
		} finally {
			session.close();
		}

		return list;
	}
	
	public int infocount() {
		int c = 0;
		try {
			SqlSession session = factory.openSession();
			try {
				c = session.selectOne("admin.infoCount");
				
			}catch(Exception e) {
				System.out.println("[JDBC Exception] AdminDao.infoCount() : " + e.getMessage());
			}finally {
				session.close();
			}
		}catch(Exception i) {
			
		}
		return c;
	}
	
}
