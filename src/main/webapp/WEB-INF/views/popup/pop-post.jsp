<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
	String email5 = (String)session.getAttribute("email");
	String nickname1 = (String)session.getAttribute("nickname");
	Integer artistIdObj = (Integer) session.getAttribute("artist_id");
	int artist_id = artistIdObj;
	

%>

<div class="wrap">
	<div class="topArea">
		<div class="title">
			<p>포스트 쓰기</p>
			<p class="artiName">Newjeans</p>
		</div>
		<button type="button" class="btn-i-close" onclick="popPostHide();"></button>
	</div>
	<div class="cntArea">
		<form action="/community/postWrite" method="post" autocomplete="off">
			<input type="hidden" name="email" value="<%=email5%>">
			<input type="hidden" name="artist_id" value="<%=artist_id %>">
			<input type="hidden" name="nickname" value="<%=nickname1 %>">
			<textarea class="txtBx" name="content"></textarea>
			<div class="btmBx">
				<div class="imgBx">
					<input type="file" id="file" name="post_img" accept=".jpg, .jpeg, .png, .gif" hidden multiple>
					<button type="button" class="btn-under" onclick="$('#file').click();">첨부파일 선택</button>
					<div class="fileName"></div>
				</div>
				<button type="submit" class="btn-full">등록</button>
			</div>
		</form>
	</div>
</div>