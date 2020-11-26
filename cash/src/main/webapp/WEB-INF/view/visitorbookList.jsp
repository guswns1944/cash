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
<link href="${path }/css/style.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>

<div id="wrapper">
	<div id="page" class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div id="content"><a class="image-style" ></a>
			<div id="box1" class="post">
				<h2 class="title" id="center"><a> 방명록</a></h2>
				<form method="post" action="${path }/admin/addvisitorBook">
					<table>
						<tr>
							<td>writer :</td>
							<td><input type="text" name="visitorbookWriter"></td>
						</tr>
						<tr>
							<td>content :</td>
							<td><textarea name="visitorbookContent"></textarea></td>
						</tr>
					</table>
					<button type="submit">작성</button>
				</form>
				<table>
					<c:forEach var="v" items="${visitorbookList }">
						<thead>
							<tr>
								<th>${v.visitorbookId }</th>
								<th>${v.visitorbookWriter }</th>
								<th>${v.visitorbookDate }</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${v.visitorbookContent }</td>
								<td><a href="${path}/admin/deletevisitorBook/${v.visitorbookId}">삭제</a></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
	
</body>
</html>