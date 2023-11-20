<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<style>
.used-banner {
	background-color: #FECCBE;
	width: 100%;
	padding: 10px;
}

.used-banner form {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
	align-content: center;
	align-items: center;
}

.used-banner form select {
	margin-right: 10px;
}

#key {
	border: 0px;
	background-color: #FCEFF3;
	border-radius: 10px;
	width: 300px;
	display: flex;
	text-align: center;
}

#key::placeholder {
	color: lightgray;
	font-weight: bold;
	font-size: 15px;
}

.menu-bar {
	background-color: transparent;
	width: 100px;
	padding: 0px;
	position: sticky;
	/* left: 380px; */
	top:300px;
	z-index: 100;
	position: fixed;
}

.menu-bar li:first-child a {
	font-weight: bold;
	color: #BE3455;
	font-size: 17px;
	background-color: white;
	border-bottom: 1px solid gray;
}

.menu-bar ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.menu-bar li {
	margin-bottom: 5px;
	font-size: 14px;
}

.menu-bar a {
	text-decoration: none;
	color: #333;
	display: block;
	padding: 5px;
	width: 100px;
}

.menu-bar a:hover, .menu-bar a:focus, .menu-bar a:active{
    background-color: #FCEFF3;
}

.used-list {
	margin-top: 40px;
	width: 1224px;
	display: flex;
	flex-direction: row;
}

.used-body {
	margin: 0px 30px 30px 30px;
	display: flex;
	flex-direction: column;
	width: 1024px;
	align-items: center;
}
</style>

<script type="text/javascript">
	function check(f){
		var key = f.key;
		if(key.value==''){
			alert("키워드를 입력한 뒤 검색하세요.");
			key.focus();
			return false;
		}
		return true;
	}
</script>
	
	
<div class="used-banner">
	<h1>우리 동네에서 다양한 물건을 찾아보세요!</h1>
	<form action="${cpath }/used/search" onsubmit="return check(this)">
		<select name="which">
			<option value="key" ${which eq 'key' ? 'selected':'' }>키워드</option>
			<option value="addr" ${which eq 'addr' ? 'selected':'' }>지역</option>
		</select>
		<input type="text" id="key" name="word" placeholder="키워드 또는 지역 입력" value="${word != ''? word:'' }" autocomplete="off">
		<button type="submit">검색</button>
	</form>
	<div>
</div>
</div>
<div class="used-list">
	<div class="menu-bar">
		<ul>
			<li><a href="${cpath }/used">중고거래</a></li>
			<li><a href="${cpath }/used/0">인기매물</a></li>
			<li><a href="${cpath }/used/1">디지털기기</a></li>
			<li><a href="${cpath }/used/2">유아동</a></li>
			<li><a href="${cpath }/used/3">의류/잡화</a></li>
			<li><a href="${cpath }/used/4">가구/생활가전</a></li>
			<li><a hrref="${cpath }/used/5">생활/주방</a></li>
			<li><a href="${cpath }/used/6">가공식품</a></li>
			<li><a href="${cpath }/used/7">스포츠/레저</a></li>
			<li><a href="${cpath }/used/8">취미/게임/음반</a></li>
			<li><a href="${cpath }/used/9">도서</a></li>
			<li><a href="${cpath }/used/10">뷰티/미용</a></li>
			<li><a href="${cpath }/used/11">기타 중고물품</a></li>
			<li><a href="${cpath }/used/12">삽니다</a></li>
		</ul>
	</div>
<div class="used-body">
