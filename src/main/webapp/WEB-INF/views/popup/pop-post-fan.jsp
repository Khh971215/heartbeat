<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String email = (String)session.getAttribute("email");
	String nickname2 = (String)session.getAttribute("nickname");
	
%>

<div class="wrap">
	<div class="topArea">
		<button type="button" class="btn-i-close" onclick="popPostFanHide();"></button>
	</div>
	<div class="cntArea">
		<div class="postBx">
			<div class="arti-comment">
				<div class="arti-top">
					<div class="arti-profile"><img src="#none" onerror=this.src="${pageContext.request.contextPath}/img/user.png" class="arti-thumb" alt="닉네임1"></div>
					<span class="arti-mark"><span class="blind">artist</span></span>
					<span class="arti-name"> ${PostVO.nickname }</span>
					<span class="arti-date"><fmt:formatDate value="${PostVO.post_date}" pattern="yy-MM-dd HH:mm"/></span>
				</div>
				<div class="arti-cnt">
					<div class="txt">${PostVO.content}</div>
				</div>
			</div>
		</div>
		<div class="replyBx">
			<div class="top">
				<div class="count">
					<div class="comm"><i class="num">${totalComment }</i>개의 댓글</div>
					<button type="button" class="btn-i-reset"><i class="fa-solid fa-rotate-right"></i></button>
				</div>
			</div>
			<div class="reply">
				<c:forEach items="${commentList }" var="commentVO">
					<div class="list">
						<div class="postBx">
							<div class="fan-profile">
								<img src="#none" onerror=this.src="${pageContext.request.contextPath}/img/user.png" class="fan-thumb" alt="닉네임1">
								<span class="nickname">${commentVO.nickname }</span>
								<div class="date"><fmt:formatDate value="${commentVO.comment_date}" pattern="yy-MM-dd HH:mm"/></div>
								<c:if test="${commentVO.nickname eq nickname}">
								<form action="/community/commentdelete" method="post">
								<input type="hidden" name="comment_id" value="${commentVO.comment_id }">
								<button type="submit">삭제</button>
								</form>
								</c:if>
							</div>
							<div class="fan-comment">
								<div><div>${commentVO.comment }</div></div>
							</div>
							
						</div>
					</div>
				</c:forEach>				
				<form action="/community/commentWrite" method="post">
					<input type="hidden" name="post_id" value="${PostVO.post_id}"/>
					<input type="hidden" name="email" value="<%=email %>"/>
					<input type="hidden" name="nickname" value="<%=nickname2 %>"/>
					<div class="input">
						<input type="text" class="txtBx" name="comment" placeholder="댓글을 입력하세요." autocomplete="off">
						<button type="submit" class="btn-i-send"><i class="fa-regular fa-paper-plane"></i></button>
					</div>				
				</form>
			</div>
		</div>
	</div>
</div>