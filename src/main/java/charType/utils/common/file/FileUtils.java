package charType.utils.common.file;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "C:\\charType\\img\\";
	
	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	
    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null; 
        
        String board_num = (String)map.get("BOARD_NUM");
   
        File file = new File(filePath);
        
        int i = 0;
        if(file.exists() == false){
        	file.mkdirs();
        }
        
        while(iterator.hasNext()){
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){
        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		storedFileName = CommonUtils.getRandomString() + originalFileExtension;
        		
        		file = new File(filePath + storedFileName);
        		multipartFile.transferTo(file);
        		
        		listMap = new HashMap<String,Object>();
        		
	        	if(board_num != null) {
	        		listMap.put("BOARD_NUM", board_num);
	        		listMap.put("ORIGINAL_NM", originalFileName);
	        		listMap.put("SAVED_NM", storedFileName);
	        		listMap.put("FILE_SIZE", multipartFile.getSize());
	        		for(i=0; i < list.size(); i++) {
	        			listMap.put("IMG_VAL", i+1);
	        		}
	        	} else {
	        		listMap.put("ORIGINAL_NM", originalFileName);
	        		listMap.put("SAVED_NM", storedFileName);
	        		listMap.put("FILE_SIZE", multipartFile.getSize());
	        		for(i=0; i < list.size(); i++) {
	        			listMap.put("IMG_VAL", i+1);
	        		}
	        	}
	        	
	        	
	        	list.add(listMap);
		
        	}
        }
        return list;
	}
	
	
	 public Map<String,Object> parseSingleFileInfo (MultipartFile paramFile )
	 throws Exception {
	 
	 Map<String, Object> listMap = null;
	 
	 MultipartFile multipartFile = null; String originalFileName = null; String
	 originalFileExtension = null; String storedFileName = null;
	 
	 
	 System.out.println(paramFile.getOriginalFilename());
	 System.out.println(paramFile.getSize());
	 
	 File file = new File(filePath); if(file.exists() == false){ file.mkdirs(); }
	 
	 
	 multipartFile = paramFile; System.out.println("multipartFile.isEmpty() : " +
	 multipartFile.isEmpty()); if(multipartFile.isEmpty() == false){
	 originalFileName = multipartFile.getOriginalFilename(); originalFileExtension
	 = originalFileName.substring(originalFileName.lastIndexOf("."));
	 storedFileName = CommonUtils.getRandomString() + originalFileExtension;
	 
	 file = new File(filePath + storedFileName); multipartFile.transferTo(file);
	 
	 listMap = new HashMap<String,Object>();
	 
	 listMap.put("ORIGINAL_NM", originalFileName); listMap.put("SAVED_NM",
	 storedFileName); listMap.put("FILE_SIZE", multipartFile.getSize());
	 
	 }
	 
	 return listMap; }
	 
	
	
}

	
	

