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
<link href="${path }/style.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>

<div id="wrapper">
	<div id="page" class="container">
		<div id="content"><a class="image-style" ><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
			<div id="box1" class="post">
				<h2 class="title"><a>welcome to my cashbook</a></h2>
				<p>프로젝트 설명</p>
			</div>
			<div id="box2">
				<h2 class="subtitle">Summary of recent income/expenses</h2>
				<c:forEach var="io" items="${inOutList}">
					<table id="inOutListTable">
						<tr>
							<th colspan="2">${io["날짜"]}</th>
						</tr>
						<tr>
							<td>수입 : </td>
							<td>${io["수입"]}</td>
						</tr>
						<tr>
							<td>지출 : </td>
							<td>${io["지출"]}</td>
						</tr>
						<tr>
							<td>합계 : </td>
							<td>${io["합계"]}</td>
						</tr>
					</table>
				</c:forEach>
				
				<h2 class="noticeTitle">notice list</h2>
				<table id="noticeListTable">
					<thead>
						<tr>
							<th>notice_id</th>
							<th>notice_title</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="n" items="${noticeList}">
							<tr>
								<td>${n.noticeId}</td>
								<td><a id = "noticeOne"href="/admin/noticeOne/${n.noticeId }">${n.noticeTitle}</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	</div>
	<div class="clearfix">&nbsp;</div>
</div>
	
</body>
</html>