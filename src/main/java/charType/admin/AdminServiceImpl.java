package charType.admin;

import org.springframework.stereotype.Service;

import charType.admin.AdminService;
import charType.admin.AdminDAO;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Service("adminService")
public class AdminServiceImpl implements AdminService { 
	
	@Resource(name="adminDao")
	private AdminDAO adminDao;
	

		@Override
		public List<Map<String, Object>> alluserData(Map<String, Object> map) throws Exception {
			return adminDao.alluserData(map);
}
}
