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
		<div id="content">
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
				<h3 id="center">첨부 파일</h3>
				<table id="oneListTable">
					<c:forEach var="nf" items="${noticeOne.noticefile }">
						<tr>
							<td><a href="${pageContext.request.contextPath }/upload/${nf.noticefileName}">${nf.noticefileName}</a></td>
						</tr>
					</c:forEach>
				</table>
				<br><br>
				<h3 id ="center">댓글 목록</h3>
				<table id="commentTable">
					<c:forEach var="n" items="${noticeOne.comment }">
						<c:if test="${not empty n.commentContent }">
							<tr>
								<td>${n.commentContent }</td>
								<td><a href="${path }/admin/removeComment/${n.commentId}/${noticeOne.noticeId}">삭제</a></td>
							</tr>
						</c:if>
					</c:forEach>
				</table><br>
				<h3 id ="center">댓글 작성</h3>
				<form id="commentTable" method="post" action="${path }/admin/addComment">
					<input type="hidden" name="noticeId" value="${noticeOne.noticeId }">
					<textarea name="commentContent" rows="3" cols="50"></textarea>
					<div id="btnStyle"><button type="submit">댓글 입력</button></div>
				</form>
				<div id="btnStyle">
					<a href="${path}/admin/modifyNotice/${noticeOne.noticeId }">수정</a>
					<a href="${path}/admin/removeNotice/${noticeOne.noticeId }">삭제</a>					
					<div id="btnStyle2">
						<a href="${path}/admin/noticeList/1">돌아가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>