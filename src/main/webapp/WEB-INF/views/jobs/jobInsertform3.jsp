<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
body {
	font-family: Arial, sans-serif;
	text-align: center;
	margin: 20px;
}

label {
	font-weight: bold;
}

input[type="text"], input[type="number"], textarea {
	width: 300px;
	padding: 5px;
	margin-bottom: 10px;
}

textarea {
	height: 100px;
}

input[type="file"] {
	margin-bottom: 10px;
}

input[type="submit"], input[type="button"] {
	padding: 10px 20px;
	background-color: #007bff;
	border: none;
	color: #fff;
	cursor: pointer;
}

input[type="submit"]:hover, input[type="button"]:hover {
	background-color: #0056b3;
}

#file-upload-container {
	margin-bottom: 20px;
}

#photo-input, #insert {
	display: inline-block;
	vertical-align: middle;
}

#photo-input {
	margin-right: 10px;
}

#description-count {
	font-size: 12px;
	color: #888;
}

#depMsg {
	font-size: 14px;
	font-weight: bold;
}
</style>

<%@ include file="/WEB-INF/views/layout/header3.jsp"%>



<script type="text/javascript">
	//hidden으로 주소 정보 보내기
	function submitForm() {
		const j_name = document.getElementById("j_name").value;
		const addr_details = document.getElementById("addr_details").value;
		const addr3_name = document.getElementById("addr3_name").value;
		const title = document.getElementById("title").value;
		const long = document.getElementById("long");
		const short = document.getElementById("short");
		const j_time_type1 = document.getElementById("j_time_type1").value;//단기일때
		const j_start = document.getElementById("j_start").value;
		const j_finish = document.getElementById("j_finish").value;
		const jPayInput = document.getElementById("jPayInput").value;
		const j_details = document.getElementById("j_details").value;
		

		const j_nameInput = document.createElement("input");
		j_nameInput.type = "hidden";
		j_nameInput.name = "j_name";
		j_nameInput.value = j_name;

		const addr_detailsInput = document.createElement("input");
		addr_detailsInput.type = "hidden";
		addr_detailsInput.name = "addr_details";
		addr_detailsInput.value = addr_details;

		const form = document.getElementById("insert");
		form.appendChild(j_nameInput);
		form.appendChild(addr_detailsInput);
		
		//하는 일 체크 유무
		var checkboxes = document.querySelectorAll('input[name="j_cate_seq"]');
		var isChecked = false;
		
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				isChecked = true;
				break;
			}
		}
	
		
		//동의사항 체크 유무
		var termsCheckboxes = document.querySelectorAll('input[name="terms"]');
		var isAllChecked = true;

		for (var j = 0; j < termsCheckboxes.length; j++) {
			if (!termsCheckboxes[j].checked) {
				isAllChecked = false;
				break;
			}
		}
		//장기 일때 요일들 선택 여부
		const j_time_type2 = document.querySelectorAll("input[name='j_time_type2']");
		var islogtimechecked = false;
		
		for(var i=0; i<j_time_type2.length; i++){  //islogtimechecked 초기 값을 false로 설정하고 for문 안에서 하나라도 체크가 되어 있다면 true로 반환해야 하나만 체크가 되어도 다음 단계로 넘어갈 수 있음!
			if(j_time_type2[i].checked){
				islogtimechecked = true;
				break;
			}
			
		}
	
		if(j_name===''){
			alert("상호명을 입력해주세요!");
			return false;
		}else if(addr3_name===''){
			alert("주소를 검색해주세요!");
			return false;
		}else if(addr_details ===''){
			alert("상세 주소를 입력해주세요!");
			return false;
		}else if(title===''){
			alert("제목을 입력해주세요!");
			return false;
		}else if(title !== ''){
			if(!(title.length >=6 && title.length <= 30)){
				alert("제목은 6글자에서 30글자까지 입력 할 수 있습니다!!");
				return false;
			}
		}
		
		if (!isChecked) {
			alert("하는 일을 선택해주세요!");
			return false;
		}else if(!short.checked && !long.checked){ //논리연산자 && 둘 다 참일때 넘어감 not+not = true
			alert("일하는 기간을 선택해주세요!");
			return false;
		}else if(short.checked) {
			if(j_time_type1 === ''){
				alert("일하는 기간이 단기일때 날짜를 선택해주세요!");
				return false;
			}
			
		}else if(long.checked){
			if(!islogtimechecked){
				alert("일하는 기간이 장기일때 요일를 선택해주세요!");
				return false;
			}
			
		}
		if(j_start === '' || j_finish===''){ //왜 안되지..?
			alert("시작 시간과 종료시간을 입력해주세요!");
			return false;
		}else if(jPayInput ===''){
			alert("시급을 입력해주세요!");
			return false;
		}else if(j_details === ''){
			alert("상세내용을 입력해주세요!");
			return false;
		}
		else if (!isAllChecked) {
			alert("자두 알바 준수 사항에 모두 동의해주세요!");

		} else {

			form.submit();
		}
	}

	//시급 유효성
	function updateWageMessage() {
		const jPayInput = document.getElementById("jPayInput");
		const minWageMessage = document.getElementById("min-wage-message");
		const jPayInputRegex = /^[0-9]+$/;

		const wage = parseInt(jPayInput.value);
		if (wage < 9620) {
			minWageMessage.style.color = "red";
			minWageMessage.textContent = "2023년 최저 시급은 9,620원 입니다!";
		} else {
			minWageMessage.style.color = "grey";
			minWageMessage.textContent = "2023년 최저 시급은 9,620원 입니다.";
		}
		if (!jPayInputRegex.test(jPayInput.value)) {
			alert("시급은 숫자로 입력하셔야 합니다!");
		}

	}
