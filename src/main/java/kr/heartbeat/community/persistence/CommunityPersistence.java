package kr.heartbeat.community.persistence;

import java.util.List;

import kr.heartbeat.vo.CommentVO;
import kr.heartbeat.vo.PostVO;
import kr.heartbeat.vo.UserVO;

public interface CommunityPersistence {

	public UserVO checkMemberShipLevel(UserVO uservo);
	
	public void postWrite(PostVO postvo);
	
	public List<PostVO> getPostList(PostVO postvo);
	
	public PostVO getPost(int post_id);
	
	public UserVO getLevel(UserVO uservo);
	
	public void commentWrite(CommentVO commentVO);
	
	public List<CommentVO> getComment(int post_id);
	
	public int totalComment(int post_id);
	
	public void commentdelete(int comment_id);
}
