package model;


import java.util.HashMap;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WeatherDao {

	@Autowired
	SqlSessionFactory factory;

	public Map<String, Object> findcode(int code) {
		SqlSession session = factory.openSession();
		try {
			HashMap<String, Object> map = session.selectOne("weather.findcode", code);
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
}
