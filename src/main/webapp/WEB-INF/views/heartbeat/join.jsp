<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/layout.jsp" %>

<body>
	<script>
		function popAlertCheckShow(){
			$('.pop-alert-check').show();
			$('.dimmed').show();
		}
		function popAlertCheckHide(){
			$('.pop-alert-check').hide();
			$('.dimmed').hide();
		}
	</script>
	
	<div class="inner service join">
		<div class="container">
			<div class="wrap">
				<h1 class="logo">HeartBeat</h1>
				<div class="joinCnt">
					<form action="joinPro.jsp" method="post" name="joinPro">
						<div class="inputBx">
							<p class="noti">*필수 입력 사항</p>
							<div class="doubleCheck">
								<input type="text" placeholder="* 이메일" class="txtBx">
								<button type="button" class="btn-border" onclick="popAlertCheckShow();">중복확인</button>
							</div>
							<p class="error">*비밀번호는 대문자 영어, 특수문자, 숫자를 포함하여 8~16자로 해주세요.</p>
							<input type="password" placeholder="* 비밀번호" class="txtBx">
							<p class="error">*입력하신 비밀번호가 틀립니다. 비밀번호를 확인하세요.</p>
							<input type="password" placeholder="* 비밀번호 확인" class="txtBx">
							<input type="text" placeholder="* 이름" class="txtBx">
							<input type="date" class="txtBx">
							<div class="doubleCheck">
								<input type="number" placeholder="* 휴대폰번호" class="txtBx">
								<button type="button" class="btn-border" onclick="popAlertCheckShow();">중복확인</button>
							</div>
							<div class="doubleCheck">
								<input type="text" placeholder="* 닉네임" class="txtBx">
								<button type="button" class="btn-border" onclick="popAlertCheckShow();">중복확인</button>
							</div>					
						</div>
						<div class="inputBx">
							<p class="noti">*선택 입력 사항</p>
							<div class="imgBx">
								<input type="file" id="file" accept=".jpg, .jpeg, .png" hidden>
								<button type="button" class="btn-under" onclick="$('#file').click();">프로필 사진 선택</button>
								<div class="fileName"><i>파일명이길어질때는말줄임표가나옵니다나옵니다나옵니다.png</i></div>
							</div>
							<select id="favorite" class="sltBx">
								<option value="artist1">아티스트1</option>
								<option value="artist2">아티스트2</option>
								<option value="artist3">아티스트3</option>
								<option value="artist4">아티스트4</option>
								<option value="artist5">아티스트5</option>
								<option value="artist6">아티스트6</option>
								<option value="artist7">아티스트7</option>
								<option value="artist8">아티스트8</option>
								<option value="artist9">아티스트9</option>
								<option value="artist10">아티스트10</option>
								<option value="none">선택안함</option>
							</select>
						</div>
						<button type="button" class="btn-full">회원가입</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="dimmed" onclick="popAlertCheckHide()"></div>

	<!-- [D] 팝업 중복확인 -->
	<div class="popup pop-alert-check"><%@ include file="../popup/pop-alert-check.jsp" %></div>
</body>
</html>