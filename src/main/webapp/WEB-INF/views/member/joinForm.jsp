<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src = "./resources/jq/jquery-3.4.1.min.js"></script>
<script>

$(document).ready(function() {

	$("#checkP").show();
	$("#sub").hide();
	$("#checkP2").hide();
	$("#sub").on("click", checkForm);
	$("#check").on("click", checkId);
	$("#back").on("click", backHome);
});

function checkForm() {

	var id = document.getElementById("id").value;
	var password = document.getElementById("password").value;
	var name = document.getElementById("name").value;
	var phone = document.getElementById("phone").value;
	var email = document.getElementById("email").value;
	
	if(id.length == 0) {
		alert("아이디를 입력하세요");
		$("#checkP2").show();
		$("#sub").hide();
		return false;
	}
	if(password.length == 0) {
		alert("비밀번호를 입력하세요");
		return false;
	}
	
	if(name.length == 0) {
		alert("이름을 입력하세요");
		return false;
	}
	
	if(phone.length == 0) {
		alert("전화번호를 입력하세요");
		return false;
	}
	
	if(email.length == 0) {
		alert("이메일을 입력하세요");
		return false;
	}
	alert("성공적으로 가입 되었습니다");
	return true;

}//end checkform
	
function checkId() {
	
	var id = $("#id").val();
	if(id.length == 0) {
		alert("아이디를 입력해주세요");
		$("#checkP2").show();
		$("#sub").hide();
		return false;
	}//end false;
	
	$.ajax ({
	url: "checkId",
	type: "POST",
	data: {id : $("#id").val()},
	dataType: "text",
	success: function(res){
		alert(res);
		if(res == "이미 존재하는 ID입니다") 
			{
				$("#checkP").hide();
				$("#checkP2").show();
				$("#sub").hide();
			}//end false 
		if(res == "사용가능 한 ID 입니다") 
			{
				$("#sub").show();
				$("#checkP").hide();
				$("#checkP2").hide();
			}//end true
		},
	error : function(e) {
			alert("에러가 발생 했습니다 다시 입력 해 주세요");
		}
	});
}//end checkId

function backHome() {
	alert("홈 화면으로 돌아갑니다");
	location.href = "../homework";
}

</script>

<style type="text/css">
.tableDiv
{
	position: relative;
	left: 40%; top:40%;
	margin-left: -50px;
	margin-top: -50px;
	margin: 0 auto;
}
.buttonDiv
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
<div align="center">
<h1>[ 회원가입 페이지 입니다 ]</h1>
</div>
<form action="join" method = "POST">
	<div class = "tableDiv">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type = "text" id = "id" name = "id"></td>
				<td><input type= "button" id = "check" name = "check" value="아이디중복" 
				></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type= "password" id = "password" name = "password"></td>
				<td class = "passcheck"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type = "text" id = "name" name = "name"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type= "text" id = "phone" name = "phone"></td>
			</tr>
			<tr>	
				<td>이메일</td>
				<td><input type= "text" id = "email" name = "email"></td>
			</tr>
		</table>
	</div>
<div class = "buttonDiv">
	<input type = "submit" value="가입" id = "sub">
	<p id = "checkP">ID 중복 체크를 먼저 해 주세요.</p>
	<p id = "checkP2">다시 한 번 중복 검사를 해주세요.</p>
	<input type = "button" value = "홈으로 돌아가기" id = "back">
</div>
</form>
</body>
</html>