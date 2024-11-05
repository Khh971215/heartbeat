<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrap">
	<div class="topArea">
		<div class="title">이메일 찾기</div>
		<button type="button" class="btn-i-close" onclick="popFindIdHide();"></button>
	</div>
	<div class="cntArea">
		<div class="findCnt">
			<form autocomplete="off">
				<input type="text" class="txtBx" placeholder="이름 입력">
				<input type="number" class="txtBx" placeholder="생년월일 6글자 입력">
				<input type="number" class="txtBx" placeholder="핸드폰번호 입력">
				<button type="button" class="btn-border" onclick="resultShow();">이메일 찾기</button>
			</form>
		</div>
		<div class="resultCnt">
			<p class="txt">
				<i id="userName">홍길동</i>님의 이메일은 <i id="findId">abcd@google.com</i>입니다.
			</p>
		</div>
	</div>
</div>