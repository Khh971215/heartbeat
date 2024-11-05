<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/layout.jsp" %>

<script>

</script>

<body>
	<div class="inner service login">
		<div class="container">
			<div class="wrap">
				<h1 class="logo">HeartBeat</h1>
				<div class="loginCnt">
					<form name="loginFrm" action="/loginPro" method="post">
						<div id="id" class="item">
							<p>이메일</p>
							<input type="text" name="email" class="txtBx" placeholder="E-mail 입력">
							<p class="error">이메일을 확인해주세요.</p>
						</div>
						<div id="password" class="item">
							<p>비밀번호</p>
							<input type="password" name="pwd" class="txtBx" placeholder="비밀번호 입력">
							<p class="error">비밀번호를 확인해주세요.</p>
						</div>
						<button type="submit" onclick="loginCheck()" id="btnLogin" class="btn-full en">Login</button>
					</form>
					<div class="btnBx">
						<button type="button" id="findId" class="btn-under-01" onclick="popFindIdShow();">이메일 찾기</button>
						<button type="button" id="findPwd" class="btn-under-01" onclick="popFindPasswordShow();">비밀번호 찾기</button>
						<a href="./join.html" id="btnJoin" class="btn-under-01">회원가입</a>
					</div>
				</div>
				<p class="line"><i>혹은</i></p>
				<div id="snsLogin" class="btnCnt">
					<button type="button" class="login-google"><i class="fa-brands fa-google"></i></button>
					<button type="button" class="login-spotify"><i class="fa-brands fa-spotify"></i></button>
				</div>
			</div>
		</div>

		<div class="dimmed" onclick="popFindIdHide();popFindPasswordHide();"></div>

		<!-- [D] 팝업 아이디찾기 -->
		<div class="popup pop-find-id" data-html="./popup/pop-find-id.html"></div>
		<!-- [D] 팝업 비밀번호찾기 -->
		<div class="popup pop-find-password" data-html="./popup/pop-find-password.html"></div>
	</div>

	<script>
		//팝업 아이디찾기
		function popFindIdShow(){
			$('.pop-find-id').show();
			$('.dimmed').show();
		}
		function popFindIdHide(){
			$('.pop-find-id').hide();
			$('.dimmed').hide();
		}

		//팝업 비밀번호찾기
		function popFindPasswordShow(){
			$('.pop-find-password').show();
			$('.dimmed').show();
		}
		function popFindPasswordHide(){
			$('.pop-find-password').hide();
			$('.dimmed').hide();
		}

		//비밀번호, 아이디 찾기 결과 보기
		function resultShow(){
			$('.resultCnt').show();
		}
	</script>
</body>
</html>