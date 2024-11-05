<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/layout.jsp" %>

<body>
	<div class="inner service membership" data-name="membership">
		<%@ include file="../include/menu.jsp" %>
		<div class="container">
			<div class="cntWrap">
				<h2 id="title" class="title"></h2>
				<div class="cntArea">
					<div class="section-membership">
						<div class="tit">지금 멤버십을 구독하세요! <br>Hot한 음악도 마음껏 듣고 내가 좋아하는 아티스트와 소통하고 팬들도 사귈 수 있는 기회!</div>
						<ul class="itemCnt">
							<li class="item">
								<p class="thumb"><i class="fa-solid fa-coins"></i></p>
								<p class="info">
									<span class="grade">Level 1</span>
									<span>단일 스트리밍 이용권</span>
								</p>
								<p class="price">3,900원</p>
								<button type="button" class="btn-full">구매하기</button>
							</li>
							<li class="item">
								<p class="thumb"><i class="fa-solid fa-coins"></i></p>
								<p class="info">
									<span class="grade">Level 2</span>
									<span>스트리밍 이용권 + 아티스트 구독</span>
								</p>
								<p class="price">6,900원</p>
								<button type="button" class="btn-full">구매하기</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="dimmed" onclick="popAlertCheckHide()"></div>
	
	<!-- [D] 팝업 로그아웃-->
	<div class="popup pop-alert-logout" data-html="../popup/pop-alert-logout.html"></div>
	<script></script>
</body>
</html>