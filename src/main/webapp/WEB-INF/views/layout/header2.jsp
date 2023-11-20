<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cpath" value="${pageContext.request.contextPath }" />



<!-- ///////////////////////////////////////////////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="${cpath}/resources/js/httpRequest.js"></script>

<!-- 지도api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc12c4a684add82a89a4d0e579d39bfc&libraries=services&autoload=false"></script>

<script type="text/javascript">
function notReady() {
  alert("현재 준비중인 페이지입니다. \r\n\r\n빠른 시일 내에 선보이겠습니다!");
}

</script>
<style>

.header, .footer {
	border: 1px black solid;
	width: 800px;
	height: 40px;
	font-weight: bold;
	text-align: center;
	padding-top: 12px;
}

#header {
	height: 100px;
	display: flex;
	justify-content: center;
	border-bottom: 1px solid gray;
}


#footer {
	background-color: white;
    color: gray;
    border-top: 1px solid gray;
    padding: 0 1.6rem;
    box-sizing: border-box;
    height:50px;
    width: 100%;
    max-width: 100vw;
    display: block;
}

#header-area2 {
	width: 200px;
	height: 15;
	display: flex;
	justify-content: flex-end;
	align-self: center;
	font-size: 14px;
}

#header-area1 {
	height: 85;
	width: 1024px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#footer-area1 {
	width: 1224px;
	height: 100px;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
}

#footer-area1 a {
	color: gray;
}

#footer-area2 {
	height:200px;
	width: 1224px;
	font: 14px "malgun gothic";
	text-align: center;
	margin-bottom:10px;
}

/* footer */

#footer-area1 {
	width: 1024px;
	height: 20%;
	display: flex;
	align-items: center;
	justify-content: center;
	padding-bottom: 20px;
	text-align: center;
	padding: 30;
	margin-right: 30px;
}

#footer {
	color: gray;
	height: 150px;
	display: flex;
	border-top: 1px solid gray;
	flex-direction: column;
	align-items: center;
	bottom: 0;
	left: 0;
	right: 0;
}

#footer-area1 a {
	color: gray;
	 position: relative;
}


#footer-area1 a:not(:last-child)::after {
  content: "|";
  margin: 0 30px; /* 원하는 간격 값으로 수정 */
  /*#footer-area1 내의 링크 요소들 중 마지막 요소를 제외한 요소들에게
   ::after 가상 요소를 추가하고, | 문자를 콘텐츠로 설정. 
    margin 속성을 사용하여 | 사이의 간격을 조절*/
}

#footer-area2 {
	width: 1024px;
	height: 60%;
	font: 14px "malgun gothic";
	text-align: center;
}


/*  */

#menu {
	font: bold 20px "malgun gothic";
	width: 1000px;
	height: 40px;
	text-align: endcenter;
	display: flex;
	align-items: center;
	line-height: 40px;
	justify-content: left;
	padding-left: 70px;
}

#menu ul li {
	list-style: none;
	color: black;
	display: inline-block;
	background-color: white;
	text-align: center;
}

#menu>ul>li>ul {
	width: 130px;
	display: none;
	position: absolute;
	font-size: 14px;
	text-align: center;
}

#menu>ul>li:hover>ul {
	display: block;
	align-self: center;
}

#menu>ul>li>a:hover {
	color: #BE3455;
}

#login-button {
	margin-left: auto;
}


#user-info-button {
	margin-left: 10px;
}

#main {
	padding: 30px;
	width: 100%;
	font: bold 15px "malgun gothic";
}

#main .content {
	height: 200px;
}

a:hover {
	color: #D7596A;
	transition: ease 1s;
}

a {
	text-decoration: none;
	color: black;
	display: block;
	width: 150px;
}


#header-area1 img {
	width: 180px;
	height: 70px;
}



#header-area2 img {
	width: 24px;
	margin-left: 8px;
}


input[type="button"] {
	background-color: #f2f2f2;
	color: #333;
	padding: 5px 10px;
	border: none;
	border-radius: 5px;
	margin: 5px;
	font-size: 16px;
	cursor: pointer;
}

input[type="button"]:hover {
	background-color: #edeaea;
}

#menu>ul>li>ul {
    width: 130px;
    display: none;
    position: absolute;
    font-size: 14px;
    text-align: center;

}

#logo{
 	width: 20%
 	
}
</style>

<title>자두마켓</title>
</head>
<body>
 	<div id="header">
		<div id="header-area1">
			<a href="${cpath }">
				<img src="${cpath }/resources/images/logo.png" /></a>
			<div id="menu">
				<ul>
					<li><a href="${cpath }/used">중고거래</a>
						<ul>
							<li><a href="${cpath }/used/0">인기매물</a></li>
							<li><a href="${cpath }/used/1">디지털기기</a></li>
							<li><a href="${cpath }/used/2">유아동</a></li>
							<li><a href="${cpath }/used/3">의류/잡화</a></li>
							<li><a href="${cpath }/used/4">가구/생활가전</a></li>
							<li><a href="${cpath }/used/5">생활/주방</a></li>
							<li><a href="${cpath }/used/6">가공식품</a></li>
							<li><a href="${cpath }/used/7">스포츠/레저</a></li>
							<li><a href="${cpath }/used/8">취미/게임/음반</a></li>
							<li><a href="${cpath }/used/9">도서</a></li>
							<li><a href="${cpath }/used/10">뷰티/미용</a></li>
							<li><a href="${cpath }/used/11">기타 중고물품</a></li>
							<li><a href="${cpath }/used/12">삽니다</a></li>
						</ul></li>
					<li><a href="${cpath }/views/makeBusi">동네가게</a>
						<ul>
							<%-- <li><a href="${cpath }/stores/1">음식점</a></li>
							<li><a href="${cpath }/stores/2">카페/디저트</a></li>
							<li><a href="${cpath }/stores/3">운동</a></li>
							<li><a href="${cpath }/stores/4">뷰티샵</a></li>
							<li><a href="${cpath }/stores/5">미용실</a></li> --%>
							
							<li><a onclick="category('음식점')" style="cursor:pointer;">음식점</a></li>
							<li><a onclick="category('카페/디저트')" style="cursor:pointer;">카페/디저트</a></li>
							<li><a onclick="category('운동')" style="cursor:pointer;">운동</a></li>
							<li><a onclick="category('뷰티샵')" style="cursor:pointer;">뷰티샵</a></li>
							<li><a onclick="category('미용실')" style="cursor:pointer;">미용실</a></li>
						</ul></li>
					<li><a href="${cpath }/jobs/list">알바</a></li>
					<li><a href="${cpath }/board/list">자유게시판</a></li>
				</ul>
			</div>
		</div>
			<c:if test="${login !=null }">
				<a href="${cpath }/member/mypage?m_seq=${login}">MyPage</a>
				<a href="javascript:logoutButton()" >로그아웃</a>
			</c:if>
			<c:if test="${login == null }">
				<a href="${cpath }/login/loginform">
				<img id="logo" src="${cpath }/resources/images/account.png" />로그인/회원가입</a>
			</c:if>
		</div>
	</div> 
	<div id="body">
	
	