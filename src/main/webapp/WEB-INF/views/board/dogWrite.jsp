<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src = "<c:url value='/resources/jq/jquery-3.4.1.min.js'/>"></script>
<title>글 작성</title>
<script>




function soon() {
	alert("추후 추가 예정입니다. 불편을 드려 대단히 죄송합니다");
}
function golist() {
	alert("게시판 목록으로 돌아갑니다.");
	location.href = "dogForm";
}

	// 	var data = $("#category").val();
// 	location.href = "boardForm?category=" + data;



</script>
<style type="text/css">
textarea
{
	width : 400px;
	height : 300px;
	resize: none;
}
input[type = text]
{
	width : 400px;
}
</style>
</head>
<body>
<h1 class = "titleDiv">
	강아지 / 개 분양글 작성 게시판입니다
</h1>

<div class = "mainDiv">
<form action="writeD" method = "POST">
<table>
	<tr>
		<td>제목</td>
		<td><input type = "text" id = "title" name = "title"></td>
	</tr>
	<tr>
		<td>글 내용</td>
		<td><textarea placeholder="해당 게시글에서는 상업적 목적, 타 사이트 홍보,기타 위법적인 행위를 금지합니다.
위와 같은 사실이 확인 되는 경우 법적인 조치를 취할 것이니 주의 바랍니다. 또한, 분양에 필요한 정보 이외에 개인정보 입력은 자제하시길 바랍니다.
		" id = "content" name = "content"></textarea></td>
	</tr>

	<tr>
		<td>파일 첨부</td>
		<td><input type = "button" value = "추후 추가 예정입니다." onclick="soon()"></td>
	</tr>
</table>
<div class = "buttonDiv">
	<input type = "submit" value = "게시글 작성" id = "sub">
	<input type = "button" value = "목록으로 돌아가기" onclick="golist()">
</div>
</form>
</div>

<%-- <input type="hidden" value="${requestScope.category}" id="category"> --%>
</body>
</html>