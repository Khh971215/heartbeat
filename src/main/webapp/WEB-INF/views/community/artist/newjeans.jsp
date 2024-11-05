<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/layout.jsp" %>
<% 
	request.setAttribute("artistPage", "artist");
%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vendor/slick.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/vendor/slick-theme.css">
<script src="${pageContext.request.contextPath}/js/vendor/slick.min.js"></script>

<body>	
	<script>
		$(function(){
			slick();
		});
		function slick(){
			$('.slideBx').slick({
				infinite: true,
				slidesToShow: 3,
				slidesToScroll: 3,
				swipe: true,
				arrows: true,
				dots: false,
				variableWidth: false,
				adaptiveHeight: true
			});
		};

		//팝업 아티스트포스트
		function popPostArtistShow(post_id){
			 // AJAX 요청으로 데이터를 가져옵니다.
		    $.post("/community/getPost", { post_id: post_id }, function(data) {
		    	// 기존의 cntArea를 비우지 않고 데이터를 추가하거나 수정합니다.
		        const newContent = $(data).find('.cntArea').html(); // JSP에서 cntArea만 가져오기
		        $('.pop-post-artist .cntArea').html(newContent);
		        
		        
		        // 팝업을 보여줍니다.
		    }).fail(function() {
		        console.error('Error loading post data.');
		    });
			
			$('.pop-post-artist').show();
			$('.dimmed').show();
		}
		function popPostArtistHide(){
			$('.pop-post-artist').hide();
			$('.dimmed').hide();
		}
		
		//아티스트 포스트 하트 토글
		function likeToggle(e){
			$(e).toggleClass('on');
		}

		//팝업 팬포스트작성
		function popPostShow(){
			$('.pop-post').show();
			$('.dimmed').show();
			//uploadFileName();
			multipleUploadFile();
		}
		function popPostHide(){
			$('.pop-post').hide();
			$('.dimmed').hide();
		}

		//팝업 팬포스트
		function popPostFanShow(post_id){
			 // AJAX 요청으로 데이터를 가져옵니다.
		    $.post("/community/getPost", { post_id: post_id }, function(data) {
		    	// 기존의 cntArea를 비우지 않고 데이터를 추가하거나 수정합니다.
		        const newContent = $(data).find('.cntArea').html(); // JSP에서 cntArea만 가져오기
		        $('.pop-post-fan .cntArea').html(newContent);
		        
		        
		        // 팝업을 보여줍니다.
		    }).fail(function() {
		        console.error('Error loading post data.');
		    });
		        $('.pop-post-fan').show();
		        $('.dimmed').show();
			
			//uploadFileName();
			multipleUploadFile();
		}
		function popPostFanHide(){
			$('.pop-post-fan').hide();
			$('.dimmed').hide();
		}
	</script>
	
	<div class="inner service artist-newjeans" data-name="community">
		<%@ include file="../../include/menu.jsp" %>
		<div class="container">
			<div class="cntWrap">
				<h2 class="title"><%=pageTitle %></h2>
				<div class="cntArea">
					<div class="section-banner">
						<img src="${pageContext.request.contextPath}/img/artist/newjeans-header.jpg" alt="newjeans" class="thumb">
					</div>
					<div class="section-artist-post">
						<div class="artistWrap">
							<div class="slideBx">
							
								<c:forEach items="${newjinsPosts}" var="minjiVO">
									<div class="postBx">
									<form id="postFrm_${PostVO.post_id}" action="/community/getPost" method="post">
							                <input type="hidden" name="post_id" value="${minjiVO.post_id}"/>
											<a href="javascript:void(0);" onclick="popPostArtistShow('${minjiVO.post_id}');">
												<div>
													<div class="arti-profile"><img src="${pageContext.request.contextPath}/img/artist/nj_mj.jpeg" onerror=this.src="${pageContext.request.contextPath}/img/user.png" class="arti-thumb" alt="민지"></div>
													<div class="arti-comment">
														<div class="arti-top">
															<span class="arti-mark"><span class="blind">artist</span></span>
															<span class="arti-name">${minjiVO.nickname }</span>
														</div>
														<div class="arti-cnt">
															<div class="txt">${minjiVO.content }</div>
														</div>
													</div>
												</div>
											</a>
										</form>
									</div>
								</c:forEach>
								<div class="postBx">
									<a href="#none" onclick="popPostArtistShow();">
										<div>
											<div class="arti-profile"><img src="${pageContext.request.contextPath}/img/artist/nj_hanni.jpeg" onerror=this.src="${pageContext.request.contextPath}/img/user.png" class="arti-thumb" alt="하니"></div>
											<div class="arti-comment">
												<div class="arti-top">
													<span class="arti-mark"><span class="blind">artist</span></span>
													<span class="arti-name">하니</span>
												</div>
												<div class="arti-cnt">
													<div class="txt">모든 게 typical, so I've been praying so hard for a miracle 부르고 있어 나의 이름을 더는 안 봐 drama it's good karma Done scrolling thousand times 다 알고 있어 뻔한 수작일 뿐이야 완전 쉬운 공식이야, it's like biting an apple</div>
												</div>
											</div>
										</div>
									</a>
								</div>

							</div>
						</div>
					</div>
					<div class="section-fan-post">
						<div class="fanWrap">
							<div class="posting" onclick="popPostShow();">
								<p>당신의 아티스트에게 포스트를 남겨보세요.</p>
								<i class="i-img"><i class="fa-regular fa-image"></i></i>
							</div>
							<div class="postWrap">
								<c:forEach items="${newjinsfanPosts}" var="PostVO">
									<div class="postBx">
										<form id="postFrm_${PostVO.post_id}" action="/community/getPost" method="post">
							                <input type="hidden" name="post_id" value="${PostVO.post_id}"/>
											<a href="javascript:void(0);" onclick="popPostFanShow(${PostVO.post_id})" >
												<div>
													<div class="fan-profile">
														<img src="#none" onerror=this.src="${pageContext.request.contextPath}/img/user.png" class="fan-thumb" alt="닉네임1">
														<span class="nickname">${PostVO.nickname }</span>
														<div class="date"><fmt:formatDate value="${PostVO.post_date}" pattern="yy-MM-dd HH:mm"/></div>
													</div>
													<div class="fan-comment">
														<div class="fan-cnt">
															<img src="${pageContext.request.contextPath}/img/artist/newjeans.jpg" alt="newjeans"><br><br>
															<div class="txt">${PostVO.content }</div>
														</div>
													</div>
												</div>
											</a>				
										</form>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="pagination">
							<button type="button" class="btn-i-prev"></button>
							<ul class="page">
								<li class="num on">1</li>
								<li class="num">2</li>
								<li class="num">3</li>
								<li class="num">4</li>
								<li class="num">5</li>
							</ul>
							<button type="button" class="btn-i-next"></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="dimmed" onclick="popPostArtistHide();popPostHide();popPostFanHide();"></div>

	<!-- [D] 팝업 아티스트 포스트 -->
	<div class="popup pop-post-artist"><%@ include file="../../popup/pop-post-artist.jsp" %></div>
	<!-- [D] 팝업 팬 포스트 -->
	<div class="popup pop-post-fan"><%@ include file="../../popup/pop-post-fan.jsp" %></div>
	<!-- [D] 팝업 포스트작성 -->
	<div class="popup pop-post"><%@ include file="../../popup/pop-post.jsp" %></div>
</body>
</html>