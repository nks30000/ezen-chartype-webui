package charType.Like;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import charType.Like.LikeService;

@Service("likeService")
public class LikeServiceImpl implements LikeService {
	
	@Resource(name="likeDao")
	private LikeDao likeDao;

	@Override
	public void likeReg(Map<String, Object> map) throws Exception {
		likeDao.likeReg(map);
		
	}

	@Override
	public void likeDel(Map<String, Object> map) throws Exception {
		likeDao.likeDel(map);
		
	}

	@Override
	public List<Map<String, Object>> likeCount(Map<String, Object> map) throws Exception {
		
		return likeDao.likeCount(map);
	}

	

	
	
	


	
	
}
