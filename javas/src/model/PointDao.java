package model;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointDao {

	@Autowired
	SqlSessionFactory factory;
	
	public boolean pointUp(Map map) {
		SqlSession session = factory.openSession();
		System.out.println();
		try {			
			session.insert("point.pointUp",map);
			return true;
		}catch(Exception e) {
			System.out.println("[pointDao pointUp error ... ]"+e.toString());
			return false;
		}finally {
			session.close();
		}
	}
	
	public boolean commPointUp(Map map) {
		SqlSession session = factory.openSession();
		try {
			int n = session.insert("point.commPointUp",map);
			try {
				if(n ==1) {
					session.insert("point.pointUp",map);
					return false;
				}
				
			}catch(Exception e) {
				System.out.println("[pointDao commPointUp2222 error ... ]"+e.toString());	
			}
			return true;
		}catch(Exception e) {
			System.out.println("[pointDao commPointUp error ... ]"+e.toString());
			return false;
		}finally {
			session.close();
		}
	}
	
	public Map getPoint(String id) {
		SqlSession session = factory.openSession();
		try {
			Map map = session.selectOne("point.getPoint",id);
			return map;
		}catch(Exception e) {
			System.out.println("[pointDao getPoint error ... ]"+e.toString());
			return null;
		}finally {
			session.close();
		}
	}
	
	public int loginCk(Map map) {
		SqlSession session = factory.openSession();
		try {
			int n = session.selectOne("point.loginCk",map);
			return n;
		}catch(Exception e) {
			System.out.println("[pointDao loginCk error ... ]"+e.toString());
			return -1;
		}finally {
			session.close();
		}
	}
}
