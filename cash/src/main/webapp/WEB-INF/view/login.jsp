<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
</head>
<body style="background-color: #fff;">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

<div class="container" style="margin-top:100px;">
	<div class="row">
		<h1 style=" text-align: center; width: 50%; margin-left: 25%; padding-top:35px; color: #000;">Cashbook</h1>
		<form action="/login" method="post" style="text-align: center; width: 50%; margin-left: 25%;">
			<div style="text-decoration: none;  padding-bottom: 10px; padding-top: 10px;"></div>
			<div class="form-group">
				<input type="text" class= "form-control" name="id" placeholder="아이디를 입력해주세요.">
			</div>
			<div class="form-group" style="">
				<input type="password" class= "form-control"name="pw" placeholder="비밀번호를 입력해주세요.">
			</div>
			<div>
				<button type="submit"  style=" color: #fff; font-size: 14px; width: 100%; height: 44px; background: #808080;" >로그인</button>
			</div>
		</form>
		<br><br><br>
		<h3 style=" text-align: left; width: 50%; margin-left: 25%; padding-top:20px; color: #000;" >공지사항</h3>
		<div style=" text-align: center; width: 50%; margin-left: 25%; padding-top:20px; color: #000;">
			<!-- 공지 -->
			<table class= "table table-hover"style="color: #000;">
				<thead>
					<tr>
						<th>notice_id</th>
						<th>notice_title</th>
						<th>notice_date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${noticeList }">
						<tr>
							<td>${n.noticeId }</td>
							<td>${n.noticeTitle }</td>
							<td>${n.noticeDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
</div>	
</body>
</html>