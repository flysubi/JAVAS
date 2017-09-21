package model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreDao {

	@Autowired
	SqlSessionFactory factory;
	
	public boolean itemBuy(Map map) {
		SqlSession session = factory.openSession();
		try {
			int i = session.update("store.itemBuy",map); 
			return i == 1;
		} catch(Exception e) {
			System.out.println("[StoreDao itemBuy error ... ] "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
	
	public boolean pointDown(Map map) {
		SqlSession session = factory.openSession();
		try {
			int i = session.insert("store.pointDown",map); 
			return i == 1;
		} catch(Exception e) {
			System.out.println("[StoreDao pointDown error ... ] "+e.toString());
			return false;
		} finally {
			session.close();
		}
	}
	
	public Map itemInfo(String id) {
		SqlSession session = factory.openSession();
		try {
			Map map = session.selectOne("store.itemInfo",id); 
			return map;
		} catch(Exception e) {
			System.out.println("[StoreDao itemInfo error ... ] "+e.toString());
			return null;
		} finally {
			session.close();
		}
	}
}
