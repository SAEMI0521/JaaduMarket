<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<script type="text/javascript">
	//유효성 검사
	function check(f) {
		var m_id = f.m_id.value;
		var password = f.password.value;
		
		if(m_id == ''){
			alert("ID를 입력하시오!");
			f.m_id.focus();
			return;
		}
		if(password == ''){
			alert("password를 입력하시오!");
			f.password.focus();
			return;	
		}
			f.action = "${cpath}/login/check";
			f.submit();
	}
</script>
<form method="post">
	<div align="center">
	<h2>로그인</h2>
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="m_id"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<th colspan="2" align="right">
					<span class="ckid">
						<c:choose>
							<c:when test="${check }">
								<input type="checkbox" name="ckid" value="true" checked="checked">
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="ckid" value="true">
							</c:otherwise>
						</c:choose>
							<font class="ckid_text">아이디 기억하기</font>
					</span>
						<input type="button" value="Login" onclick="check(this.form);">
				</th>
			</tr>
		</table>
	</div>
</form>
	<div class="find" align="center">
	<a href="${cpath}/login/findform?mode=m_id">ID찾기</a>
	<a href="${cpath}/login/findform?mode=password">PW찾기</a>
	<a href="${cpath}/member/insertform">회원가입</a>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>