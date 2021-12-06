package charType.community.recomFriend;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import charType.account.follow.FollowService;
import charType.account.profile.timeline.TimelineService;
import charType.cons.listMbti;
import charType.member.MemberService;
import charType.utils.common.mapper.CommandMap;

@Controller
@RequestMapping(value="/recom")
public class RecomFriendController {
	
	@Resource(name="timelineService") 
	private TimelineService timelineService; 
	
	@Resource(name="recomFriendService") 
	private RecomFriendService recomFriendService; 
	
	@Resource(name="followService") 
	private FollowService followService; 
	
	@Resource(name = "memberService")
	private MemberService memberService;

	
	
	@RequestMapping(value="/memberlist/{mId}") 
	public ModelAndView recomList(CommandMap commandMap, HttpServletRequest request, @PathVariable String mId) throws Exception{
		ModelAndView mv = new ModelAndView("/front/community/mbti/mbtilist");
		
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("session_mem_id");
		
		//셀렉트박스 mbti선택하기 
		String[] mbtiList = listMbti.MBTI;
		mv.addObject("mbtiList", mbtiList);
		

		
		//mbti와 그 사람 최근 글 가져오기
		commandMap.put("ID", userId);
		List<Map<String,Object>> timelinelist = timelineService.selectAccountTimeline(commandMap.getMap(), request);
		commandMap.put("timelinelist", timelinelist);
		mv.addObject("ID", userId);
	
		commandMap.put("mbti", mId);
		mv.addObject("mbti", mId);
		
		
		
		/*
		 * String board_num = (String) commandMap.get("BOARD_NUM");
		 * commandMap.put("board_num", board_num); mv.addObject("board_num", board_num);
		 */
		
		
		
		
		//팔로우 유무 체크		
		List<Map<String, Object>> recomList = recomFriendService.recomFriend(commandMap.getMap());
		mv.addObject("recomList", recomList);
		
		int index = 0;
		System.out.println("userId:"+userId);
		for(Map<String, Object> row : recomList) {
			String rowId = (String) row.get("ID");
			System.out.println("rowId: "+rowId);
			
			CommandMap rowMap = new CommandMap();
			rowMap.put("follow_id", rowId );
			rowMap.put("following_id", userId  );
			int rowFollowCnt = followService.followExist(rowMap.getMap());
			row.put("rowFollowCnt", rowFollowCnt);
			recomList.set(index, row);
			index++; 
		}
		
		//상위에 recomlist에서 값 가져와서 랜덤으로 5개 값 뿌려주기
		 List<Map<String, Object>> loveList = new ArrayList<Map<String, Object>>();
		
		//배열크기 정의
        int FNumber[] = new int [recomList.size()];
               
        //랜덤함수 정의
        Random random = new Random();
        
        //로또숫자 범의 (min, max 정의)
        int min = 1;
		int max = recomList.size();
 
    
        //for문 돌려서 recomList의 랜덤숫자 추출
        for (int i = 0; i < FNumber.length; i++) {
        	FNumber[i] = (random.nextInt((max - min) + 1) + min);
            
            //중복처리로직
            //앞의 숫자와 뒤의 숫자가 같으면 중복된 숫자를 알려주고 다시 한 번돈다.
            
            for (int j = 0; j < i; j++) {
                if (FNumber[i] == FNumber[j]) {
                    //중복건수를 처리하기의해 반복분 i 번째를 다시 내린다.
                    i--;
                }
 
            }
        }
        
        Arrays.sort(FNumber);
        
        //배열내 랜덤 recomlist lovelist에 넣기
        for(int k = 0; k < recomList.size(); k++) {
        	int num = k;
        	Map<String, Object> item = recomList.get(num);
    		loveList.add(item);
        }
		
		long seed = System.nanoTime();
		Collections.shuffle(loveList, new Random(seed));
		
		commandMap.put("loveList", loveList);
		commandMap.put("recomList", recomList);
		commandMap.put("mbti", mId);
			
	
		mv.addObject("map", commandMap.getMap());	
		return mv;
	}
	
		
	

	
	}
	
	

