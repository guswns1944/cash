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
	<h1>addCashbook</h1>
	<form method="post" action="/admin/addCashbook/${currentYear }/${currentMonth }/${currentDay }">
		<table border="1">
			<tr>
				<td>cashbook_date</td>
				<td>
					<input type="text" name="cashbookDate" value="${currentYear }-${currentMonth }-${currentDay } " readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>cashbook_kind</td>
				<td>
					<input type="radio" name="cashbookKind" value="지출">지출
					<input type="radio" name="cashbookKind" value="수입">수입
				</td>
			</tr>
			<tr>
				<td>cashbook_name</td>
				<td>
					<select name="categoryName">
						<c:forEach var="c" items="${categoryList }">
							<option value="${c.categoryName }">${c.categoryName }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>cashbook_price</td>
				<td>
					<input type="text" name="cashbookPrice">
				</td>
			</tr>
			<tr>
				<td>cashbook_content</td>
				<td>
					<input type="text" name="cashbookContent">
				</td>
			</tr>
		</table>
		<button type="submit">입력완료</button>
	</form>
</body>
</html>