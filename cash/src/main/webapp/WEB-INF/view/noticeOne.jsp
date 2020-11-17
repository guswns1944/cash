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
				<h2 class="title" id="center"><a>공지 상세보기</a></h2>
				<table id="oneListTable">
					<tr>
						<td>notice_id :</td>
						<td>
							<input type="text" value="${noticeOne.noticeId }" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>notice_title : </td>
						<td>
							<input type="text" value="${noticeOne.noticeTitle }" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>notice_content : </td>
						<td>
							<input type="text" value="${noticeOne.noticeContent }" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>notice_date : </td>
						<td>
							<input type="text" value="${noticeOne.noticeDate }" readonly="readonly">
						</td>
					</tr>
				</table>
				<div id="btnStyle">
					<a href="/admin/modifyNotice/${noticeOne.noticeId }">수정</a>
					<a href="/admin/removeNotice/${noticeOne.noticeId }">삭제</a>					
					<div id="btnStyle2">
						<a href="/admin/noticeList/1">돌아가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>