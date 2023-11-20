<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/used.css">
<script type="text/javascript">
  $(document).ready(function() {
    var topSelect = document.getElementById("cate");
    var subSelect = document.getElementById("subSelect");
    var textInput = document.getElementById("textInput");
    var summernoteElement = document.getElementById("summernote");
    var summernoteInstance;
    var middle = document.getElementById("middleCate");

    function cateChange() {
      var selecCate = topSelect.value;
      var placeholderText = "";

      // 선택한 카테고리에 따라 placeholder를 설정합니다.
      if (selecCate === "1" || selecCate === "5" || selecCate === "7") {
        placeholderText = "모델명, 구성품, 구매 시기, 사용감(흠집, 파손 여부, 수리 여부), 전자파 인증번호 등";
      } else if (selecCate === "2" || selecCate === "3") {
        placeholderText = "사이즈, 구매 시기, 사용감(색바램, 얼룩, 뜯어짐) 등";
      } else if (selecCate === "4") {
        placeholderText = "모델명, 구매 시기, 크기(가로/세로/높이), 사용감(흠집, 파손 여부) 등";
      } else if (selecCate === "6") {
        placeholderText = "구매시기, 유통기한 등\r\n※ 의약품, 건강기능식품은 관련법에 따라 판매할 수 없어요. 의약품, 건강기능식품 라벨이 제품에 표시되어 있는지 반드시 확인해주세요.\r\n※ 직접 만든 수제식품은 판매할 수 없어요.\r\n※ 유통기한이 지나거나 개봉한 식품은 판매할 수 없어요.";
      } else if (selecCate === "8") {
        placeholderText = "구매 시기, 사용감(흠집, 파손 여부, 상세 사진)등\r\n※ 게임, OTT 서비스 등의 계정 정보는 공유하거나 판매할 수 없어요.";
      } else if (selecCate === "9") {
        placeholderText = "권수(전집의 경우 누락 여부), 사용감(찢김, 색바램, 낙서) 등";
      } else if (selecCate === "10") {
        placeholderText = "구매 시기, 제조일자 또는 유통기한, 사용감(파손 여부) 등\r\n※ 화장품 샘플은 판매할 수 없어요.";
      } else if (selecCate === "11") {
        placeholderText = "구매 시기, 사용감(흠집, 파손 여부) 등";
      } else {
        placeholderText = "제품명, 브랜드 등 자세하게 적을수록 좋아요.";
      }
      placeholderText += "\r\n\r\n신뢰할 수 있는 거래를 위해 자세한 정보를 제공해주세요. 과학기술정보통신부, 한국인터넷진흥원이 함께 해요.";

      document.getElementById("content").setAttribute("placeholder", placeholderText);

      var options2 = document.getElementsByName("2");
      var options3 = document.getElementsByName("3");
      var options9 = document.getElementsByName("9");
      
      // 하위 카테고리 체크박스 또는 입력 칸 표시
      if (selecCate == "2" || selecCate=="9") {
        subSelect.style.display = "block";
        textInput.style.display = "none";
        if(selecCate == "2"){
        	options2.forEach(function(option) {
        		  option.style.display = "block";
        		});
        	options3.forEach(function(option) {
        		  option.style.display = "none";
        		});
        	options9.forEach(function(option) {
        		  option.style.display = "none"; 
        		});
        }else{
           	options2.forEach(function(option) {
           		  option.style.display = "none";
           		});
           	options3.forEach(function(option) {
           		  option.style.display = "none";
           		});
           	options9.forEach(function(option) {
           		  option.style.display = "block"; 
           		});       	
        }
      } else if(selecCate=="1" || selecCate=="4" || selecCate=="10"){
        subSelect.style.display = "none";
        textInput.style.display = "block";
      } else if(selecCate=="3"){
    	subSelect.style.display = "block";
    	textInput.style.display = "block";  
    	
    	options2.forEach(function(option) {
  		  option.style.display = "none";
  		});
  		options3.forEach(function(option) {
  		  option.style.display = "block";
  		});
  		options9.forEach(function(option) {
  		  option.style.display = "none"; 
  		});  
      } else{
        subSelect.style.display = "none";
        textInput.style.display = "none";
      }

    }
    
    topSelect.addEventListener("change", cateChange);

    cateChange();
  });
  
  
  
  function check(f){
	  var title = f.u_title;
	  var price = f.u_price;
	  var price_pattern = /^[0-9]*$/;
	  var content=f.u_content;
	  var addr_main = f.u_addr_main.value;
	  var addr_sub = f.u_addr_sub.value;
	  
	  if(addr_main=='' && addr_sub!=''){
		  alert('거래장소 설정을 희망하는 경우 검색 결과와 함께 입력해주세요!\r\n일치하는 검색결과가 없을 경우 대략적인 주소로 설정해주세요.');
		  return false;
	  }
	  
	  if(title.value==''){
		  alert("제목을 입력해주세요!");
		  title.focus();
		  return false;
	  }
	  if(price.value==''){
		  alert("가격을 입력해주세요!");
		  price.focus();
		  return false;
	  }
	  if(!price_pattern.test(price.value)){
		  alert("가격은 숫자만 입력하세요.");
		  price.focus();
		  return false;
	  }
	  if(content.value==''){
		  alert("내용을 자세히 적어주셔야 합니다!");
		  content.focus();
		  return false;
	  }
	  return true;
  }
  
  function shareThis() {
	  var share = document.getElementById("share").checked;
	  var price = document.getElementById("sharePrice");

	  if (share) {
	    price.disabled = true;
	    price.value = '0';
	  } else {
	    price.disabled = false;
	    price.value = '';
	  }
	}
  
 	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
						
					}
				}).open();
	} 
