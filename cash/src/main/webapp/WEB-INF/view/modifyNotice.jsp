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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addBtn').click(function(){
			let html = '<div id="btnStyle"><input type="file" name="noticefile" class="noticefile"></div>';
			$('.fileinput').append(html);
		});
		$('#delBtn').click(function(){
			$('.fileinput').children().last().remove();
		});	
		$('#submitBtn').click(function(){
			let ck = true;
			$('.boardfile').each(function(index,item){
				if($(item).val()==''){
					
					ck=false;
					}
				});
				if(ck==false){
					alert('선택하지 않은 파일이 있습니다.');
				}else{
					$('#fileUpdateForm').submit();
					}
		});
	});
</script>
</head>
<body>
<div id="wrapper">
	<div id="page" class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div id="content"><a class="image-style" href="#"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
		<div id="box1" class="post">
			<h2 class="title" id="center"><a>공지 수정</a></h2>
			<form id= "fileUpdateForm" method="post" enctype="multipart/form-data" action="/admin/modifyNotice">
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
						<c:forEach var="nf" items="${noticeOne.noticefile }">
							<c:if test="${not empty nf.noticefileName }">			
								<tr>
									<td>기존 파일 : </td>
									<td>
									<div id="btnStyle3">
										<a href="${pageContext.request.contextPath }/upload/${nf.noticefileName}">${nf.noticefileName }</a>
										<a href="/admin/removeNoticefileName/${noticeOne.noticeId }/${nf.noticefileId }">파일삭제</a>
									</div>
									</td>	
								</tr>	
							</c:if>	
						</c:forEach>
						<tr>
							<td>notice_file : </td>
							<td>
								<div id="btnStyle3" class="fileinput">
									<button type="button" id="addBtn">파일추가</button>
									<button type="button" id="delBtn">파일삭제</button>
								</div>
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