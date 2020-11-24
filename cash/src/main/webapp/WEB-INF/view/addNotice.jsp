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
			//alert('test');
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
					$('#fileuploadForm').submit();
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
				<h2 class="title" id="center"><a>공지사항 추가</a></h2>
				<form id="fileuploadForm" method="post" enctype="multipart/form-data" action="/admin/addNotice">
					<table id="oneListTable">
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
						<tr>
							<td>notice_file</td>
							<td>
								<div class="fileinput" id="btnStyle">
									<button type="button" id="addBtn">파일추가</button>
									<button type="button" id="delBtn">파일삭제</button>
								</div>
							</td>
						</tr>
					</table>
					<div id="btnStyle">
					<button type="button" id="submitBtn">공지 추가</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>