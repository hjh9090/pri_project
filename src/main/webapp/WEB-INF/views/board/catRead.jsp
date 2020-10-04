<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src = "<c:url value='/resources/jq/jquery-3.4.1.min.js'/>"></script>
<title>${cat.boardnum}번째 게시물</title>
<style type="text/css">




</style>
<script>

function catform() {
	alert("게시판 목록으로 되돌아갑니다");
	location.href = "catForm";
}


function catDelete() {
	var boardnum = ${cat.boardnum};
	
	$.ajax({
	url:"deleteCat",
	type: "GET",
	data: {boardnum : boardnum},
	dataType: "JSON",
	success: function(res) {
		if(res) {
		alert("성공적으로 삭제 되었습니다");
		location.href = "catForm";
		} else {
		alert("다시 한 번 시도해 주세요");
		return false;
		}
	},
	error : function(e) {
	alert(JSON.stringify(e));
	}
});
}

function dogUpdate() {
	var boardnum = ${cat.boardnum};
	location.href = "updateCat?boardnum=" + boardnum;
}

</script>
</head>
<body>
<div class = "mainDiv">
 <h1>[ 고양이 분양 글 ]</h1>
<table>

	<tr>
		<td >작성자</td>
		<td >${cat.id}</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${cat.inputdate}</td>
	</tr>
	
	<tr>
		<td>제목</td>
		<td>${cat.title}</td>
	</tr>
	
	<tr>
		<td>내용</td>
		<td>${cat.content}</td>
	</tr>
</table>
</div>
<div class = "buttonDiv">
<c:if test="${sessionScope.sessionid == cat.id}">
<input type="button" value ="삭제" onclick = "catDelete()">
<input type="button" value ="수정" onclick = "catUpdate()">
</c:if>
<input type="button" value ="목록으로" onclick = "catform()">
</div>

</body>
</html>