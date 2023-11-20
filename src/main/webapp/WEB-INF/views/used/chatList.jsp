 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat</title>

<style>

.disabled-link {
	pointer-events: none;
	color: gray;
}

.oneChat {
	display: flex;
}

.oneChat img {
	width: 120px;
	height: 100px; border : 1px solid black;
	margin: 10px;
	border: 1px solid black;
}

.user {
	margin-left: 10px;
	width: 100%;
}

h4 {
	margin: 10px 0px 5px;
}

a:hover {
	transition: ease 1s;
	background-color: #ffebea;
}

a {
	text-decoration: none;
	color: black;
	display: block;
	width: 100%;
	height:120px;
}
</style>

<c:set var="cpath" value="${pageContext.request.contextPath }" />
</head>
<body>

<div id="chat-list">
<c:if test="${list != null }">
	<h4>*탈퇴한 회원의 채팅방은 확인 불가</h4>
	<c:forEach var="vo" items="${list }">
	<hr>
			<a href="${cpath }/chat/${u_seq}?m_seq=${vo.m_seq}" class="${vo.m_active_status==1?'disabled-link':'' }">
				<div class="oneChat">
					<c:if test="${vo.m_img != null }">
						<img src="${cpath }/resources/member/${vo.m_img}">
					</c:if>
					<c:if test="${vo.m_img == null }">
						<img src="${cpath }/resources/used/no-image.png">
					</c:if>
					<div class="user">
						<h4>${vo.m_nickname }</h4>
						<div>${vo.addr3_name }&nbsp;.&nbsp;${vo.chat_when }</div>
						<br>${vo.chat_content }
					</div>
				</div>
			</a>
			<hr>
		</c:forEach>
		</c:if>
		<c:if test="${list == null }">
		<h4>채팅방이 존재하지 않습니다.</h4>
		</c:if>
</div>

</body>
</html> 