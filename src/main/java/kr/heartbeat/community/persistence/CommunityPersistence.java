package kr.heartbeat.community.persistence;

import java.util.List;

import kr.heartbeat.vo.CommentVO;
import kr.heartbeat.vo.PostVO;
import kr.heartbeat.vo.UserVO;

public interface CommunityPersistence {
	//맴버십 레벨 확인
	public UserVO checkMemberShipLevel(UserVO uservo) throws Exception;
	// 게시물 작성
	public void postWrite(PostVO postvo) throws Exception;
	// 게시물 목록 가져오기
	public List<PostVO> getPostList(PostVO postvo) throws Exception;
	// 게시물 하나 가져오기
	public PostVO getPost(int post_id) throws Exception;
	// 게시물 수정
	public void modifyPost(PostVO postVO) throws Exception;
	// 게시물 삭제
	public void deletePost(int post_id) throws Exception;
	// 아티스트 레벨 가져오기
	public UserVO getLevel(UserVO uservo) throws Exception;
	// 댓글 작성
	public void commentWrite(CommentVO commentVO) throws Exception;
	// 댓글 목록 가져오기
	public List<CommentVO> getComment(int post_id) throws Exception;
	// 총 댓글 개수 가져오기
	public int totalComment(int post_id) throws Exception;
	// 댓글 삭제
	public void commentdelete(int comment_id) throws Exception;
	// 수정된 댓글 가져오기
	public CommentVO getNewComment(int post_id) throws Exception;
	// 댓글 수정
	public CommentVO modifyComment(CommentVO commentVO) throws Exception;
	
}
