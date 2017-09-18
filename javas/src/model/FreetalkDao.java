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
			List<Map> list = session.selectList("freetalk.getTalks", map);
			return list;
		} catch (Exception e) {
			System.out.println("[freetalk] allTalks error ... " + e.toString());
			return null;
		} finally {
			session.close();
		}
	}

	public boolean addNew(Map map) {
		SqlSession session = factory.openSession();
		try {
			session.insert("freetalk.addNew", map);
			return true;
		} catch (Exception e) {
			System.out.println("[freetalk] addNew error ... " + e.toString());
			return false;
		} finally {
			session.close();
		}
	}

	public Map oneTalks(int num) {
		SqlSession session = factory.openSession();
		try {
			Map map = session.selectOne("freetalk.getOne", num);
			return map;
		} catch (Exception e) {
			System.out.println("[freetalk] oneTalks error ... " + e.toString());
			return null;
		} finally {
			session.close();
		}
	}

	public boolean addComment(Map map) {
		SqlSession session = factory.openSession();
		try {
			session.insert("freetalk.addComment", map);
			return true;
		} catch (Exception e) {
			System.out.println("[freetalk] addComment error ... " + e.toString());
			return false;
		} finally {
			session.close();
		}
	}

	public List<Map> getComment(int num) {
		SqlSession session = factory.openSession();
		try {
			List<Map> list = session.selectList("freetalk.getComment", num);
			return list;
		} catch (Exception e) {
			System.out.println("[freetalk] getComment error ... " + e.toString());
			return null;
		} finally {
			session.close();
		}
	}

	public int countAll(Map map) {
		SqlSession session = factory.openSession();
		try {
			int n = session.selectOne("freetalk.countAll", map);
			return n;
		} catch (Exception e) {
			System.out.println("[freetalk] countAll error ... " + e.toString());
			return -1;
		} finally {
			session.close();
		}
	}

	public boolean loveUp(Map map) {
		SqlSession session = factory.openSession();
		try {
			int n = session.insert("freetalk.loveUp", map);
			try {
				if (n == 1) {
					int num = Integer.parseInt((String) map.get("num"));
					session.update("freetalk.recommend", num);
				}
			} catch (Exception e) {
				System.out.println("[freetalk] recommendUp error ... " + e.toString());
			}
			return true;
		} catch (Exception e) {
			System.out.println("[freetalk] loveUp error ... " + e.toString());
			return false;
		} finally {
			session.close();
		}
	}

	public boolean talkDel(int num) {
		SqlSession session = factory.openSession();
		try {
			session.delete("freetalk.talkDel", num);
			return true;
		} catch (Exception e) {
			System.out.println("[freetalk] talkDel error ... " + e.toString());
			return false;
		} finally {
			session.close();
		}
	}

	public int loveCnt(int num) {
		SqlSession session = factory.openSession();
		try {
			int n = session.selectOne("freetalk.loveCnt", num);
			return n;
		} catch (Exception e) {
			System.out.println("[freetalk] loveCnt error ... " + e.toString());
			return -1;
		} finally {
			session.close();
		}
	}

	public String loveId(Map map) {
		SqlSession session = factory.openSession();
		try {
			String s = session.selectOne("freetalk.loveId", map);
			return s;
		} catch (Exception e) {
			System.out.println("[freetalk] loveId error ... " + e.toString());
			return null;
		} finally {
			session.close();
		}
	}

	public boolean commDel(int num) {
		SqlSession session = factory.openSession();
		try {
			session.delete("freetalk.commDel", num);
			return true;
		} catch (Exception e) {
			System.out.println("[freetalk] commDel error ... " + e.toString());
			return false;
		} finally {
			session.close();
		}
	}

	public Map commId(int num) {
		SqlSession session = factory.openSession();
		try {
			Map map = session.selectOne("freetalk.commId", num);
			return map;
		} catch (Exception e) {
			System.out.println("[freetalk] commId error ... " + e.toString());
			return null;
		} finally {
			session.close();
		}
	}

}