</script>


<br>
<label>일할 장소에 대해 알려주세요</label>
<br>
<br>
<label>상호명(일하는 곳)</label>
<br>
<br>
<input type="text" name="j_name" id="j_name" placeholder="예) 자두가게" />
<br>
<label>주소</label>

<form action="${cpath}/jobs/addr3Search" method="post">
	<c:choose>
		<c:when
			test="${advo.addr1_name != null && advo.addr2_name != null && advo.addr3_name != null}">
			<input type="text" name="addr3_name" size="60px" id="addr3_name"
				value="${advo.addr1_name} ${advo.addr2_name} ${advo.addr3_name}" />
		</c:when>
		<c:otherwise>
			<input type="text" placeholder="동,읍,면으로 검색(ex.서초동)" name="addr3_name"
				size="60px" id="addr3_name" />
		</c:otherwise>
	</c:choose>
	<input type="submit" value="검색">
</form>

<label>주소 상세</label>
<input type="text" name="addr_details" id="addr_details">
<br>

<form action="${cpath}/jobs/jobInsertCheck" method="post"
	enctype="multipart/form-data" accept="image/*" id="insert">

	<input type="hidden" name="addr3_name" value="${advo.addr3_name}" />
	<input type="hidden" name="m_seq" value="${mvo.m_seq}" />
	


	<div id="file-upload-container">
		<label>(선택) 일하는 공간이나 일과 관련된 사진을 올려보세요 </label><br>
		<br>
		<div class="photo-Input">
			사진:<input type="file" name="photo" id="photo-input">&nbsp
			&nbsp&nbsp &nbsp &nbsp<br>
			<button type="button" onclick="clearPhotoInput()">삭제</button>
			&nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
			&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
			&nbsp&nbsp &nbsp &nbsp &nbsp

		</div>
	</div>

	<p>
	<div>
		<label>제목</label> <input type="text"
			placeholder="구인 내용 요약 최소 6글자에서 최대 30자까지 입력할 수 있어요" name="j_title"
			id="title" style="width: 500px;">
	</div>

	<div>
		<label>하는 일(최대 3개)</label><br>
		<br>
		<c:forEach var="jcvo" items="${jclist}" varStatus="loop">
			<input type="checkbox" name="j_cate_seq" value="${jcvo.j_cate_seq}"
				onclick="limitCheckboxSelection(this, 3)">
				${jcvo.j_cate_name}
				<c:if test="${loop.index % 5 == 4}">
				<br>
			</c:if>
		</c:forEach>
	</div>
	<br>
	<div>
		<label>일하는 기간</label><br>
		<br> <input type="radio" name="j_long" value="1"onclick="showDateSelection()" id="short">단기 
			<input type="radio" name="j_long" value="0" onclick="showDaySelection()" id="long">1개월 이상<br>
		<div id="dateSelection" style="display: none;">
			<label>일하는 날짜</label><br>
			<div id="selectedDatesContainer">
				<input type="date" name="j_time_type1" id="j_time_type1">
			</div>
			<button type="button" onclick="addDateInput()">날짜 추가</button>
			<br>
		</div>

		<div id="daySelection" style="display: none;">
			<label>일하는 요일</label><br>
			<c:forEach var="d" items="${dlist}">
				<input type="checkbox" name="j_time_type2" id="j_time_type2" value="${d.day_name}">${d.day_name}
    </c:forEach>
		</div>
		<br> <label>일하는 시간</label><br>
		<br> 시작: <input type="time" name="j_start" id="j_start"> 
			 종료: <input type="time" name="j_finish" id="j_finish"><br>
		<br> <input type="checkbox" name="j_time_nego" value="0">협의
		가능<br> <input type="hidden" name="j_time_nego" value="1"><br>
		<label>시급</label><br> 시급: 
		<input type="number" name="j_pay" 
			min="0" id="jPayInput" oninput="updateWageMessage()">원<br>
		<span id="min-wage-message">2023년 최저시급은 9,620원입니다.</span>
	</div>

	<div>
		<br> <label>상세내용</label><br>
		<br>
		<textarea rows="8" cols="50"
			placeholder="예)업무 예시,근무 여건, 지원자가 갖추어야 할 능력, 우대 사항 등" name="j_details" id="j_details"
			oninput="countCharacters()"></textarea>
		<br> <span id="description-count">0/2000</span><br> <span
			id="depMsg" style="display: none; color: red;">상세내용을 입력해주세요!</span>
	</div>
	<br> <label>연락처</label> <input type="text" name="j_tel"
		value="${mvo.m_tel1}${mvo.m_tel2}${mvo.m_tel3}"><br> <input
		type="checkbox" name="j_tel_status" value="1">전화 안 받기<br>
	<input type="hidden" name="j_tel_status" value="0"><br>


	<div>
		<label>당근 알바 준수 사항 동의</label> <br>
		<c:forEach var="ter" items="${tlist}">
			<input type="checkbox" name="terms" value="${ter.terms_title}">
			<label for="terms">${ter.terms_title}</label>
			<br>
		</c:forEach>
	</div>
	<br>

	<div>
		<input type="button" id="insert" onclick="submitForm();"
			value="공고 올리기" />
	</div>
