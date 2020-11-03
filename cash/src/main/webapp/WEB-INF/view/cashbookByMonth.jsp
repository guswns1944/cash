<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.sunday {color: red}
</style>
</head>
<body>
	<h3>목록</h3>
	
	<!-- 다이어리 -->	
	<div>
		이번달 수입 합계 : ${sumIn }
	</div>
	<h3>
		<a href="/cashbookByMonth?currentYear=${currentYear }&currentMonth=${currentMonth-1 }">[이전달]</a>
		${currentYear }년 ${currentMonth } 월
		<a href="/cashbookByMonth?currentYear=${currentYear }&currentMonth=${currentMonth+1 }">[다음달]</a>
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
							<c:if test="${i%7==1 }">
								<td class="sunday">${i-(firstDayOfWeek-1)}</td>
							</c:if>
							<c:if test="${i%7!=1 }">
								<td>${i-(firstDayOfWeek-1)}</td>
							</c:if>
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
</body>
</html>