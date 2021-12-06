package charType.alram;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import charType.alram.AlramService;

@Service("alramService")
public class AlramServiceImpl implements AlramService {

	@Resource(name="alramDAO")
	private AlramDAO alramDAO;
	
	@Override
	public Map<String, Object> alramCheck(Map<String, Object> map) throws Exception {
		return alramDAO.alramCheck(map);
	}

	@Override
	public List<Map<String, Object>> alramLoad(Map<String, Object> map) throws Exception {
		return alramDAO.alramLoad(map);
	}

	@Override
	public List<Map<String, Object>> selectAlramOne(Map<String, Object> map) throws Exception {
		return alramDAO.selectAlramOne(map);
	}

	@Override
	public void regAlram(Map<String, Object> map) throws Exception {
		alramDAO.regAlram(map);
	}

	@Override
	public void updateRegIdAlram(Map<String, Object> map) throws Exception {
		alramDAO.updateRegIdAlram(map);
	}

	@Override
	public void readAlram(Map<String, Object> map) throws Exception {
		alramDAO.readAlram(map);
	}

	@Override
	public List<Map<String, Object>> alramFollowLoad(Map<String, Object> map) throws Exception {
		return alramDAO.alramFollowLoad(map);
	}

	@Override
	public List<Map<String, Object>> selectOne(Map<String, Object> map) throws Exception {
		return alramDAO.selectOne(map);
	}
	
	

	
}