</form>



<script type="text/javascript">
	function clearPhotoInput() {
		photoInput = document.getElementById("photo-input");
		photoInput.value = null;

	}

	//하는일 최대 3개
	function limitCheckboxSelection(checkbox, limit) {
		var checkedBoxes = document
				.querySelectorAll('input[name="j_cate_seq"]:checked');
		if (checkedBoxes.length > limit) {
			checkbox.checked = false;
		}
	}

	//

	//글자수 체크
	function countCharacters() {
		const textarea = document.querySelector("textarea[name='j_details']");
		const countSpan = document.getElementById("description-count");
		const maxLength = 2000;
		const currentLength = textarea.value.length;

		countSpan.textContent = currentLength + "/" + maxLength;

		if (currentLength > maxLength) {
			textarea.value = textarea.value.substring(0, maxLength);
			alert("최대 2000자 까지 작성하실 수 있습니다!");
		}
	}

	function showDateSelection() {
		document.getElementById("dateSelection").style.display = "block";
		document.getElementById("daySelection").style.display = "none";
	}

	function showDaySelection() {
		document.getElementById("dateSelection").style.display = "none";
		document.getElementById("daySelection").style.display = "block";
	}

	//날짜추가
	function addDateInput() {

		const selectedDatesContainer = document
				.getElementById("selectedDatesContainer");

		const newDateInput = document.createElement("input");
		newDateInput.type = "date";
		newDateInput.name = "j_time_type1";

		selectedDatesContainer.appendChild(newDateInput);
	}
</script>

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>