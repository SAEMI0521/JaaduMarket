<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<div>
동네가게 게시물 상세 페이지
</div>
<input type="button" value="채팅" >
<input type="button" value="관심">
<input type="button" value="수정하기" onclick="location.href='${cpath}/stores/updateform'">
<input type="button" value="판매완료" onclick="location.href='${cpath}/stores/finish'">
<input type="button" value="삭제하기" onclick="location.href='${cpath}/stores/delete'">
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