</script>

<div>
  <h1>중고거래 등록</h1>
  <hr>
</div>
<form method="POST" enctype="multipart/form-data" action="${cpath}/used/insert" onsubmit="return check(this)">
  <div>
    <label for="cate">카테고리</label>
    <select name="u_cate_seq" id="cate">
      <c:forEach var="vo" items="${clist }">
        <option value="${vo.u_cate_seq }">${vo.u_cate_name }</option>
      </c:forEach>
    </select>
    <input type="text" id="textInput" style="display: none;" placeholder="브랜드를 입력하세요.(선택사항)" width="auto" name="cate_input">
    <div id="subSelect" style="display: none;">
		<select name="cate_check_name">
			<option value="" selected>---선택하세요---</option>
			<c:forEach var="sub" items="${subList }">
				<option value="${sub.cate_check_name }" name="${sub.u_cate_seq }" style="display: none;">${sub.cate_check_name }</option>
			</c:forEach>
		</select>
	</div>
  </div>
  
  <div>
  	<h4>* 거래 희망 장소가 별도로 있는 경우 아래에서 선택 후 정해주세요!</h4>
		<input type="text" id="sample4_postcode" placeholder="우편번호">
		<input type="button" onclick="sample4_execDaumPostcode()"value="주소 찾기">
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소"> 
		<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="u_addr_main">
		<input type="text" placeholder="건물명 등 상세 장소" name="u_addr_sub">
		<span id="guide" style="color: #999; display: none"></span>
  </div>
  <table>
    <tr>
      <th>제목</th>
      <td><input type="text" name="u_title"></td>
    </tr>
    <tr>
      <th>가격</th>
      <td><input type="text" name="u_price" id="sharePrice">원</td>
    </tr>
    <tr>
      <th>나눔(나눔의 가격은 0원입니다.)</th>
      <td><input type="checkbox" name="u_share" value="1" onclick="shareThis()" id="share"></td>
    </tr>
    <tr>
      <th>추가할 내용</th>
      <td><textarea id="content" name="u_content" cols="100" rows="30"></textarea></td>
    </tr>
    <tr>
      <th>사진<br>(5개까지 첨부 가능/첫 번째 사진이 메인이 됩니다.)</th>
      <td>
        <c:forEach var="i" begin="1" end="5" step="1">
          <input type="file" name="photos" accept="image/*">
        </c:forEach>
      </td>
    </tr>
  </table>
  <button type="submit" >등록하기</button>
</form>

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
