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

	public void writeAccountTimeline(Map<String, Object> map) {
		insert("timeline.writeAccountTimeline", map);
		 }

/*	public void delAccountTimeline(Map<String, Object> map) {
		delete("timeline.delAccountTimeline", map);
		
	}
	*/
	public void delAccountTimeline(int num) {
		delete("timeline.delAccountTimeline", num);
		
	}

	public void delTimelineFile(int num) {
		delete("timeline.delTimelineFile", num);
	}
	
	public void delComment(int num) {
		delete("timeline.delComment", num);
	}

	public void uploadTimelineFile(Map<String, Object> map) throws Exception{
		insert("timeline.uploadTimelineFile", map);
	}
	

}
