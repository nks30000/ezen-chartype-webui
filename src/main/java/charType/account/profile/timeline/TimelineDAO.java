package charType.account.profile.timeline;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import charType.utils.common.dao.AbstractDAO;

@Repository("timelineDAO")
public class TimelineDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAccountTimeline(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("timeline.selectAccountTimeline", map);
	}

}
