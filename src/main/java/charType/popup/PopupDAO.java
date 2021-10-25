package charType.popup;

import java.util.Map;
import java.util.List;

import org.springframework.stereotype.Repository;

import charType.utils.common.dao.AbstractDAO;

@Repository("popupDAO")
public class PopupDAO extends AbstractDAO{
	
	//팝업 게시글 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneCommunutyTimeline(Map<String, Object> map)
		throws Exception {
		return (Map<String, Object>) selectOne("popup.selectOneCommunutyTimeline", map);
	}
	
	//팝업 게시글 이미지 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneCommunityTimelineImage(Map<String, Object> map)
		throws Exception {
		return (Map<String,Object>) selectOne("popup.selectOneCommunityTimelineImage", map);
	}
	
	//댓글 입력하기
	public void writeComment(Map<String,Object> map) throws Exception {
		insert("popup.writeComment", map );
	}
	
	//댓글 리스트 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectComment(Map<String, Object> map)
		throws Exception {
		
		return (List<Map<String,Object>>) selectList("popup.selectComment", map);
	}
	
	//댓글 삭제하기
	public void deleteComment(Map<String, Object> map) throws Exception {
		
		delete("popup.deleteComment", map);
	}


}
