package charType.Like;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import charType.utils.common.dao.AbstractDAO;

@Repository("likeDao")
public class LikeDao extends AbstractDAO{
	
	public void likeReg(Map<String, Object> map)throws Exception{
		insert("like.likeReg", map);
	}
	
	public void likeDel(Map<String, Object> map)throws Exception{
		delete("like.likeDel", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> likeCount(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>) selectList("like.likeCount", map);
	}
	
	

	
}

