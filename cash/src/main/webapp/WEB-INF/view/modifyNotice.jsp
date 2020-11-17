<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div id="content"><a class="image-style" href="#"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
		<div id="box1" class="post">
			<h2 class="title" id="center"><a>공지 수정</a></h2>
			<form method="post" action="/admin/modifyNotice">
				<table id="oneListTable">
						<tr>
							<td>notice_id :</td>
							<td>
								<input type="text" name="noticeId"value=${noticeOne.noticeId } readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>notice_title : </td>
							<td>
								<input type="text" name="noticeTitle"value=${noticeOne.noticeTitle }>
							</td>
						</tr>
						<tr>
							<td>notice_content : </td>
							<td>
								<input type="text" name="noticeContent"value=${noticeOne.noticeContent }>
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