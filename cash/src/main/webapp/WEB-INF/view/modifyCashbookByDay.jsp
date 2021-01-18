<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/css?family=Satisfy|Fjalla+One|Open+Sans:400,600,700' rel='stylesheet' type='text/css' />
<link href="${path }/css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="wrapper">
	<div id="page" class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div id="content">
			<div id="box1" class="post">
				<h2 class="title" id="center"><a>가계부 수정</a></h2>
				<form method="post" action="${path}/admin/modifyCashbookByDay/${currentYear }/${currentMonth }/${currentDay }">
					<table id="oneListTable">
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
					<div id="btnStyle">
					<button type="submit">수정 완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>