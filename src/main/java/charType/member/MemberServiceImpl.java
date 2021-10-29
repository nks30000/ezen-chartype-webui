package charType.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import charType.member.MemberModel;
import charType.utils.common.file.FileUtils;
import charType.member.MemberDao;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "memberDao")
	private MemberDao memberDao;
	
	@Override
	public MemberModel insertUser(MemberModel mem) throws Exception {
		String id = memberDao.insertUser(mem);
		return memberDao.selectIdMember(id);
	}
	
	@Override
	public MemberModel selectIdMember(String id) throws Exception {
		return memberDao.selectIdMember(id);
	}
	

	@Override
	public MemberModel selectFindId(MemberModel mem) throws Exception{
		return memberDao.selectFindId(mem);
	}
	
	@Override
	public MemberModel selectFindPassword(MemberModel mem) throws Exception{
		return memberDao.selectFindPassword(mem);
	}
	
	@Override
	public String findNickName(String id) throws Exception{
		return memberDao.findNickName(id);
	}
	
	@Override
	public String findProfImg(String id) throws Exception{
		return memberDao.findProfImg(id);
	}
	
	
	@Override
	public MemberModel getMem(String id) throws Exception {
		return memberDao.getMem(id);  
	}
	
	@Override
	public void updatemodify(MemberModel mem) throws Exception{
		 memberDao.updatemodify(mem);
	}
	
	@Override
	public void updatepwChange(MemberModel mem) throws Exception{
		memberDao.updatepwChange(mem);
	}
	
	@Override
	public void memberDelete(String id) throws Exception{
		memberDao.memberDelete(id);
	}
	
	@Override
	public void insertProfileImg(Map<String, Object> map, HttpServletRequest request) throws Exception{
		
		Map<String, Object> fileInfo = null;
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		if(multipartRequest.getFile("prof_img") != null && multipartRequest.getFile("prof_img").getSize() > 0) {
			MultipartFile file = multipartRequest.getFile("prof_img");
			
			//query
			fileInfo = fileUtils.parseSingleFileInfo(file);
			System.out.println("프로파일 이미지 파싱 실행");
			System.out.println(map.get("id"));
			System.out.println("SAVED_N" + fileInfo.get("SAVED_NM"));
			
			fileInfo.put("USER_ID", map.get("id"));
			
			memberDao.updateProfileImgAtUser(fileInfo);
			memberDao.insertProfileImg(fileInfo);
		}
		
		if(multipartRequest.getFile("back_img") != null && multipartRequest.getFile("back_img").getSize() > 0) {
			MultipartFile file = multipartRequest.getFile("back_img");
			//query
			fileInfo = fileUtils.parseSingleFileInfo(file);
			System.out.println("배경 이미지 파싱");
			fileInfo.put("USER_ID", map.get("id"));
			
			memberDao.updateBackImgAtUser(fileInfo);
			memberDao.insertProfileImg(fileInfo);
		}
		
	}
	@Override
	public void updateProfileImg(Map<String, Object> map, HttpServletRequest request) throws Exception{
		Map<String, Object> fileInfo = null;
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		if(multipartRequest.getFile("prof_img") != null && multipartRequest.getFile("prof_img").getSize() > 0) {
			MultipartFile file = multipartRequest.getFile("prof_img");
			fileInfo = fileUtils.parseSingleFileInfo(file);
			System.out.println("프로파일 이미지 파싱 실행");
			System.out.println(map.get("id"));
			System.out.println("SAVED_N" + fileInfo.get("SAVED_NM"));
			
			fileInfo.put("USER_ID", map.get("id"));
			
			memberDao.updateProfileImgAtUser(fileInfo);
			memberDao.insertProfileImg(fileInfo);
		}
		
		if(multipartRequest.getFile("back_img") != null && multipartRequest.getFile("back_img").getSize() > 0 ) {
			MultipartFile file = multipartRequest.getFile("back_img");
			fileInfo = fileUtils.parseSingleFileInfo(file);
			System.out.println("배경 이미지 파싱");
			
			fileInfo.put("USER_ID", map.get("id"));
			
			memberDao.updateBackImgAtUser(fileInfo);
			memberDao.insertProfileImg(fileInfo);
		}
	}
	@Override
	public void deleteProfileImg(String id) throws Exception{
		memberDao.deleteProfileImg(id);
	}
	
	@Override
	public Map<String, Object> selectProfileImg(String saved_nm) throws Exception{
		
		return memberDao.selectProfileImg(saved_nm);
	}
}
