<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>공지사항 추가</h1>
	<form method="post" action="/admin/addNotice">
		<table border="1">
			<tr>
				<td>notice_title</td>
				<td>
					<input type="text" name="noticeTitle">
				</td>
			</tr>
			<tr>
				<td>notice_content</td>
				<td>
					<textarea rows="5" cols="30" name="noticeContent"></textarea>
				</td>
			</tr>
		</table>
		<button type="submit">공지 추가</button>
	</form>
	
</body>
</html>