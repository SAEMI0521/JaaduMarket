<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<div>
동네가게 게시물 페이지
</div>
<input type="button" value="비즈 등록하기" onclick="location.href='${cpath}/busi/insertform'">
<input type="button" value="게시물 올리기" onclick="location.href='${cpath}/stores/insertform'">
<input type="button" value="게시물 클릭" onclick="location.href='${cpath}/stores/content'">
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
