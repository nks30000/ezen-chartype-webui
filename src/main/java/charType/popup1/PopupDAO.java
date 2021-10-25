package charType.comment;

import java.util.Map;
import java.util.List;

import org.springframework.stereotype.Repository;

import charType.utils.common.dao.AbstractDAO;

@Repository("commentDAO")
public class CommentDAO extends AbstractDAO{
	
	private final String NAMESPACE = "comment.";
	
	//댓글 입력
	public void writeComment(Map<String,Object> map) throws Exception {
		
		insert("comment.writeComment", map );
	}
	
	//댓글 리스트 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectComment(Map<String, Object> map)
		throws Exception {
		
		return (List<Map<String,Object>>) selectList("comment.selectComment", map);
	}
	
	//댓글 삭제하기
	public void deleteComment(Map<String, Object> map) throws Exception {
		
		delete("comment.deleteComment", map);
	}


}
