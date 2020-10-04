<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 페이지</title>
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
<script>
$(document).ready(function () {
	$("#sub").on("click", done)
});

function done() {
	var boardnum = ${cat.boardnum};
	var content = $("#content").val();
	
	$.ajax ({
		
	url: "updateC",
	type: "POST",
	data: {boardnum : boardnum, content : content},
	success: function(res){
		if(res) {
		alert("수정되었습니다");
		location.href = "catForm";
		} else {
		alert("다시 해 주세요");
		return false;
		}
	}
	});
	
}

</script>
</head>
<body>
<div class = "mainDiv">
<!-- <form action="updateD" method = "POST"> -->
<table>
	<tr>
		<td>제목</td>
		<td>${dog.title}</td>
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
	<input type = "submit" value = "수정" id = "sub">
	<input type = "button" value = "목록으로 돌아가기" onclick="golist()">
</div>
<!-- </form> -->
</div>
<input type = "hidden" value="${cat.boardnum}">
</body>
</html>