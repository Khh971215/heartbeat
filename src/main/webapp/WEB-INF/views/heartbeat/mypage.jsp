<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/layout.jsp" %>

<body>
	<script>
		$(function(){
			mypageTab();
			tabListShow();
		});

		function mypageTab(){
			$('.tabBtn .tab').on('click', function () {

				var tabName = $(this).attr('data-tab');

				$('.tabBtn .tab').removeClass('on');
				$('.tabCnt .cntBx').removeClass('on');
				$(this).addClass('on');
				$('.' + tabName).addClass('on');
			});
		}

		function tabListShow(){
			$('.tab-playlist .item .tit').on('click', function(){
				$(this).siblings('.list').children('.listWrap').toggle();
			})
		}
	</script>
	
	<div class="inner service mypage" data-name="mypage">
		<%@ include file="../include/menu.jsp" %>
		
		<div class="container">
			<div class="cntWrap">
				<h2 id="title" class="title"><%=pageTitle %></h2>
				<div class="cntArea">
					<div class="tabBtn">
						<ul>
							<li data-tab="tab-myinfo" class="tab on">내 정보 변경</li>
							<li data-tab="tab-membership" class="tab">멤버십 변경</li>
							<li data-tab="tab-post" class="tab">작성글 확인</li>
							<li data-tab="tab-playlist" class="tab">플레이리스트 확인</li>
						</ul>
					</div>
					<div class="tabCnt">
						<div class="cntBx tab-myinfo on">
							<div class="cnt">
								<ul class="itemWrap">
									<li class="item password">
										<p class="dt">비밀번호 변경</p>
										<div class="dd">
											<input type="password" class="txtBx" placeholder="현재 비밀번호 입력">
											<input type="password" class="txtBx" placeholder="새 비밀번호 입력">
											<input type="password" class="txtBx" placeholder="새 비밀번호 확인">
										</div>
									</li>
									<li class="item nickname">
										<p class="dt">닉네임 변경</p>
										<div class="dd">
											<input type="text" class="txtBx" placeholder="닉네임 입력">
											<button type="button" class="btn-border">중복확인</button>
										</div>
									</li>
									<li class="item image">
										<p class="dt">프로필 사진 변경</p>
										<div class="dd">
											<input type="file" hidden>
											<button type="button" class="btn-border" onclick="$(this).siblings('input').click();">사진 변경</button>
											<p class="file"><i>filenme.jpg</i></p>
										</div>
									</li>
									<li class="item">
										<p class="dt">회원 탈퇴</p>
										<div class="dd"><button type="button" class="btn-under-01" onclick="alert('정말 탈퇴하시겠습니까?')">탈퇴하기</button>
										</div>
									</li>
								</ul>
							</div>
							<div class="btnWrap">
								<button type="button" class="btn-full">저장</button>
								<button type="button" class="btn-border">취소</button>
							</div>
						</div>
						<div class="cntBx tab-membership">
							<div class="cnt">
								<div class="current">현재 사용하고 계신 이용권은 <i id="nowLevel">Level 1</i>입니다. <p>(이용기간 : <i>2024-08-29 ~ 2024-09-29</i>)</p></div>
								<ul class="itemWrap">
									<li class="item disabled">
										<p class="thumb"><i class="fa-solid fa-coins"></i></p>
										<p class="info">
											<span class="grade">Level 1</span>
											<span>단일 스트리밍 이용권</span>
										</p>
										<p class="price">3,900원</p>
										<button type="button" class="btn-full" disabled>구매하기</button>
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
						<div class="cntBx tab-post">
							<div class="cnt">
								<div class="btnWrap">
									<button type="button" class="btn-full">전체선택</button>
									<button type="button" class="btn-border">삭제</button>
								</div>
								<ul class="itemWrap">
									<li class="item">
										<input type="checkbox" class="check">
										<div class="num"><i>1</i></div>
										<a href="#none" class="tit">
											<i>게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다.</i>
										</a>
									</li>
									<li class="item">
										<input type="checkbox" class="check">
										<div class="num"><i>2</i></div>
										<a href="#none" class="tit">
											<i>게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다.</i>
										</a>
									</li>
									<li class="item">
										<input type="checkbox" class="check">
										<div class="num"><i>3</i></div>
										<a href="#none" class="tit">
											<i>게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다. 게시글 제목이 나옵니다. 길어지면 말줄임표로 나오고 클릭하면 해당 게시글로 이동합니다.</i>
										</a>
									</li>
								</ul>
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
						<div class="cntBx tab-playlist">
							<div class="cnt">
								<div class="btnWrap">
									<button type="button" class="btn-full">전체선택</button>
									<button type="button" class="btn-border">삭제</button>
								</div>
								<ul class="itemWrap">
									<li class="item">
										<input type="checkbox" class="check">
										<div class="num"><i>1</i></div>
										<div class="tit"><i>#신나는</i> <i>#운동</i> <i>#명상</i></div>
										<div class="date"><i>2024-08-27 18:11</i></div>
										<div class="list">
											<ul class="listWrap">
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
											</ul>
										</div>
									</li>
									<li class="item">
										<input type="checkbox" class="check">
										<div class="num"><i>2</i></div>
										<div class="tit"><i>#신나는</i> <i>#운동</i> <i>#명상</i></div>
										<div class="date"><i>2024-08-26 15:13</i></div>
										<div class="list">
											<ul class="listWrap">
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
											</ul>
										</div>
									</li>
									<li class="item">
										<input type="checkbox" class="check">
										<div class="num"><i>3</i></div>
										<div class="tit"><i>#신나는</i> <i>#운동</i> <i>#명상</i></div>
										<div class="date"><i>2024-08-25 06:55</i></div>
										<div class="list">
											<ul class="listWrap">
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
												<li><i>가수</i> - <i>노래제목</i></li>
											</ul>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>