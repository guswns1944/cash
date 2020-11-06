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
	<h1>공지 수정</h1>
	<form method="post" action="/admin/modifyNotice">
		<table border="1">
			<c:forEach var="n" items="${noticeOne }">
				<tr>
					<td>notice_id :</td>
					<td>
						<input type="text" name="noticeId"value=${n.noticeId } readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>notice_title : </td>
					<td>
						<input type="text" name="noticeTitle"value=${n.noticeTitle }>
					</td>
				</tr>
				<tr>
					<td>notice_content : </td>
					<td>
						<input type="text" name="noticeContent"value=${n.noticeContent }>
					</td>
				</tr>
			</c:forEach>
		</table>
		<button type="submit">수정 완료</button>
	</form>
</body>
</html>