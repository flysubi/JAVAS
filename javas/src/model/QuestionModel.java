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
public class QuestionModel {
	@Autowired
	SqlSessionFactory factory;

	public void postsUpload(Map<String, Object> map) {
		Map<String, Object> writeData = map;
		SqlSession session = factory.openSession();
		try {
			session.insert("question.addNew", map);
		} catch (Exception e) {
			System.out.println("[JDBC] QuestionBoardModelException postsUpload : " + e.getMessage());
		} finally {
			session.close();
		}
	}

	public List<Map<String, Object>> boardList(Map map) {
		List<Map<String, Object>> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("question.getAllTalks", map);
			System.out.println(list);
		} catch (Exception e) {
			System.out.println("[JDBC] QuestionBoaordModelException boardList : " + e.getMessage());
		} finally {
			session.close();
		}

		return list;
	}
	
	public int countAll(Map map) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.selectOne("question,countAll", map.get("num"));
			System.out.println(n);
		}catch(Exception e) {
			System.out.println("[JDBC] QuestionBoaordModelException countAllt : " + e.getMessage());
		}finally {
			session.close();
		}
		return n;
	}

	public Map<String, String> boardDetail(Map map) {
		Map<String, String> map1 = new HashMap<>();
		SqlSession session = factory.openSession();
		try {
			if(map.get("like") != null) {
				session.update("question.count", map);
			}			
			map1 = session.selectOne("question.getOne", map.get("num"));
			System.out.println(".."+map1);
		} catch (Exception e) {
			System.out.println("[JDBC] QuestionBoardBoardModelException boardDetail : " + e.getMessage());
		} finally {
			session.close();
		}

		return map1;
	}

	public void boardReply(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		System.out.println("[boardReply.Model]:"+map );
		try {
			session.update("question.reviseStep", map);
			session.insert("question.addReply", map);
		} catch (Exception e) {
			System.out.println("[JDBC] QuestionBoardModelException boardreviseStep : " + e.getMessage());
		} finally {
			session.close();
		}
	}	
	

	public List<Map<String, String>> boardSearch(Map<String, List<String>> map){
		SqlSession session = factory.openSession();
		List<Map<String, String>> list = new ArrayList<>();
		try {
			list = session.selectList("freeboard.search", map);
			
		}catch(Exception e){
			System.out.println("[JDBC] FreeBoardModelException boardSearch : " + e.getMessage());
		}finally {
			session.close();
		}
		
		return list;
	}
	
	public List<Map<String, Object>> replyAddList(Map<String, Object> map){
		SqlSession session = factory.openSession();
		List<Map<String, Object>> list = new ArrayList<>();
		try {
			session.insert("replyAdd", map);
			list = session.selectList("replyList", map);
		}catch(Exception e) {
			session.rollback();
			System.out.println("[JDBC] Exception FreeBoardModelException replyAddList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	} 
	
	public List<Map<String, Object>> replyGetList(Map<String, Object> map){
		SqlSession session = factory.openSession();
		List<Map<String, Object>> list = new ArrayList<>();
		try {
			list = session.selectList("replyList", map);
		}catch(Exception e) {
			System.out.println("[JDBC] Exception FreeBoardModelException replygetList");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	} 
	
	
}


