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
			session.insert("question.addNew", writeData);
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
			n = session.selectOne("question.countAll", map.get("num"));
		}catch(Exception e) {
			System.out.println("[JDBC] QuestionBoaordModelException countAllt : " + e.getMessage());
		}finally {
			session.close();
		}
		return n;
	}

	public Map<String, Object> boardDetail(Map map) {
		Map<String, Object> map1 = new HashMap<>();
		SqlSession session = factory.openSession();
		try {
			if(map.get("like") != null) {
				session.update("question.count", map);
			}			
			map1 = session.selectOne("question.getOne", map.get("num"));
		} catch (Exception e) {
			System.out.println("[JDBC] QuestionBoardBoardModelException boardDetail : " + e.getMessage());
		} finally {
			session.close();
		}

		return map1;
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
	
	
	public int boardDel(int num) {
		System.out.println(num);
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.delete("question.boardDel",num);
			
		} catch(Exception e) {
			System.out.println("[JDBC] Exception QuestionBoradModelException boardDel"+toString());;
			 
		} finally {
			session.close();
		}
		return n;
	}
	
}


