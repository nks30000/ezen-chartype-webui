package charType.popup;

import org.springframework.stereotype.Service;

import charType.popup.PopupService;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Service("popupService")
public class PopupServiceImpl implements PopupService{
	
	@Resource(name="popupDAO")
	private PopupDAO popupDAO;
	
	
	//팝업 게시글 가져오기
	@Override
	public Map<String, Object> selectOneCommunityTimeline(Map<String, Object> map)
			throws Exception {
		//프로필 이미지 파일명을 Map에 같이 담음
		Map<String, Object> resultMap = popupDAO.selectOneCommunutyTimeline(map);
		Map<String, Object> ProfImgMap = popupDAO.selectOneCommunityTimelineProfImg(map);
		String Profimg = (String)ProfImgMap.get("PROF_IMG");
		resultMap.put("PROF_IMG", Profimg);
		
		return resultMap;
	}
	
	//팝업 게시글 이미지 가져오기
	@Override 
	public List<Map<String,Object>> selectOneCommunityTimelineImage(Map<String, Object> map)
			throws Exception {
		return popupDAO.selectOneCommunityTimelineImage(map);
	}
	
	//댓글 입력하기
	@Override
	public void writeComment(Map<String, Object> map) throws Exception{
		popupDAO.writeComment(map);
	}
	
	//댓글 리스트 가져오기
	@Override
	public List<Map<String, Object>> selectComment(Map<String, Object> map)
			throws Exception{
		
		return popupDAO.selectComment(map);
	}
	
	@Override
	public Map<String, Object> selectCntComment(Map<String, Object> map)
			throws Exception{
		return popupDAO.selectCntComment(map);
	}
	
	//댓글 삭제하기
	@Override
	public void deleteComment(Map<String, Object> map) throws Exception{
		popupDAO.deleteComment(map);
	}
	
	@Override
	public void modifyComment(Map<String, Object> map) throws Exception {
		popupDAO.modifyComment(map);
	}

}
