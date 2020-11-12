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
	<h1>cashbookList</h1>
	<a href="/admin/cashbookListExcel">[전체 cashbook 리스트를 엑셀 파일로 다운]</a>
	<table border="1">
		<thead>
			<tr>
				<th>cashbook_id</th>
				<th>cashbook_kind</th>
				<th>category_name</th>
				<th>cashbook_price</th>
				<th>cashbook_content</th>
				<th>cashbook_date</th>
				<th>create_date</th>
				<th>update_date</th>
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
					<td>${c.cashbookDate }</td>
					<td>${c.createDate }</td>
					<td>${c.updateDate }</td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
	
</body>
</html>