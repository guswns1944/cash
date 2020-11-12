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
<body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>cashbookListByDay</h1>
	<div>
	<a href="/admin/cashbookByDay/pre/${currentYear }/${currentMonth }/${currentDay }">이전</a>
	${currentYear }년${currentMonth }월${currentDay }일
	<a href="/admin/cashbookByDay/next/${currentYear }/${currentMonth }/${currentDay }">이후</a>
	</div>
	<a href = "/admin/addCashbook/${currentYear }/${currentMonth }/${currentDay }">수입/지출 입력</a>
	<table border="1">
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
					<td><a href="/admin/modifyCashbookByDay/${c.cashbookId }/${currentYear }/${currentMonth }/${currentDay }">수정</a></td>
					<td><a href="/admin/deleteCashbook/${c.cashbookId }/${currentYear }/${currentMonth }/${currentDay }">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>