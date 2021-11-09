package charType.admin;

import java.util.List;
import java.util.Map;


public interface AdminService {
		
		List<Map<String, Object>> alluserData(Map<String, Object> map)
					throws Exception;

}