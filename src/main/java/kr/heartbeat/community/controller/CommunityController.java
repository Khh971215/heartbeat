package kr.heartbeat.community.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.heartbeat.community.service.CommunityService;
import kr.heartbeat.vo.CommentVO;
import kr.heartbeat.vo.PostVO;
import kr.heartbeat.vo.UserVO;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	@GetMapping("/community")
	public String community(UserVO uservo) {

		return "/community/community";
	}

	// 뉴진스 페이지 들어가면서 게시물 가져오는거
	@RequestMapping("/artist/newjeans")
	public String newjeans(PostVO postvo, Model model, UserVO uservo) throws Exception {
		System.out.println("===========CommunityControllerGetPost : " + postvo);
		System.out.println("===========유저 정보 : " + uservo);
		List<PostVO> postList = communityService.getPostList(postvo);
		UserVO artist_id = communityService.getLevel(uservo);

		String url = null;
		List<PostVO> newjinsPosts = new ArrayList<>(); // 민지 게시물
		List<PostVO> newjinsfanPosts = new ArrayList<>(); // 일반 유저 게시물

		if (artist_id.getArtist_id() == 2) {
			// 게시물 나누기
			for (PostVO post : postList) {
				if (post.getArtist_id() == 2) {
					if ("minji".equals(post.getEmail())) {
						newjinsPosts.add(post);
					} else {
						newjinsfanPosts.add(post);
					}
				}
			}
			model.addAttribute("newjinsPosts", newjinsPosts);
			model.addAttribute("newjinsfanPosts", newjinsfanPosts);
			url = "/community/artist/newjeans";
		} else {

			url = "/community/community";
		}

		return url;
	}

	// 게시물 작성
	@PostMapping("/postWrite")
	public String postWrite(PostVO postvo, Model model, HttpServletRequest request) throws Exception {
//		System.out.println("===========CommunityController : "+postvo);
		communityService.postWrite(postvo);
		List<PostVO> postList = communityService.getPostList(postvo);

		List<PostVO> newjinsPosts = new ArrayList<>(); // 뉴진스 게시물
		List<PostVO> newjinsfanPosts = new ArrayList<>(); // 일반 유저 게시물

		// 게시물 나누기
		for (PostVO post : postList) {
			if (post.getArtist_id() == 2) { // 뉴진스 아티스트번호(2)랑 같으면 뉴진스로
				if ("minji".equals(post.getEmail())) {
					newjinsPosts.add(post);
				} else { // 아닐때는 뉴진스 팬 포스트로
					newjinsfanPosts.add(post);
				}
			}
		}
		
		String referer = request.getHeader("Referer");

		model.addAttribute("newjinsPosts", newjinsPosts);
		model.addAttribute("newjinsfanPosts", newjinsfanPosts);
		return "redirect:"+referer;
	}
	
	// 게시물 수정
	@PostMapping("/modifyPost")
	@ResponseBody
	public String modifyPost(PostVO postVO) throws Exception {
		communityService.modifyPost(postVO);
		return "success";
			
	}

	// 게시물 삭제
	@PostMapping("/deletePost")
	public String deletePost(@RequestParam("post_id") int post_id, HttpServletRequest request) throws Exception {
		communityService.deletePost(post_id);
		
		// 이전 페이지 URL 얻기
	    String referer = request.getHeader("Referer");
	    
	    
		return "redirect:"+referer;
	}

	// 유저 게시물 상세보기
	@PostMapping("/getUserPost")
	public String getUserPost(@RequestParam("post_id") int post_id, Model model) throws Exception {
		PostVO dbpost = communityService.getPost(post_id); // 게시물 정보
		List<CommentVO> commentList = communityService.getComment(post_id); // 댓글 목록
		Integer totlaCommnet = communityService.totalComment(post_id); // 총 댓글 개수

		model.addAttribute("totalComment", totlaCommnet);
		model.addAttribute("commentList", commentList);
		model.addAttribute("PostVO", dbpost);

		return "/popup/pop-post-fan";
	}

	// 아티스트 게시물 상세보기
	@PostMapping("/getArtistPost")
	public String getArtistPost(@RequestParam("post_id") int post_id, Model model) throws Exception{
		PostVO dbpost = communityService.getPost(post_id); // 게시물 정보
		List<CommentVO> commentList = communityService.getComment(post_id); // 댓글 목록
		Integer totlaCommnet = communityService.totalComment(post_id); // 총 댓글 개수

		model.addAttribute("totalComment", totlaCommnet);
		model.addAttribute("commentList", commentList);
		model.addAttribute("PostVO", dbpost);
		System.out.println(dbpost);

		return "/popup/pop-post-artist";
	}

	// 게시물 새로고침
	@PostMapping("/resetPost")
	public String resetPost(@RequestParam("post_id") int post_id, Model model) throws Exception{
		System.out.println("게시물 새로 고침 " + post_id);
		PostVO dbpost = communityService.getPost(post_id);
		List<CommentVO> commentList = communityService.getComment(post_id);
		Integer totlaCommnet = communityService.totalComment(post_id);

		model.addAttribute("totalComment", totlaCommnet);
		model.addAttribute("commentList", commentList);
		model.addAttribute("PostVO", dbpost);

		return "/community/artist/newjeans";
	}

	// 댓글 작성
	@PostMapping("/commentWrites")
	public String commentWrite(CommentVO commentVO, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		communityService.commentWrite(commentVO);
		
		// 이전 페이지 URL 얻기
	    String referer = request.getHeader("Referer");
	    
	    
		return "redirect:"+referer;
	}

	// 댓글 작성
	@PostMapping("/commentWrite")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> commentWrite(CommentVO commentVO, Map<String, Object> response) throws Exception {

		System.out.println("==========댓글내용전달확인" + commentVO);
		// 댓글 저장
		communityService.commentWrite(commentVO);

		// 새로 작성된 댓글 정보 가져오기
		CommentVO newComment = communityService.getNewComment(commentVO.getPost_id());
		System.out.println("새로 작성된 댓글 정보: " + newComment); // 로그 추가

		// 최신 댓글 개수 가져오기
		int totalComment = communityService.totalComment(commentVO.getPost_id());
		System.out.println("최신 댓글 개수 : " + totalComment); // 로그 추가

		// 결과를 JSON 형식으로 반환
		// 응답 데이터 설정
		response.put("status", "success"); // 성공 여부
		response.put("newComment", newComment); // 새 댓글 데이터
		response.put("totalComment", totalComment); // 최신 댓글 수

		return ResponseEntity.ok(response);

	}
	
	@PostMapping("/modifyComment") // 댓글 수정
	@ResponseBody
	public String modifyComment(CommentVO commentVO) throws Exception {
		communityService.modifyComment(commentVO);
		
		return "success";
	}

	@PostMapping("/commentdelete") // 댓글 삭제
	@ResponseBody // JSON 응답을 반환하기 위해 @ResponseBody 추가
	public ResponseEntity<Map<String, Object>> commentdelete(int comment_id, int post_id, Map<String, Object> response) throws Exception {
		communityService.commentdelete(comment_id);
		Integer totalComment = communityService.totalComment(post_id);
		System.out.println(post_id);
		System.out.println(comment_id);

		// 결과를 JSON 형식으로 반환
		response.put("status", "success"); // 성공 여부
		response.put("comment_id", comment_id); // 삭제된 댓글 ID
		response.put("totalComment", totalComment);

		return ResponseEntity.ok(response); // 클라이언트에게 성공 메시지 전달
	}
}
