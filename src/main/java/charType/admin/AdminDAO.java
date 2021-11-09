package charType.admin;

import java.util.Map;
import java.util.List;

import org.springframework.stereotype.Repository;

import charType.utils.common.dao.AbstractDAO;

@Repository("adminDao")
public class AdminDAO extends AbstractDAO {
	
	//모든 유저의 가입 정보 가져오기
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> alluserData(Map<String, Object> map)
			throws Exception {
			return (List<Map<String,Object>>) selectList("admin.alluserData", map);
		}

}
