package charType.community.timeline;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import charType.account.profile.timeline.TimelineDAO;
import charType.utils.common.file.FileUtils;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "communityDAO")
	private CommunityDAO communityDAO;

	
	
	@Override
	public List<Map<String, Object>> selectListCommunityTimeline(Map<String, Object> map) throws Exception {
		return communityDAO.selectListCommunityTimeline(map); 
	}



	@Override
	public List<Map<String, Object>> communityStorySearchNick(Map<String, Object> map, HttpServletRequest request) throws Exception {
		return communityDAO.searchNickCommunityTimeline(map); 	
	}



	@Override
	public List<Map<String, Object>> selectPrivateCommunityTimeline(Map<String, Object> map) throws Exception {
		return communityDAO.selectPrivateListCommunityTimeline(map); 
	}

}
