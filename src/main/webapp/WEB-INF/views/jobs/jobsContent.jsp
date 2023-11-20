<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header3.jsp"%>

<script type="text/javascript">
    function confirmApp() {
        if (confirm("지원하시겠습니까?")) {
        	var j_seq =document.getElementById("j_seq").value;        	
        	var m_seq =document.getElementById("m_seq").value; 
        	
        	var param ="j_seq="+j_seq+"&m_seq="+m_seq; 
        	
        	var url="${cpath}/jobs/enter";
        	
        	sendRequest(url,param,function(){
        		if(xhr.readyState === 4 && xhr.status === 200){
        		
        			var data = xhr.responseText;
        			if(data !=0){
        				alert("지원을 완료했습니다!");
        				location.reload();
        			}else{
        				alert("지원에 실패했습니다.");
        			}
        		}
        	},
        	"POST");
        	
        	        
        }
    }
    
    function deleteApp() {
    	
    	if (confirm("지원을 취소하시겠습니까?")) {
        	var j_seq =document.getElementById("j_seq").value;        	
        	var m_seq =document.getElementById("m_seq").value;        	
        	var param ="j_seq="+j_seq+"&m_seq="+m_seq; 
        	var url="${cpath}/jobs/enter";
        	
        	sendRequest(url,param,function(){
        		if(xhr.readyState === 4 && xhr.status === 200){
        			var data = xhr.responseText;
        			if(data !=0){
        				alert("지원을 취소했습니다!");
        				location.reload();
        			}else{
        				alert("지원취소에 실패했습니다.");
        			}
        		}
        	},
        	"POST");
  	        
        }
		
	}
    
    function fav() {
    	
    	var j_seq =document.getElementById("j_seq").value;        	
    	var m_seq =document.getElementById("m_seq").value;      
    	var param ="j_seq"+j_seqd&"m_seq"+m_seq;
    	var url="${cpath}/jobs/fav";
    	
    	sendRequest(url,param,function(){
    		if(xhr.readyState === 4 && xhr.status === 200){
    			var data = xhr.responseText;
    		}
    		
    		
    		
    	},
    		"POST");
    	
	
	}
</script>

<div>알바 게시물 상세</div>


<input type="hidden" id="m_seq" name="m_seq" value="${login}">
<input type="hidden" id="j_seq" name="j_seq" value="${jvo.j_seq }">

	<div class="job-post">
		<div class="job-image">
			<img src="${cpath}/resources/jobs/${jvo.j_img}"style="width: 200px;"
				  name="j_img" value="${jvo.j_img}"><br>
		</div>
		<h3>${jvo.j_title}</h3>
		<label>하는 일</label><br>
		<br>
		<!-- 등록할 때 선택한 하는 일 -->
		<c:forEach var="jcnvo" items="${jcnlist}" varStatus="loop">
			<div style="display: inline-block;">[${jcnvo.j_cate_name}]${not loop.last ? ',':'' }</div>
		</c:forEach>
		<br>

		<div class="job-pay">
			<p class="job-pay">
				시급: <span class="hourly-pay">${jvo.j_pay}</span>원
			</p>
		</div>
		<br>
		<div>
			<label>${jvo.j_long == '1' ? '단기' : '장기'}</label>
			<c:forEach var="jtvo" items="${jtlist }" varStatus="loop">
				<p style="display: inline-block;">${jtvo.j_time_type}${not loop.last ? ',':'' }</p>
			</c:forEach>
			<label>${jvo.j_time_nego == 0 ? '협의가능' : '협의 불가능' }</label>
		</div>
		<br>
		<div>
			<p>${jvo.j_start}~${jvo.j_finish}</p>
		</div>
		<br>

		<p>${jvo.j_details}</p>
		<div class="job-location">${jvo.addr1_name}${jvo.addr2_name}
			${jvo.addr3_name}</div>
		<div>${jvo.addr_details}</div>
	</div>
	<br>
	<div>
		${jvo.j_tel}
		<div>${jvo.j_tel_status == 0 ? '전화 가능' : '전화 불가능'}</div>
	</div>
	<p>
		<span>지원자 ${appCount}</span> <span>조회 ${jvo.j_hit}</span>  <span>좋아요 </span> <br>
		
	
			<c:choose>
            <c:when test="${jvo.m_seq == login }">
               
                <input type="button" value="지원하기" id="apply" onclick="confirmApp()" style="display: none;">
            </c:when>
            <c:when test="${!empty apvo}">
                <input type="button" value="지원하기" id="apply" onclick="confirmApp()" disabled="disabled">
                <input type="button" value="지원취소하기" id="apply" onclick="deleteApp()" >
            </c:when>
             <c:when test="${empty aplvo}">
             
                <input type="button" value="지원하기" id="apply" onclick="location.href='${cpath}/jobs/applyform?m_seq=${login }'">
            </c:when>
         
            <c:otherwise>
                <input type="button" value="지원하기" id="apply" onclick="confirmApp()">
            </c:otherwise>
            
        </c:choose>
		
	</p>
	<div>
	<input type="button" onclick="fav()" value="좋아요">
	</div>


<c:if test="${jvo.m_seq != login }">
<input type="button" value="지원내역 가기" onclick="location.href='${cpath}/jobs/applyList?m_seq=${login}'">
</c:if>
<c:if test="${jvo.m_seq == login }">
<input type="button" value="목록으로" onclick="history.back();">
</c:if>

<script type="text/javascript">

    const hourlyPayElements = document.querySelectorAll(".hourly-pay");
    hourlyPayElements.forEach(element => {
        const j_pay = element.textContent;
        const formatted_jpay = new Intl.NumberFormat().format(Number(j_pay));
        element.textContent = formatted_jpay;
    });
 
</script>

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>








