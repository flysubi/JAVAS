package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class QuestionModel {
	@Autowired
	SqlSessionFactory factory;

	public void postsUpload(Map<String, String> map) {
		Map<String, String> writeData = map;
		SqlSession session = factory.openSession();
		try {
			session.insert("quesiton.addNew", writeData);
		} catch (Exception e) {
			System.out.println("[JDBC] QuestionBoardModelException postsUpload : " + e.getMessage());
		} finally {
			session.close();
		}
	}

	public List<Map<String, String>> boardList() {
		List<Map<String, String>> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("question.getAllTalks");
		} catch (Exception e) {
			System.out.println("[JDBC] QuestionBoaordModelException boardList : " + e.getMessage());
		} finally {
			session.close();
		}

		return list;
	}

	public Map<String, String> boardDetail(String num) {
		Map<String, String> map = new HashMap<>();
		SqlSession session = factory.openSession();
		try {
			map = session.selectOne("question.getOne", num);
		} catch (Exception e) {
			System.out.println("[JDBC] QuestionBoardBoardModelException boardDetail : " + e.getMessage());
		} finally {
			session.close();
		}

		return map;
	}

	public void boardReply(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		try {
			session.update("question.reviseStep", map);
			session.insert("question.addReply", map);
		} catch (Exception e) {
			System.out.println("[JDBC] QuestionBoardModelException boardreviseStep : " + e.getMessage());
		} finally {
			session.close();
		}
	}
	
	public boolean boardLike(Map<String, String> map) {
		boolean flag = false;
		SqlSession session = factory.openSession();
		try {
			session.insert("question.likechk", map);
			session.update("quesiton.likeUp", map);
			flag = true;
		}catch(Exception e) {
			System.out.println("[JDBC] QuesitonBoardModelException boardLike : " + e.getMessage());
		}finally {
			session.close();
		}
		return flag;
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


