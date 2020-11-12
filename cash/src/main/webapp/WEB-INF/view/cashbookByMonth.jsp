<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.sunday {color: red}
</style>
<link href='http://fonts.googleapis.com/css?family=Satisfy|Fjalla+One|Open+Sans:400,600,700' rel='stylesheet' type='text/css' />
<link href="${path }/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div id="wrapper">
	<div id="page" class="container">
		<div id="content"><a class="image-style"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
	
	<!-- 다이어리 -->	
	<div>
		이번달 수입 합계 : ${sumIn }
	</div>
	<h3>
		<a href="/admin/cashbookByMonth/pre/${currentYear}/${currentMonth}">[이전달]</a>
		${currentYear }년 ${currentMonth } 월
		<a href="/admin/cashbookByMonth/next/${currentYear}/${currentMonth}">[다음달]</a>
	</h3>	
	<div>
		이번달 지출 합계 : ${sumOut }
	</div>
	<div>
		<table border="1" width="100%">
			<thead>
				<tr>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
						<c:if test="${i-(firstDayOfWeek-1) <1 }">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${i-(firstDayOfWeek-1) >0 }">
							<td>
								<div><a href="/admin/cashbookByDay/now/${currentYear }/${currentMonth }/${i-(firstDayOfWeek-1)}">${i-(firstDayOfWeek-1)}</a></div>
								
								<c:forEach var="c" items="${cashList}">
									<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
										<div>
											<c:if test="${c.cashbookKind == '수입' }">
												<div>수입 : ${c.cashbookPrice }</div>
											</c:if>
											<c:if test="${c.cashbookKind == '지출' }">
												<div>지출 : ${c.cashbookPrice }</div>
											</c:if>
										</div>
									</c:if>
								</c:forEach>
							</td>
						</c:if>
						<c:if test="${i%7 == 0}">
							<tr></tr>
						</c:if>
					</c:forEach>
					
					<c:if test="${(lastDay+(firstDayOfWeek-1)) %7 !=0 }">
						<c:forEach begin="1" end="${7-((lastDay+(firstDayOfWeek-1)) %7)}" step="1">
								<td>&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
	</div>
	</div>
</body>
</html>