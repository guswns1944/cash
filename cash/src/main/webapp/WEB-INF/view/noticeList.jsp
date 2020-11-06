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
	<br>
	<h1>공지사항</h1>
	<a href="/admin/addNotice">공지사항 등록</a>
	<div>
		<!-- 공지 -->
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
						<td><a href="/admin/noticeOne?noticeId=${n.noticeId }">${n.noticeTitle }</a></td>
						<td>${n.noticeDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<div>
		<c:if test="${currentPage > 1}">
			<a href="/admin/noticeList?currentPage=1">[처음]</a>
		</c:if>
		<c:if test="${currentPage > 1}">
			<a href="/admin/noticeList?currentPage=${currentPage-1 }">[이전]</a>
		</c:if>
		<c:if test="${currentPage < lastPage }">
			<a href="/admin/noticeList?currentPage=${currentPage+1 }">[다음]</a>
		</c:if>
		<c:if test="${currentPage < lastPage }">
			<a href="/admin/noticeList?currentPage=${lastPage }">[마지막]</a>
		</c:if>
	</div>
	
</body>
</html>