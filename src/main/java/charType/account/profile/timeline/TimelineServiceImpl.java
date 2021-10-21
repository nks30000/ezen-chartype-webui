package charType.account.profile.timeline;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service; 


@Service("timelineService")
public class TimelineServiceImpl implements TimelineService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="timelineDAO")
	private TimelineDAO timelineDAO;

	@Override
	public List<Map<String, Object>> selectAccountTimeline(Map<String, Object> map) throws Exception {
		
		return timelineDAO.selectAccountTimeline(map);
	}
	

}
