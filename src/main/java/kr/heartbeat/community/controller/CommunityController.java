package kr.heartbeat.community.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String newjeans(PostVO postvo,Model model,UserVO uservo) {
		System.out.println("===========CommunityControllerGetPost : "+postvo);
		System.out.println("===========유저 정보 : "+uservo);
		List<PostVO> postList = communityService.getPostList(postvo);
		UserVO artist_id = communityService.getLevel(uservo);
		
		String url = null;
		List<PostVO> newjinsPosts = new ArrayList<>(); // 민지 게시물
		List<PostVO> newjinsfanPosts = new ArrayList<>(); // 일반 유저 게시물
		
		
		
	    if (artist_id.getArtist_id() == 2) {
	    	// 게시물 나누기
		    for (PostVO post : postList) {
		       	if (post.getArtist_id() == 2){
		    		if ("minji".equals(post.getEmail())) {
		    			newjinsPosts.add(post);
		    		}else {
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
	
	//게시물 작성 
	@PostMapping("/postWrite")
	public String postWrite(PostVO postvo,Model model) {
//		System.out.println("===========CommunityController : "+postvo);
		communityService.postWrite(postvo);
		List<PostVO> postList = communityService.getPostList(postvo);
		
		
		List<PostVO> newjinsPosts = new ArrayList<>(); // 민지 게시물
		List<PostVO> newjinsfanPosts = new ArrayList<>(); // 일반 유저 게시물
		
		// 게시물 나누기
	    for (PostVO post : postList) {
	       	if (post.getArtist_id() == 2){
	    		if ("minji".equals(post.getEmail())) {
	    			newjinsPosts.add(post);
	    		}else {
		        	newjinsfanPosts.add(post);
		        }
	    	}
	    }

		model.addAttribute("newjinsPosts", newjinsPosts);
		model.addAttribute("newjinsfanPosts", newjinsfanPosts);
		return "/community/artist/newjeans";
	}
	
	//게시물 상세보기
	@PostMapping("/getPost")
	public String getPost(@RequestParam("post_id") int post_id,Model model) {
		PostVO dbpost = communityService.getPost(post_id);
		List<CommentVO> commentList = communityService.getComment(post_id);
		Integer totlaCommnet = communityService.totalComment(post_id);
		
		model.addAttribute("totalComment", totlaCommnet);
		model.addAttribute("commentList", commentList);
		model.addAttribute("PostVO", dbpost);
		
		return "/popup/pop-post-fan";
	}
	
	//댓글 작성
	@PostMapping("/commentWrite")
	public String commentWrite(CommentVO commentVO, HttpServletRequest request, RedirectAttributes rttr) {
		communityService.commentWrite(commentVO);
		
		// 이전 페이지 URL 얻기
	    String referer = request.getHeader("Referer");
	    
	    
		return "redirect:"+referer;
	}
	
	@PostMapping("/commentdelete") // 댓글 삭제 
	public String commentdelete(int comment_id, HttpServletRequest request) {
		communityService.commentdelete(comment_id);
		System.out.println(comment_id);
		
		// 이전 페이지 URL 얻기
	    String referer = request.getHeader("Referer");
		
		return "redirect:"+referer;
	}
	
	
	
}
