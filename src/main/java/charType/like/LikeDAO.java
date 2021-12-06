package charType.like;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import charType.cons.listMbti;
import charType.utils.common.dao.AbstractDAO;

@Repository("likeDAO")
public class LikeDAO extends AbstractDAO{
	
	//게시글 좋아요 리스트 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardLike(Map<String, Object> map)
		throws Exception {
		return (List<Map<String,Object>>) selectList("like.selectBoardLike", map);
	}
		
	//게시글 좋아요 유무 확인
	public Integer selectTimelineLikeCheck(Map<String, Object> map)
		throws Exception{
		return (Integer) selectOne("like.selectTimelineLikeCheck", map);
	}
	
	//좋아요 추가 
	public void insertTimelineLike(Map<String, Object> map)
		throws Exception{
		
		insert("like.insertTimelineLike", map);
	}
	
	//좋아요 제거
	public void deleteTimelineLike(Map<String, Object> map)
		throws Exception {
		
		delete("like.deleteTimelineLike", map);
	}

	public  List<Map<String, Object>> myLikelist(Map<String, Object> map)
		throws Exception{
		return (List<Map<String,Object>>) selectList("like.myLikelist", map);
		
	}

	
}



