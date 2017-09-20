package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	public List<Map<String, Object>> member() {
		List<Map<String, Object>> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("admin.member");			
		} catch (Exception e) {
			System.out.println("[JDBC] AdminDao Exception statics : " + e.getMessage());
		} finally {
			session.close();
		}

		return list;
	}
	
	public List<Map> getPoint(String id) {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = session.selectList("admin.point", id);
			return list;
		} catch (Exception e) {
			System.out.println("[admin] point error ... " + e.toString());
			return null;
		} finally {
			session.close();
		}
	}
	
	public boolean pointDel(int num) {
		SqlSession session = factory.openSession();
		try {
			session.delete("admin.pointDel", num);
			return true;
		} catch (Exception e) {
			System.out.println("[admin] pointDel error ... " + e.toString());
			return false;
		} finally {
			session.close();
		}
	}

	
}
	
