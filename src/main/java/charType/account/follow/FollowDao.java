package charType.account.follow;

import java.util.Map;
import java.util.List;

import org.springframework.stereotype.Repository;

import charType.utils.common.dao.AbstractDAO;

@Repository("followDao")
public class FollowDao extends AbstractDAO {
	
	//1개 아이디의 팔로워 아이디 리스트 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> followerViewData(Map<String, Object> map)
		throws Exception {
		return (List<Map<String,Object>>) selectList("follow.followerViewData", map);
	}
	
	//1개 아이디의 팔로잉 아이디 리스트 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> followingViewData(Map<String, Object> map)
		throws Exception {
		return (List<Map<String,Object>>) selectList("follow.followingViewData", map);
	}
	
	//팔로우와 팔로잉 전체 갯수 가져오기
	@SuppressWarnings("unchecked")
	public Integer followExist(Map<String, Object> map)
		throws Exception {
		return (Integer) selectOne("follow.followExist", map);
	}
	
	//1개 아이디 값의 팔로우 수 가져오기 
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectfollowQuan(Map<String, Object> map)
		throws Exception {
		return (Map<String, Object>) selectOne("follow.selectfollowQuan", map);
	}
	
	//1개 아이디 값의 팔로잉 수 가져오기 
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectfollowingQuan(Map<String, Object> map)
		throws Exception {
		return (Map<String, Object>) selectOne("follow.selectfollowingQuan", map);
	}
		

	//팔로우 등록 
	public void followReg(Map<String, Object> map) throws Exception {
		insert("follow.followReg", map);
	}
	
	
	//팔로우 삭제
	public void followDel(Map<String, Object> map) throws Exception {
		delete("follow.followDel", map);
	}


}
