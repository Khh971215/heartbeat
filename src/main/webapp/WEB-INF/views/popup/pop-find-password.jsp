<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrap">
	<div class="topArea">
		<div class="title">비밀번호 찾기</div>
		<button type="button" class="btn-i-close" onclick="popFindPasswordHide();"></button>
	</div>
	<div class="cntArea">
		<div class="findCnt">
			<form autocomplete="off">
				<input type="text" class="txtBx" placeholder="이메일 입력">
				<input type="text" class="txtBx" placeholder="이름 입력">
				<input type="number" class="txtBx" placeholder="생년월일 6글자 입력">
				<button type="button" class="btn-border" onclick="resultShow();">비밀번호 찾기</button>
			</form>
		</div>
		<div class="resultCnt">
			<p class="txt">
				<i id="userName">홍길동</i>님의 임시비밀번호 입니다. <br><i id="findPwd">abcd1234!</i>
			</p>
		</div>
	</div>
</div>