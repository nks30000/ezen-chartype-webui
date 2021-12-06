package charType.alram;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import charType.utils.common.dao.AbstractDAO;


@Repository("alramDAO")
public class AlramDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> alramCheck(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("alram.alramCheck", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> alramLoad(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>) selectList("alram.alramLoad", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAlramOne(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("alram.selectAlramOne", map);
	}
	
	public void regAlram(Map<String, Object> map) throws Exception{
		insert("alram.regAlram", map);
	}
	
	public void updateRegIdAlram(Map<String, Object> map) throws Exception{
		update("alram.updateRegIdAlram", map);
	}
	
	public void readAlram(Map<String, Object> map)throws Exception{
		update("alram.readAlram", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> alramFollowLoad(Map<String, Object> map) {
		return (List<Map<String,Object>>) selectList("alram.alramFollowLoad", map);	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOne(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("alram.selectOne", map);
	}

	
	
	
	
	
}
	
	
	
	
	
	


