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
					<table id="visitorTable">
						<tr>
							<td>writer :</td>
							<td><input type="text" name="visitorbookWriter"></td>
						</tr>
						<tr>
							<td>content :</td>
							<td><textarea name="visitorbookContent"></textarea></td>
						</tr>
					</table>
					<div id="btnStyle">
					<button type="submit">작성</button>
					</div>
				</form>
				<table id="visitorTable2">
					<c:forEach var="v" items="${visitorbookList }">
						<thead>
							<tr>
								<th>no.${v.visitorbookId }</th>
								<th>작성자 : ${v.visitorbookWriter }</th>
								<th class="th3">${v.visitorbookDate }</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2"><textarea readonly = "readonly" style="width:100%;"rows="4">${v.visitorbookContent }</textarea></td>
								<td><a style="float:left;" href="${path}/admin/deletevisitorBook/${v.visitorbookId}">삭제</a></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
				<div id="paging">	
					<c:if test="${currentPage > 1}">
						<a href="${path}/admin/visitorbookList/1"><<</a>
					</c:if>
					<c:choose>
						<c:when test="${lastPage < 4 }">
							<c:forEach var="i" begin="${1}" end="${lastPage}">
								<c:choose>
									<c:when test="${i eq currentPage}">
										<a class="currentPage" href="${path}/admin/visitorbookList/${i}">${i}</a>	
									</c:when>
									<c:otherwise>
										<a href="${path}/admin/visitorbookList/${i}">${i}</a>	
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
												<a class="currentPage" href="${path}/admin/visitorbookList/${i}">${i}</a>	
											</c:when>
											<c:otherwise>
												<a href="${path}/admin/visitorbookList/${i}">${i}</a>	
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:when test="${currentPage > lastPage-3}">
									<c:forEach var="i" begin="${lastPage-4}" end="${lastPage}">
										<c:choose>
											<c:when test="${i eq currentPage}">
												<a class="currentPage" href="${path}/admin/visitorbookList/${i}">${i}</a>	
											</c:when>
											<c:otherwise>
												<a href="${path}/admin/visitorbookList/${i}">${i}</a>	
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" begin="${currentPage-2}" end="${currentPage+2}">
										<c:choose>
											<c:when test="${i eq currentPage}">
												<a class="currentPage" href="${path}/admin/visitorbookList/${i}">${i}</a>	
											</c:when>
											<c:otherwise>
												<a href="${path}/admin/visitorbookList/${i}">${i}</a>	
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<c:if test="${currentPage < lastPage }">
						<a href="${path}/admin/visitorbookList/${lastPage }">>></a>
					</c:if>
			</div>
		</div>
	</div>
</div>
	
</body>
</html>