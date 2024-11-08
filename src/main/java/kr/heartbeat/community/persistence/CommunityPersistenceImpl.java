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
	public UserVO checkMemberShipLevel(UserVO uservo) throws Exception {
		return sql.selectOne(namespace+".checkMemberShipLevel", uservo);
	}
	
	@Override // 게시물 작성
	public void postWrite(PostVO postvo) throws Exception {
		sql.insert(namespace+".postWrite", postvo);
	}
	
	@Override //게시물 목록 가져오기
	public List<PostVO> getPostList(PostVO postvo) throws Exception {
//		System.out.println("===========CommunityPersistenceImplGetPost : "+postvo);

		return sql.selectList(namespace+".getPostList", postvo);
	}
	
	@Override // 게시물 하나 가져오기
	public PostVO getPost(int post_id) throws Exception {
		return sql.selectOne(namespace+".getPost", post_id);
	}
	
	@Override // 게시물 수정
	public void modifyPost(PostVO postVO) throws Exception {
		sql.update(namespace+".modifyPost", postVO);
		
	}
	
	@Override // 게시물 삭제
	public void deletePost(int post_id) throws Exception {
		sql.delete(namespace+".deletePost", post_id);
	}
	
	@Override // 구독 등급 가져오기
	public UserVO getLevel(UserVO uservo) throws Exception {
		return sql.selectOne(namespace+".getLevel",uservo);
	}
	
	@Override // 댓글 작성
	public void commentWrite(CommentVO commentVO) throws Exception {
		sql.insert(namespace+".commentWrite", commentVO);
	}
	
	@Override // 댓글 가져오기 
	public List<CommentVO> getComment(int post_id) throws Exception {
		return sql.selectList(namespace+".getComment", post_id);
	}
	
	@Override // 총 댓글 수 가져오기
	public int totalComment(int post_id) throws Exception {
		return sql.selectOne(namespace+".totalComment",post_id );
	}
	
	@Override // 댓글 수정
	public CommentVO modifyComment(CommentVO commentVO) throws Exception {
		// 댓글을 먼저 수정 (업데이트)
	    int result = sql.update(namespace + ".modifyComment", commentVO);

	    // 업데이트가 성공적으로 되었다면, 해당 댓글을 다시 조회하여 반환
	    if (result > 0) {
	        // 수정된 댓글을 다시 조회
	        return sql.selectOne(namespace + ".getmodifyComment", commentVO.getComment_id());
	    } else {
	        // 업데이트가 실패한 경우 (0이면 실패)
	        return null;  // 또는 예외 처리
	    }
	}
	
	@Override // 댓글 삭제
	public void commentdelete(int comment_id) throws Exception {
		sql.delete(namespace+".commentdelete", comment_id);
	}
	
	@Override // 새로 작성한 댓글 가져오기
	public CommentVO getNewComment(int post_id) throws Exception {
		System.out.println("===========퍼시스턴스 확인"+post_id);
		return sql.selectOne(namespace+".getNewComment", post_id);
	}

}
