<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src = "./resources/jq/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function (){
	$("#done").on("click", goDelete);
	$("#gohome").on("click", goHome);
});

function goDelete() {
	
	if($("#password").val() == 0 || 
		$("#password").val() != ${sessionScope.sessionpass}) {
		alert("비밀번호를 다시 입력해주세요");
		return false;
	}
	
	var check = prompt("동의하시면 '네', 하지 않으면 '아니오'를 입력하세요");
	if(check == "네"){
		resultDel();
	} else if(check == "아니오") {
		alert("취소되었습니다");
		location.reload();
 		location.href = "../homework";
	}else{
		alert("다시 입력 해 주세요");
		return false;
	}
	
}

function resultDel() {
$.ajax({
	url: "delete",
	type: "POST",
	data: {id : $("#id").val(), password : $("#password").val()
	},
	success: function() {
		alert("회원 탈퇴가 성공적으로 이루어졌습니다.");
		location.reload();
 		location.href = "../homework";
		return true;
	},
	error: function(e) {
		alert(JSON.stringify(e));
		return false;
	}
});
	
	
}

function goHome() {
	alert("홈 화면으로 돌아갑니다.");
	location.href = "../homework";
	
}


</script>
<title>회원 탈퇴 페이지</title>
</head>
<body>
<div class = "titleDiv">
<h1>[ 회원 탈퇴 페이지 입니다 ]</h1>
<p>본인의 아이디와 비밀번호를 입력 해 주세요.</p>
</div>
<div class = "mainDiv">
	<table>
		<tr>
			<td>아이디</td>
			<td>${sessionScope.sessionid}</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type= "password" id = "password" name = "password"></td>
		</tr>
	</table>
</div>
<div class = "buttonDiv">
	<input type = "button" value="회원 탈퇴" id = "done">
	<input type = "button" value="홈 화면으로 돌아가기" id = "gohome">
</div>
</body>
</html>