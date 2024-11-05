package kr.heartbeat.community.persistence;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.heartbeat.vo.CommentVO;
import kr.heartbeat.vo.PostVO;
import kr.heartbeat.vo.UserVO;

@Repository
public class CommunityPersistenceImpl implements CommunityPersistence {

	@Inject
	private SqlSession sql;
	private HttpSession session;
	
	private static String namespace = "kr.heartbeat.mappers.community";
	
	@Override // 맴버십 레벨 가져오기
	public UserVO checkMemberShipLevel(UserVO uservo) {
		return sql.selectOne(namespace+".checkMemberShipLevel", uservo);
	}
	
	@Override // 게시물 작성
	public void postWrite(PostVO postvo) {
		sql.insert(namespace+".postWrite", postvo);
	}
	
	@Override //게시물 목록 가져오기
	public List<PostVO> getPostList(PostVO postvo) {
//		System.out.println("===========CommunityPersistenceImplGetPost : "+postvo);

		return sql.selectList(namespace+".getPostList", postvo);
	}
	
	@Override // 게시물 하나 가져오기
	public PostVO getPost(int post_id) {
		return sql.selectOne(namespace+".getPost", post_id);
	}
	
	@Override 
	public UserVO getLevel(UserVO uservo) {
		return sql.selectOne(namespace+".getLevel",uservo);
	}
	
	@Override // 댓글 작성
	public void commentWrite(CommentVO commentVO) {
		sql.insert(namespace+".commentWrite", commentVO);
	}
	
	@Override // 댓글 가져오기 
	public List<CommentVO> getComment(int post_id) {
		return sql.selectList(namespace+".getComment", post_id);
	}
	
	@Override // 총 댓글 수 가져오기
	public int totalComment(int post_id) {
		return sql.selectOne(namespace+".totalComment",post_id );
	}
	
	@Override // 댓글 삭제
	public void commentdelete(int comment_id) {
		sql.delete(namespace+".commentdelete", comment_id);
	}

}
