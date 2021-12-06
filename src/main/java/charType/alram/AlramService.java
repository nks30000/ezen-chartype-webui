package charType.alram;

import java.util.List;
import java.util.Map;

public interface AlramService {

	
	Map<String, Object> alramCheck(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> alramLoad(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectAlramOne(Map<String, Object> map) throws Exception;
	
	void regAlram(Map<String, Object> map) throws Exception;
	
	void updateRegIdAlram(Map<String, Object> map) throws Exception;
	
	void readAlram(Map<String, Object> map)throws Exception;

	List<Map<String, Object>> alramFollowLoad(Map<String, Object> map)throws Exception;
	
	List<Map<String, Object>> selectOne(Map<String, Object> map)throws Exception;

	

	

	
}

