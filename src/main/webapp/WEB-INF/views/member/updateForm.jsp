<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src = "./resources/jq/jquery-3.4.1.min.js"></script>
<title>회원 수정 페이지</title>
<script>

$(document).ready(function () {
	$("#btUp").on("click", goUpdate);
	$("#gohome").on("click", goHome)
});

function goUpdate() {
	var password = $("#password").val();
	var name = $("#name").val();
	var phone = $("#phone").val();
	var email = $("#email").val();
	
	$.ajax({
	url: "update",
	type: "POST",
	data: {
		password : password, name : name, phone : phone, email : email
	},
	dataType: "JSON",
	success: function(res) {
		console.log(res);
		if(res) {
		alert("수정이 완료 되었습니다");
		location.href = "../homework";
		} else {
		alert("수정 할 정보를 하나 이상 입력 해 주세요");
		location.reload();
		}
	},
	error: function(e) {
		alert(JSON.stringify(e));
	}
});
}

function goHome() {
	alert("홈 화면으로 돌아갑니다");
	location.href = "../homework";
}
</script>
</head>
<body>
<div class = "titleDiv">
<h1>
	[ ${sessionScope.sessionid}님의 수정 페이지 입니다 ]
</h1>
</div>
<div class = "bodyDiv">
<!-- <form action="update" method = "post"> -->
<!-- </form> -->
<table>
	<tr>
		<td>아이디</td>
		<td>${member.id}</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type = "password" id ="password" name = "password"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type= "text" id = "name" name = "name"></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type = "text" id = "phone" name = "phone"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type = "text" id = "email" name = "email"></td>
	</tr>
</table>
</div>
<div class = "buttonDiv">
	<input type = "button" value = "수정" id = "btUp">
	<input type = "button" value = "홈으로 돌아가기" id = "gohome">
</div>
</body>
</html>