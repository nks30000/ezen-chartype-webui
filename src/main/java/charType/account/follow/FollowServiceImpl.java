package charType.account.follow;

import org.springframework.stereotype.Service;

import charType.account.follow.FollowService;
import charType.account.follow.FollowDao;
import charType.member.MemberDao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Service("followService")
public class FollowServiceImpl implements FollowService {

	@Resource(name="followDao")
	private FollowDao followDao;
	

	@Override
	public List<Map<String, Object>> followerViewData(Map<String, Object> map) throws Exception {
		return followDao.followerViewData(map);
		
	}

	@Override
	public List<Map<String, Object>> followingViewData(Map<String, Object> map) throws Exception {
		return followDao.followingViewData(map);
	}

	@Override
	public Integer followExist(Map<String, Object> map) throws Exception {
		return followDao.followExist(map);
	}

	@Override
	public Map<String, Object> selectfollowQuan(Map<String, Object> map) throws Exception {
		return followDao.selectfollowQuan(map);
	}

	@Override
	public Map<String, Object> selectfollowingQuan(Map<String, Object> map) throws Exception {
		return followDao.selectfollowingQuan(map);
	}

	@Override
	public void followReg(Map<String, Object> map) throws Exception {
		followDao.followReg(map);
		
	}

	@Override
	public void followDel(Map<String, Object> map) throws Exception {
		followDao.followDel(map);
		
	}
}
