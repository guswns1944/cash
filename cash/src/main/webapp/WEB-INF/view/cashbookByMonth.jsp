<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<div id="content"><a class="image-style"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
	
	<!-- 다이어리 -->	

	<h2 class="title" id="center"><a>
	${currentYear }년 ${currentMonth } 월
	</a></h2>
	<div id="btnStyle2">
		<a href="${path}/admin/cashbookByMonth/pre/${currentYear}/${currentMonth}"><</a>
	</div>	
	<div id="btnStyle">
		<a href="${path}/admin/cashbookByMonth/next/${currentYear}/${currentMonth}">></a>
	</div>
		
	<div>
		<table id="cashbookTable">
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
								<div><a href="${path}/admin/cashbookByDay/now/${currentYear }/${currentMonth }/${i-(firstDayOfWeek-1)}">${i-(firstDayOfWeek-1)}</a></div>
								
								<c:forEach var="c" items="${cashList}">
									<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
										<div id="cashStyle">
											<c:if test="${c.cashbookKind == '수입' }">
												<div class="green">${c.cashbookPrice }</div>
											</c:if>
											<c:if test="${c.cashbookKind == '지출' }">
												<div class="red">${c.cashbookPrice }</div>
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
		<div>
		<h3 id="right">이번달 수입 : ${sumIn }</h3>
		</div>
		<div>
		<h3 id="right">이번달 지출 : ${sumOut }</h3>
		</div>
		
		<br>
	</div>
	</div>
	</div>
	</div>
</body>
</html>