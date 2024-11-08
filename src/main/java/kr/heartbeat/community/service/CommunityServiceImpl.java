package kr.heartbeat.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.heartbeat.community.persistence.CommunityPersistence;
import kr.heartbeat.vo.CommentVO;
import kr.heartbeat.vo.PostVO;
import kr.heartbeat.vo.UserVO;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityPersistence communityPersistence;
	
	@Override //맴버십 레벨 가져오기 
	public UserVO checkMemberShipLevel(UserVO uservo) throws Exception {
		return communityPersistence.checkMemberShipLevel(uservo);
	}
	
	@Override //게시물 작성
	public void postWrite(PostVO postvo) throws Exception {
		communityPersistence.postWrite(postvo);
	}
	
	@Override // 게시물 목록 가져오기
	public List<PostVO> getPostList(PostVO postvo) throws Exception {
//		System.out.println("===========CommunityServiceGetPost : "+postvo);
		return communityPersistence.getPostList(postvo);
	}
	
	@Override // 게시물 하나 가져오기
	public PostVO getPost(int post_id) throws Exception {
		return communityPersistence.getPost(post_id);
	}
	
	@Override // 게시물 수정
	public void modifyPost(PostVO postVO) throws Exception {
		 communityPersistence.modifyPost(postVO);
	}
	
	@Override // 게시물 삭제
	public void deletePost(int post_id) throws Exception {
		communityPersistence.deletePost(post_id);
	}
	
	@Override 
	public UserVO getLevel(UserVO uservo) throws Exception {
		return communityPersistence.getLevel(uservo);
	}
	
	@Override // 댓글 작성
	public void commentWrite(CommentVO commentVO) throws Exception {
		communityPersistence.commentWrite(commentVO);
	}
	
	@Override // 댓글 가져오기
	public List<CommentVO> getComment(int post_id) throws Exception {
		return communityPersistence.getComment(post_id);
	}
	
	@Override // 총 댓글 수 가져오기
	public int totalComment(int post_id) throws Exception {
		return communityPersistence.totalComment(post_id);
	}
	
	@Override // 댓글 수정
	public CommentVO modifyComment(CommentVO commentVO) throws Exception {
		return communityPersistence.modifyComment(commentVO);
	}
	
	@Override // 댓글 삭제 
	public void commentdelete(int comment_id) throws Exception {
		communityPersistence.commentdelete(comment_id);
	}
	
	@Override // 새로 작성한 댓글 가져오기
	public CommentVO getNewComment(int post_id) throws Exception {
		return communityPersistence.getNewComment(post_id);
	}
	

}
