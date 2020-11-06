<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<h1>가계부 수정</h1>
	<form method="post" action="/admin/modifyCashbookByDay">
		<table border="1">
			<tr>
				<td>cashbook_id :</td>
				<td>
					<input type="text" name="cashbookId"value="${cashbook.cashbookId }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>수입/지출</td>
				<td>
					<c:if test="${cashbook.cashbookKind == '수입'}">
						<input type="radio" name="cashbookKind" value="수입" checked="checked">&nbsp;수입
						<input type="radio" name="cashbookKind" value="지출">&nbsp;지출
					</c:if>
					<c:if test="${cashbook.cashbookKind == '지출'}">
						<input type="radio" name="cashbookKind" value="수입">&nbsp;수입
						<input type="radio" name="cashbookKind" value="지출" checked="checked">&nbsp;지출
					</c:if>
				</td>
			</tr>
			<tr>
				<td>category_name : </td>
				<td>
					<select name="categoryName">
						<c:forEach var="c" items="${categoryList}">
							<c:if test="${c.categoryName == cashbook.categoryName}">
								<option value="${c.categoryName}" selected="selected">${c.categoryName}</option>
							</c:if>
							<c:if test="${c.categoryName != cashbook.categoryName}">
								<option value="${c.categoryName}">${c.categoryName}</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>cashbook_price : </td>
				<td>
					<input type="text" name="cashbookPrice"value="${cashbook.cashbookPrice }" >
				</td>
			</tr>
			<tr>
				<td>cashbook_content : </td>
				<td>
					<input type="text" name="cashbookContent"value="${cashbook.cashbookContent }" >
				</td>
			</tr>
			<tr>
				<td>cashbook_date : </td>
				<td>
					<input type="text" name="cashbookDate"value="${cashbook.cashbookDate }" readonly="readonly">
				</td>
			</tr>
		</table>
		<button type="submit">수정 완료</button>
	</form>
</body>
</html>