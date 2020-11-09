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


	
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div>
	<h1>index</h1>
		<!-- 수입/지출/합계 -->
		<table border="1">
			<thead>
				<tr>
					<th>날짜</th>
					<th>수입</th>
					<th>지출</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="io" items="${inOutList }">
					<tr>
						<td>${io["날짜"] }</td>
						<td>${io["수입"] }</td>
						<td>${io["지출"] }</td>
						<td>${io["합계"] }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div>
		<!-- 공지 -->
		<div>공지사항 <a href="/admin/noticeList/1">more</a></div>
		<table border="1">
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
</body>
</html>