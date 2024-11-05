<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/layout.jsp" %>

<body>
	<div class="inner admin login">
		<div class="container">
			<div class="wrap">
				<h1 class="logo">HeartBeat 관리자 페이지</h1>
				<div class="loginCnt">
					<form autocomplete="off">
						<div id="id" class="item">
							<p>이메일</p>
							<input type="text" class="txtBx" placeholder="E-mail 입력">
							<p class="error">이메일을 확인해주세요.</p>
						</div>
						<div id="password" class="item">
							<p>비밀번호</p>
							<input type="password" class="txtBx" placeholder="비밀번호 입력">
							<p class="error">비밀번호를 확인해주세요.</p>
						</div>
					</form>
					<button type="button" id="btnLogin" class="btn-full en">Login</button>
				</div>
			</div>
		</div>

	</div>
	<div class="dimmed"></div>
</body>
</html>