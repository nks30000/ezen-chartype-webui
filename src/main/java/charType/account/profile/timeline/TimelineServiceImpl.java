package charType.account.profile.timeline;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import charType.utils.common.file.FileUtils;

@Service("timelineService")
public class TimelineServiceImpl implements TimelineService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "timelineDAO")
	private TimelineDAO timelineDAO;

	@Override
	public List<Map<String, Object>> selectAccountTimeline(Map<String, Object> map, HttpServletRequest request) throws Exception {

		
		
		 return timelineDAO.selectAccountTimeline(map, request); 
	}

	@Override
	public void writeAccountTimeline(Map<String, Object> map, HttpServletRequest request) throws Exception {
		timelineDAO.writeAccountTimeline(map);
		
		 List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		 for (int i = 0, size = list.size(); i < size; i++) {
		 timelineDAO.uploadTimelineFile(list.get(i)); }
		
		
		/*
		 * MultipartHttpServletRequest multipartHttpServletRequest =
		 * (MultipartHttpServletRequest)request; Iterator<String> iterator =
		 * multipartHttpServletRequest.getFileNames(); MultipartFile multipartFile =
		 * null; while(iterator.hasNext()){ multipartFile =
		 * multipartHttpServletRequest.getFile(iterator.next());
		 * if(multipartFile.isEmpty() == false){
		 * log.debug("------------- file start -------------");
		 * log.debug("name : "+multipartFile.getName());
		 * log.debug("filename : "+multipartFile.getOriginalFilename());
		 * log.debug("size : "+multipartFile.getSize());
		 * log.debug("-------------- file end --------------\n"); } }
		 */
		 
		 
	}

	/*
	 * @Override public void delAccountTimeline(Map<String, Object> map) throws
	 * Exception { timelineDAO.delAccountTimeline(map);
	 * 
	 * }
	 */

	@Override
	public void delAccountTimeline(int num) throws Exception {
		timelineDAO.delAccountTimeline(num);

	}

	@Override
	public void delTimelineFile(int num) throws Exception {
		timelineDAO.delTimelineFile(num);

	}

	@Override
	public void delComment(int num) throws Exception {
		timelineDAO.delComment(num);

	}

	@Override
	public List<Map<String, Object>> selectAccountTimelineLife(Map<String, Object> map) throws Exception {
		return timelineDAO.selectAccountTimelineLike(map); 
	}

	@Override
	public List<Map<String, Object>> selectAccountTimelineFav(Map<String, Object> map) throws Exception {
		return timelineDAO.selectAccountTimelineFav(map); 
	}

	@Override
	public List<Map<String, Object>> selectAccountTimelineShop(Map<String, Object> map) throws Exception {
		return timelineDAO.selectAccountTimelineShop(map); 
	}

	@Override
	public List<Map<String, Object>> selectAccountTimelineStyle(Map<String, Object> map) throws Exception {
		return timelineDAO.selectAccountTimelineStyle(map); 
	}

	@Override
	public Integer privateCheck(Map<String, Object> map) throws Exception {
		return timelineDAO.privateCheck(map);
	}



}
