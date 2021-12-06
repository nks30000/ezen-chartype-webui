package charType.like;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import charType.like.LikeService;

@Service("likeService")
public class LikeServiceImpl implements LikeService {

	@Resource(name="likeDAO")
	private LikeDAO likeDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardLike(Map<String, Object> map)
			throws Exception{		
		return  (List<Map<String, Object>>) likeDAO.selectBoardLike(map);		
	}
	
	@Override
	public Integer selectTimelineLikeCheck(Map<String, Object> map)
			throws Exception{
		return likeDAO.selectTimelineLikeCheck(map);
	}
	
	@Override
	public void insertTimelineLike(Map<String, Object> map)
			throws Exception{
		likeDAO.insertTimelineLike(map);
	}
	
	@Override
	public void deleteTimelineLike(Map<String, Object> map)
			throws Exception{
		likeDAO.deleteTimelineLike(map);
	}

	@Override
	public List<Map<String, Object>> myLikelist(Map<String, Object> map) 
			throws Exception {
		return likeDAO.myLikelist(map);
	}

	
}
