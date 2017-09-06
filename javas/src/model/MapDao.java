package model;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
public class MapDao {
	
	@Autowired
	SqlSessionFactory factory;
	
	public int myMap(Map map) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.insert("map.myMap", map);
		}catch(Exception e) {
			System.out.println("[map] myMap error ... "+e.toString());
		}finally {
			session.close();
		}
		return n;
	}
	
}
