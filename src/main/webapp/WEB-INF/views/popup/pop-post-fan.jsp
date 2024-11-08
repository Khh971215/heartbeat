<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function deletePost(post_id){
		// 사용자에게 삭제 확인 메세지 띄우기
		alert(post_id);
		var ifconfrimed = confirm("게시물을 삭제하시겠습니까?");
		
		// 확인을 누르면 폼을 제출
		if (ifconfrimed	) {
			// AJAX 요청을 통해 댓글 삭제
			$.ajax({
				type : "POST",
				url : "/community/deletePost",
				data : {post_id : post_id},
				success : function(response) {
					window.location.reload();
				}
			});
		}
	}
	
	// 게시물 수정 버튼
	function popPostEditShow(button) {
		var postDiv = button.closest('.postBx');
		var fanPostDiv = postDiv.querySelector('.arti-cnt') ;
		var fanButtonDiv = postDiv.querySelector('.arti-top');
		
		// fanPostDiv와 fanButtonDiv가 잘 찾혔는지 확인
	    if (!fanPostDiv || !fanButtonDiv) {
	        console.error("필수 요소를 찾을 수 없습니다.");
	        return;
	    }

	    var postText = fanPostDiv.querySelector('.txt');  // 기존 게시물 내용
	    var postInput = fanPostDiv.querySelector('.post-txtBx');  // 수정용 입력 박스
	    
	    // postText와 postInput이 제대로 찾혔는지 확인
	    console.log("postText:", postText);
	    console.log("postInput:", postInput);
		
		// 텍스트 박스 숨김 처리 
		postText.style.display = 'none';
		postInput.style.display = 'block';
		
		var editButton = fanButtonDiv.querySelector('.btn-i-edit');
		var saveButton = fanButtonDiv.querySelector('.btn-i-save');
		
		// 버튼 숨김 처리
		editButton.style.display = "none";
		saveButton.style.display = "inline-block";
		
		
		postInput.value = postText.innerText.trim();
		
	}
	
	// 게시물 수정 저장 버튼
	function popPostSaveShow(button){
		var postDiv = button.closest('.postBx');
		var fanPostDiv = postDiv.querySelector('.arti-cnt') ;
		var fanButtonDiv = postDiv.querySelector('.arti-top');
		
		// fanPostDiv와 fanButtonDiv가 잘 찾혔는지 확인
	    if (!fanPostDiv || !fanButtonDiv) {
	        console.error("필수 요소를 찾을 수 없습니다.");
	        return;
	    }

	    var postText = fanPostDiv.querySelector('.txt');  // 기존 게시물 내용
	    var postInput = fanPostDiv.querySelector('.post-txtBx');  // 수정용 입력 박스
	    
	    // postText와 postInput이 제대로 찾혔는지 확인
	    console.log("postText:", postText);
	    console.log("postInput:", postInput);
		
		var newPostText = postInput.value.trim();
		
		var post_id = postDiv.getAttribute('data-post-id');
		
		// 수정된 게시물을 서버로 전송하는 AJAX 요청
		$.ajax({
			type : "POST",
			url : "/community/modifyPost",
			data : {
				post_id : post_id,
				content : newPostText
			},
			success : function(data) {
				if (data === "success") {
					postText.innerText = newPostText // 게시물 텍스트 업데이트
					postInput.style.display = 'none';
					postText.style.display = 'block';
					
					var editButton = fanButtonDiv.querySelector('.btn-i-edit');
					var saveButton = fanButtonDiv.querySelector('.btn-i-save');
					// 수정 버튼 보이기, 저장 버튼 숨기기
					editButton.style.display = "inline-block";
					saveButton.style.display = "none";
				}
			}
		})
	}
	
	//댓글 작성
	function submitComment() {
		var button = event.target; // 클릭한 버튼을 가져온다.
		var form = button.closest('form');
	    console.log(form);  // 댓글 내용 확인 (디버깅용)
	    
	    var post_id = form.querySelector('input[name="post_id"]').value
	    var email = form.querySelector('input[name="email"]').value
	    var nickname = form.querySelector('input[name="nickname"]').value
	    var comment = form.querySelector('input[name="comment"]').value
	    console.log(post_id);  // 댓글 내용 확인 (디버깅용)
	    console.log(email);  // 댓글 내용 확인 (디버깅용)
	    console.log(nickname);  // 댓글 내용 확인 (디버깅용)
	    console.log(comment);  // 댓글 내용 확인 (디버깅용)
		
	    // 댓글이 비어있는 경우
	    if (!comment.trim()) {
	        alert("댓글 내용을 입력해주세요.");
	        return;
	    }

	    // AJAX 요청을 통해 댓글 작성
	    $.ajax({
	        type: "POST",
	        url: "/community/commentWrite",  // 댓글 작성 처리 URL
	        data: {
	            post_id: post_id,
	            email: email,
	            nickname: nickname,
	            comment: comment
	        },
	        dataType : "json",
	        // 여기까지 전달되고
	        success: function(response) { // 여기를 전달받지못함
	        	console.log("서버 데이터"+response);
	            if (response.data === "success") {
	                // 새로 작성된 댓글을 DOM에 추가
	                var newComment = response.newComment;

	                // 템플릿 리터럴을 사용하여 HTML 생성
	                var newCommentHtml = `
	                    <div class="list" data-comment-id="${newComment.comment_id}">
	                        <div class="postBx">
	                            <div class="fan-profile">
	                                <img src="#none" onerror="this.src='${pageContext.request.contextPath}/img/user.png'" class="fan-thumb" alt="${newComment.nickname}">
	                                <span class="nickname">${newComment.nickname}</span>
	                                <div class="date"><fmt:formatDate value="${newComment.comment_date}" pattern="yy-MM-dd HH:mm"/></div>
	                            </div>
	                            <div class="fan-comment">
	                                <div><div>${newComment.comment}</div></div>
	                            </div>
	                        </div>
	                    </div>
	                `;
	                
	                // 댓글 목록에 새 댓글 추가
	                $(".reply").append(newCommentHtml);

	                // 댓글 수 업데이트
	                var totalComment = response.totalComment; // 서버에서 반환받은 최신 댓글 수
	                $(".comm .num").text(totalComment); // 댓글 수 업데이트

	                // 댓글 입력 폼 초기화
	                $("input[name='comment']").val('');  // 댓글 입력창 초기화

	                alert("댓글이 작성되었습니다.");
	            } else {
	                alert("댓글 작성에 실패했습니다.");
	            }
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
        	 	console.log("AJAX 오류:", jqXHR);
        	    console.log("상태:", textStatus);
        	    console.log("에러 내용:", errorThrown);
        	    
	            alert("서버 오류가 발생했습니다.");
	        }
	    });
	
	}
	
	// 댓글 수정 버튼 
	function popCommentEditShow(button) {
	    var commentDiv = button.closest('.postBx'); // 댓글을 포함한 가장 가까운 div인 .postBx를 찾기
	    var fanCommentDiv = commentDiv.querySelector('.fan-comment'); // .fan-comment를 찾기
	    var fanProfileDiv = commentDiv.querySelector('.fan-profile'); // .fan-profile를 찾기


	    if (!fanCommentDiv) {
	        console.error('팬 댓글 요소를 찾을 수 없습니다.');
	        return;
	    }

	    var commentText = fanCommentDiv.querySelector('.comment'); // 기존 댓글 텍스트
	    var commentInput = fanCommentDiv.querySelector('.txtBx'); // 수정용 텍스트박스
	    
	    // 댓글 텍스트와 입력란이 없으면 오류
	    if (!commentText || !commentInput) {
	        console.error('댓글 텍스트 또는 입력란을 찾을 수 없습니다.');
	        return;  // commentText나 commentInput이 없으면 실행 중단
	    }

	    // 댓글 텍스트 숨기고, 입력란 보이기
	    commentText.style.display = 'none';
	    commentInput.style.display = 'block';
	    
	    // 수정 버튼을 숨기고 저장 버튼을 보이도록 설정
	    var editButton = fanProfileDiv.querySelector('.btn-i-edit');
	    var saveButton = fanProfileDiv.querySelector('.btn-i-save');
	    

	    editButton.style.display = 'none';  // 수정 버튼 숨기기
	    saveButton.style.display = 'inline-block';  // 저장 버튼 보이기


	    // 기존 댓글 내용을 입력란에 설정
	    commentInput.value = commentText.innerText.trim();
	}

	// 댓글 수정 저장
	function popCommentSaveShow(button) {
	    var commentDiv = button.closest('.postBx'); // 댓글을 포함한 .postBx를 찾기
	    var fanCommentDiv = commentDiv.querySelector('.fan-comment'); // .fan-comment를 찾기
	    var fanProfileDiv = commentDiv.querySelector('.fan-profile'); // .fan-profile를 찾기
	       

	    if (!fanCommentDiv) {
	        console.error('팬 댓글 요소를 찾을 수 없습니다.');
	        return;
	    }

	    var commentInput = fanCommentDiv.querySelector('.txtBx');  // 수정된 댓글 내용
	    var commentText = fanCommentDiv.querySelector('.comment'); // 기존 댓글 텍스트

	    // 수정된 댓글 내용 가져오기
	    var newCommentText = commentInput.value.trim();  // 수정된 댓글 텍스트

	    // 댓글 내용이 비어 있으면 수정하지 않음
	    if (newCommentText === "") {
	        alert("댓글 내용이 비어 있습니다.");
	        return;
	    }

	    // 댓글 ID 찾기
	    var comment_id = commentDiv.getAttribute('data-comment-id');  // data-comment-id 속성에서 댓글 ID 가져오기

	    // 수정된 댓글을 서버로 전송하는 AJAX 요청
	    $.ajax({
	        type: "POST",
	        url: "/community/modifyComment",  // 댓글 수정 처리 URL
	        data: {
	            comment_id: comment_id,
	            comment: newCommentText
	        },
	        success: function(data) {
	            console.log('서버 응답:', data);  // 서버 응답 로그 추가
	            if (data === "success") {
	                // 수정 후 댓글 내용을 업데이트하고, 버튼 전환
	                commentText.innerText = newCommentText;  // 댓글 텍스트 업데이트
	                commentInput.style.display = 'none';  // 수정 텍스트 박스 숨기기
	                commentText.style.display = 'block';  // 댓글 텍스트 보이게

	                // 수정 버튼 보이기, 저장 버튼 숨기기
	                var editButton = fanProfileDiv.querySelector('.btn-i-edit');
	                var saveButton = fanProfileDiv.querySelector('.btn-i-save');
	                
	                if (editButton) {
	                    editButton.style.display = 'inline-block';  // 수정 버튼 보이기
	                }
	                
	                if (saveButton) {
	                    saveButton.style.display = 'none';  // 저장 버튼 숨기기
	                }
	            } else {
	                alert('댓글 수정에 실패했습니다.');
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('AJAX 요청 실패:', error);
	            alert('댓글 수정 중 오류가 발생했습니다.');
	        }
	    });
	}

	function deleteComment(comment_id,totalComment,post_id) {
		// 사용자에게 삭제 확인 메세지 띄우기
		var isConfirmed = confirm("댓글을 삭제하시겠습니까?");
		
		// 확인을 누르면 폼을 제출
	    if (isConfirmed) {
	        // AJAX 요청을 통해 댓글 삭제
	        $.ajax({
	            type: "POST",
	            url: "/community/commentdelete",  // 댓글 삭제 처리 URL
	            data: { 
	            		comment_id: comment_id, 
	            		post_id: post_id
	            	},
	            success: function(response) {
	                if (response.status === "success") {
	                    // 댓글이 성공적으로 삭제되었으면, DOM에서 해당 댓글을 제거
	                    $("div[data-comment-id='" + comment_id + "']").remove();  // data-comment-id로 댓글 찾기
	                    
	                    // totalComment 값을 서버로 부터 전달 받음
	                    var newTotalComment = response.totalComment; // 서버에서 전달받은 댓글 개수
	                    // 댓글 수가 표시된 .comm 요소의 .num 부분을 업데이트
	                    $(".comm .num").text(newTotalComment); // .comm 안에 있는 .num 요소의 텍스트 업데이트
	                    
	                    alert("댓글이 삭제되었습니다.");
	                } else {
	                    alert("댓글 삭제에 실패했습니다.");
	                }
	            },
	            error: function() {
	                alert("서버 오류가 발생했습니다.");
	            }
	        });
	    }
	}
	
	
	
	function popPostFanHide() {
	    // 팝업 숨기기
	    $('.pop-post-artist').hide();
	    $('.dimmed').hide();

	    // 페이지 새로 고침
	    location.reload(); // 페이지 새로 고침
	}
	
	// 새로고침 버튼 
	function resetPopup(post_id) {
	    // AJAX 요청을 통해 서버에서 데이터를 불러온 후 팝업 업데이트
	    $.ajax({
	        url: '/community/getUserPost',  // 서버 URL을 여기에 넣으세요
	        method: 'POST',  // 서버에서 데이터를 가져오는 방식 (GET, POST 등)
	    	data : {post_id : post_id},
	        success: function(response) {
	            // 서버에서 받은 응답으로 팝업 내용 업데이트
	            $('.pop-post-fan').html(response); // 응답 받은 내용을 팝업에 표시
	            $('.pop-post-fan').show(); // 팝업 다시 보이게 하기
	        },
	        error: function(error) {
	            console.error('에러 발생:', error);
	        }
	    });
	}
	 

</script>

<div class="wrap">
	<div class="topArea">
		<button type="button" class="btn-i-close" onclick="popPostFanHide();"></button>
	</div>
	<div class="cntArea">
		<div class="postBx" data-post-id="${PostVO.post_id}">
			<div class="arti-comment">
				<div class="arti-top">
					<div class="arti-profile"><img src="#none" onerror=this.src="${pageContext.request.contextPath}/img/user.png" class="arti-thumb" alt="닉네임1"></div>
					<span class="arti-mark"><span class="blind">artist</span></span>
					<span class="arti-name"> ${PostVO.nickname }</span>
					<span class="arti-date"><fmt:formatDate value="${PostVO.post_date}" pattern="yy-MM-dd HH:mm"/></span>
					<c:if test="${PostVO.nickname eq UserVO.nickname}">
						<!-- 게시물 삭제 버튼 -->
						<button type="button" class="btn-i-trash" onclick="deletePost('${PostVO.post_id}')"></button>
						<!--  게시물 수정 버튼 -->
						<button type="button" class="btn-i-edit" onclick="popPostEditShow(this)"></button>
						<!--  게시물 저장 버튼 -->
						<button type="button" class="btn-i-save" onclick="popPostSaveShow(this)" style="display:none;"></button>
					</c:if>
				</div>
				<div class="arti-cnt">
					<div class="txt">${PostVO.content}</div>
					<textarea class="post-txtBx" name="post" style="display:none;" value="${PostVO.content }"></textarea>
				</div>
			</div>
		</div>
		<div class="replyBx">
			<div class="top">
				<div class="count">
					<div class="comm" ><i class="num">${totalComment }</i>개의 댓글</div>
					<button type="button" class="btn-i-reset" onclick="resetPopup('${PostVO.post_id}')"><i class="fa-solid fa-rotate-right"></i></button>
				</div>
			</div>
			<div class="reply">
					<div class="list" >
				<c:forEach items="${commentList }" var="commentVO">
						<div class="postBx" data-comment-id="${commentVO.comment_id}">
							<div class="fan-profile">
								<img src="#none" onerror=this.src="${pageContext.request.contextPath}/img/user.png" class="fan-thumb" alt="닉네임1">
								<span class="nickname">${commentVO.nickname }</span>
								<div class="date"><fmt:formatDate value="${commentVO.comment_date}" pattern="yy-MM-dd HH:mm"/></div>
								<c:if test="${commentVO.nickname eq UserVO.nickname}">
									<!-- 댓글 삭제 버튼 -->
									<button type="button" class="btn-i-trash" onclick="deleteComment('${commentVO.comment_id}','${totalComment }','${PostVO.post_id }')"></button>
									<!-- 댓글 수정 버튼 -->
				                    <button type="button" class="btn-i-edit" onclick="popCommentEditShow(this)"></button>
				                    <!-- 댓글 저장 버튼 -->
				                    <button type="button" class="btn-i-save" onclick="popCommentSaveShow(this)" style="display:none;"></button>

								</c:if>
							</div>
							<div class="fan-comment">
				                <div>
				                    <div class="comment">${commentVO.comment }</div>
				                    <input type="text" class="txtBx" name="comment" style="display:none;" value="${commentVO.comment }">
				                </div>
				            </div>
							
						</div>
				</c:forEach>				
			</div>
				<!--<form action="/community/commentWrite" method="post">
					<input type="hidden" name="post_id" value="${PostVO.post_id}" />
					<input type="hidden" name="email" value="${UserVO.email }"/>
					<input type="hidden" name="nickname" value="${UserVO.nickname}"/>
					<div class="input">
						<input type="text" class="txtBx" name="comment" placeholder="댓글을 입력하세요." autocomplete="off" >
						<button type="submit" class="btn-i-send" ><i class="fa-regular fa-paper-plane"></i></button>
					</div>				
				</form>-->
				
				<form action="javascript:void(0);" method="post">
				    <input type="hidden" name="post_id" value="${PostVO.post_id}" />
				    <input type="hidden" name="email" value="${UserVO.email}" />
				    <input type="hidden" name="nickname" value="${UserVO.nickname}" />
				    <div class="input">
				        <input type="text" class="txtBx" name="comment" placeholder="댓글을 입력하세요." autocomplete="off">
				        <button type="button" class="btn-i-send" onclick="submitComment()"><i class="fa-regular fa-paper-plane"></i></button>
				    </div>
				</form>
			</div>
		</div>
	</div>
</div>