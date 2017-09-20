package model;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AssetDao {

	@Autowired
	SqlSessionFactory factory;

	public boolean addAsset(List<Map<String, Object>> list) {
		SqlSession session = factory.openSession();
		try {
			session.insert("asset.addAsset", list);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			session.close();
		}
	}
	
	public boolean addAsset2(List<Map<String, Object>> list) {
		SqlSession session = factory.openSession();
		try {
			session.insert("asset.addAsset2", list);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			session.close();
		}
	}
	
	public boolean updateAsset(List<HashMap<String, Object>> list) {
		SqlSession session = factory.openSession();
		
		try {
			for(HashMap<String, Object> map : list) {
				session.insert("asset.updateAsset", map);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			session.close();
		}
	}
	
	public boolean deleteAsset(int n) {
		SqlSession session = factory.openSession();
		
		try {
			session.insert("asset.deleteAsset", n);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			session.close();
		}
	}
	
	public List<Map<String, Object>> getAsset(Map map) {
		SqlSession session = factory.openSession();
		try {
			List<Map<String, Object>> list = session.selectList("asset.getAsset", map);
			return list;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}
	public List<Map<String, Object>> getAssetI(Map map) {
		SqlSession session = factory.openSession();
		try {
			List<Map<String, Object>> list = session.selectList("asset.getAssetI", map);
			return list;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}
	
	public List<Map<String, Object>> getAssetE(Map map) {
		SqlSession session = factory.openSession();
		try {
			List<Map<String, Object>> list = session.selectList("asset.getAssetE", map);
			return list;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}
}
