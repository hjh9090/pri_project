<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src = "./resources/jq/jquery-3.4.1.min.js"></script>
	<title>반려동물 분양 사이트</title>
<script>

$(document).ready(function(){
	$("#logout").on("click", goLogout);
});


function gojoin() {
	location.href = "joinForm";
}
function gologin() {
	location.href = "loginForm";
}

function godelete() {
	location.href = "deleteForm";
}

function goUpdate() {
	location.href = "updateForm";
}

function goLogout() {
	$.ajax({
		url: "logout",
		type: "GET",
		success: function(){
			alert("성공적으로 로그아웃 되었습니다.");
			location.reload();
		},
		error: function() {
			alert("알 수 없는 오류가 발생 했습니다.");
			return false;
		}
	});
}
//게시판으로 이동하는 함수

function godog() {
	
	location.href = "board/dogForm";
}

function gocat() {
	
	location.href = "board/catForm";
}

// function goetc() {
	
// 	location.href = "board/etcForm";
// }

// function goboard(data) {
// 	if (data == "D")
// 	{
// 		location.href = "board/boardForm?category=0";
// 	}
// 	else if (data == "C")
// 	{
// 		location.href = "board/boardForm?category=1";
// 	}
// 	else if (data == "E")
// 	{
// 		location.href = "board/boardForm?category=2";
// 	}
// }

</script>
<style type="text/css">
.mainbutton 
{
	position: relative;
	height: 100vh;
}

.spanbutton
{
			position: absolute;
			left: 50%; top:50%;
			margin-left: -50px;
			margin-top: -50px;
			display: inline-block;
			width: 100px; height: 100px; 
			line-height: 100px;
			border-radius: 50%;
}
.mainh1 
{
	text-align: center;
	background-color: silver;
}

.mainbody
{
	text-align: center;
}
</style>
</head>
<body>
<c:if test="${sessionScope.sessionid == null}">
<div class = "mainh1">
<h1>
	안녕하세요^^ 로그인을 먼저 해주세요^^ 
</h1>
</div>

<span class = "spanbutton">
<input type = "button" value="회원가입" onclick="gojoin()">
<input type = "button" value="로그인" onclick="gologin()">
<input type = "button" value="강아지/개 게시판으로 이동" onclick="godog()">
<input type = "button" value="고양이 게시판으로 이동" onclick="gocat()">
<!-- <input type = "button" value="그 외 반려 동물 게시판으로 이동" onclick="goetc()"> -->
</span>
<div class = "mainbody">
<P>  반려동물 분양 사이트입니다^^ </P>
</div>
</c:if>

<c:if test="${sessionScope.sessionid != null}">

<div class = "mainh1">
<h1>
	안녕하세요^^ ${sessionScope.sessionid}님^^ 즐거운 하루 되시길 바랍니다~
</h1>
</div>

<span class = "spanbutton">
<input type = "button" value="회원정보 수정" onclick="goUpdate()">
<input type = "button" value="로그아웃" id = "logout">
<input type = "button" value="회원 탈퇴" onclick="godelete()">
<input type = "button" value="강아지/개 게시판으로 이동" onclick="godog()">
<input type = "button" value="고양이 게시판으로 이동" onclick="gocat()">
<!-- <input type = "button" value="그 외 반려 동물 게시판으로 이동" onclick="goetc()"> -->
</span>
<div class = "mainbody">
<P>  반려동물 분양 사이트입니다^^ </P>
</div>


</c:if>
</body>
</html>
