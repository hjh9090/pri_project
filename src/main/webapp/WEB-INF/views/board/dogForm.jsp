<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src = "<c:url value='/resources/jq/jquery-3.4.1.min.js'/>"></script>
<title>강아지 / 개 분양 게시판</title>
<script>
function goWrite() {
	location.href = "dogWrite";
	
}
function gohome(){
	location.href = "../";
}

</script>
</head>
<body>
<div class = "titleDiv">
<h1>분양 게시판에 오신 것을 환영합니다^^</h1>
</div>
<c:if test="${sessionScope.sessionid != null}">
<div class = "buttonDiv">
	<input type = "button" value = "글쓰기" onclick="goWrite()">
</div>
</c:if>

<div class = "mainDiv">
<table>
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>제목</td>
		<td>작성일</td>
	</tr>
	
<c:forEach var = "dog" items = "${list}">
	
	<tr onclick="location.href ='readDog?boardnum=${dog.boardnum}'" 
	style = "cursor: pointer">
		<td>${dog.boardnum}</td>
		<td>${dog.id}</td>
		<td>${dog.title}</td>
		<td>${dog.inputdate}</td>
		
	</tr>
	
</c:forEach>
</table>
<input type = "button" value = "홈으로 돌아가기" onclick="gohome()">
</div>
</body>
</html>