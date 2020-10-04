<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<script src = "./resources/jq/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function() {
	$("#sub").on("click", checkLeng);
	$("#back").on("click", backHome);
});

function checkLeng() {
	var id = $("#id").val();
	var password = $("#password").val();

	if(id.length == 0 || password.length == 0) {
			alert("아이디와 패스워드를 바르게 입력해주세요");
			return false;
		}
	$.ajax({
		url:"login",
		type: "POST",
		data: {id : id , password : password},
		dataType: "JSON",
		success: function(res) {
			if(res){
				alert("어서오세요  환영합니다^^");
	 			location.href = "../homework";
			}else{
				alert("로그인 정보를 다시 확인 해 주세요");
				location.reload();
			}
		},
		error: function() {
			alert("로그인 정보를 다시  확인해주세요");
			return false;
		}
	});
}

function backHome() {
	alert("홈 화면으로 돌아갑니다");
	location.href ="../homework";
}

// function enterkey() {
// $("#sub").keyup(function(e){if(e.keyCode == 13) checkLeng(); });

// }


</script>
<style type="text/css">
.mainDiv
{
	text-align: center;
}

.tableDiv
{
	position: relative;
	left: 40%; top:40%;
	margin-left: -50px;
	margin-top: -50px;
	margin: 0 auto;
}

</style>
</head>
<body>
<div class = "mainDiv">
<h1>[ 로그인 페이지 입니다 ]</h1>
</div>
	<div class = "tableDiv">
<!-- 	<form method = "POST"> -->
		<table>
		<tr>
			<td>아이디</td>
			<td><input type = "text" id = "id" name = "id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type = "password" id = "password" name = "password"></td>
		</tr>
		</table>
		
		<input type = "submit" value="로그인" id = "sub">
		<input type = "button" value = "홈 화면으로 돌아가기" id = "back">
<!-- 	</form> -->
	</div>


</body>
</html>