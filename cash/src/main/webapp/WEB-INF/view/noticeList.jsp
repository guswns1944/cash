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
<div id ="wrapper">
	<div id="page" class="container">
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
			<div id="content">
				<div id="box1" class="post">
					<!-- 공지 -->
					<h2 class="title" id="center"><a>공지사항</a></h2>
					<div id="btnStyle">
					<a href="${path}/admin/addNotice">공지사항 등록</a>
					</div>
					<table id="noticeListTable">
						<thead>
							<tr>
								<th>notice_id</th>
								<th>notice_title</th>
								<th>notice_date</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="n" items="${noticeList }">
								<tr>
									<td>${n.noticeId }</td>
									<td><a id="noticeOne" href="${path}/admin/noticeOne/${n.noticeId }">${n.noticeTitle }</a></td>
									<td>${n.noticeDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="paging">
					<c:if test="${currentPage > 1}">
						<a href="${path}/admin/noticeList/1"><<</a>
					</c:if>
					<c:choose>
						<c:when test="${lastPage < 4 }">
							<c:forEach var="i" begin="${1}" end="${lastPage}">
								<c:choose>
									<c:when test="${i eq currentPage}">
										<a class="currentPage" href="${path}/admin/noticeList/${i}">${i}</a>	
									</c:when>
									<c:otherwise>
										<a href="${path}/admin/noticeList/${i}">${i}</a>	
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${currentPage < 4}">
									<c:forEach var="i" begin="${1}" end="${5}">
										<c:choose>
											<c:when test="${i eq currentPage}">
												<a class="currentPage" href="${path}/admin/noticeList/${i}">${i}</a>	
											</c:when>
											<c:otherwise>
												<a href="${path}/admin/noticeList/${i}">${i}</a>	
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:when test="${currentPage > lastPage-3}">
									<c:forEach var="i" begin="${lastPage-4}" end="${lastPage}">
										<c:choose>
											<c:when test="${i eq currentPage}">
												<a class="currentPage" href="${path}/admin/noticeList/${i}">${i}</a>	
											</c:when>
											<c:otherwise>
												<a href="${path}/admin/noticeList/${i}">${i}</a>	
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" begin="${currentPage-2}" end="${currentPage+2}">
										<c:choose>
											<c:when test="${i eq currentPage}">
												<a class="currentPage" href="${path}/admin/noticeList/${i}">${i}</a>	
											</c:when>
											<c:otherwise>
												<a href="${path}/admin/noticeList/${i}">${i}</a>	
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<c:if test="${currentPage < lastPage }">
						<a href="${path}/admin/noticeList/${lastPage }">>></a>
					</c:if>
				</div>
			</div>
	</div>
</div>
</body>
</html>