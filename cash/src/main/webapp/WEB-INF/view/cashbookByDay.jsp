<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/css?family=Satisfy|Fjalla+One|Open+Sans:400,600,700' rel='stylesheet' type='text/css' />
<link href="${path}/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
<div id="wrapper">
	<div id="page" class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div id="content"><a class="image-style" href="#"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
		<div id="box1" class="post">
			<h2 class="title" id="center">${currentYear }년${currentMonth }월${currentDay }일</h2>
			<div id="btnStyle2">
				<a href="${path}/admin/cashbookByDay/pre/${currentYear }/${currentMonth }/${currentDay }"><</a>
			</div>
			<div id="btnStyle">
				<a href="${path}/admin/cashbookByDay/next/${currentYear }/${currentMonth }/${currentDay }">></a>
			</div>
			
			<table id="fullListTable">
				<thead>
					<tr>
						<th>cashbookId</th>
						<th>cashbookKind</th>
						<th>categoryName</th>
						<th>cashbookPrice</th>
						<th>cashbookContent</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="c" items="${cashbookList }">
						<tr>	
							<td>${c.cashbookId }</td>
							<td>${c.cashbookKind }</td>
							<td>${c.categoryName }</td>
							<td>${c.cashbookPrice }</td>
							<td>${c.cashbookContent }</td>
							<td><a href="${path}/admin/modifyCashbookByDay/${c.cashbookId }/${currentYear }/${currentMonth }/${currentDay }">수정</a></td>
							<td><a href="${path}/admin/deleteCashbook/${c.cashbookId }/${currentYear }/${currentMonth }/${currentDay }">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="btnStyle">
				<a href = "${path}/admin/addCashbook/${currentYear }/${currentMonth }/${currentDay }">수입/지출 등록</a>
			</div>
		</div>
		</div>
	</div>
</div>
</body>
</html>