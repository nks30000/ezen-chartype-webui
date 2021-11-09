package charType.community.timeline;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import charType.utils.common.dao.AbstractDAO;

@Repository("communityDAO")
public class CommunityDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectListCommunityTimeline(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("community.selectListCommunityTimeline", map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchNickCommunityTimeline(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("community.selectNickCommunityTimeline", map);
		
	}
}
