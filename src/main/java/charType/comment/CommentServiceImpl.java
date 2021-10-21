package charType.comment;

import org.springframework.stereotype.Service;

import charType.comment.CommentService;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

@Service("commentService")
public class CommentServiceImpl implements CommentService{
	
	@Resource(name="commentDAO")
	private CommentDAO commentDAO;
	
	@Override
	public void writeComment(Map<String, Object> map) throws Exception{
		commentDAO.writeComment(map);
	}
	
	@Override
	public List<Map<String, Object>> selectComment(Map<String, Object> map)
			throws Exception{
		
		return commentDAO.selectComment(map);
	}
	
	@Override
	public void deleteComment(Map<String, Object> map) throws Exception{
		commentDAO.deleteComment(map);
	}

}
