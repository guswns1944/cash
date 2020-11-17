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
</head>
<body>
	<div id="wrapper">
		<div id="page" class="container">
			<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
			<div id="content"><a class="image-style" href="#"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
				<div id="box1" class="post">
					<h2>addCashbook</h2>
					<form method="post" action="/admin/addCashbook/${currentYear }/${currentMonth }/${currentDay }">
						<table id="oneListTable">
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
						<div id="btnStyle">
							<button type="submit">입력완료</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>