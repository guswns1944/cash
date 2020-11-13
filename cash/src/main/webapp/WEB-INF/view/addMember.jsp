<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href='http://fonts.googleapis.com/css?family=Satisfy|Fjalla+One|Open+Sans:400,600,700' rel='stylesheet' type='text/css' />
<link href="${path }/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#id').focus();
		$('#id').blur(function(){
			if($('#id').val()==''){
				$('#id').focus();
				return;
				}
			// 비동기 요청으로 #id값을 서버에 보내고 #id값이 중복인지 아닌지..
			$.ajax({
				url:'/admin/idCheck',
				type:'post',
				data:{id:$('#id').val()},
				success:function(data){
					if(data=="yes"){
						alert($('#id').val()+'사용가능한 ID입니다.');
						$('#pw').focus();
					}else{
						alert($('#id').val()+'사용중인 ID입니다.');
						$('#id').val('');
						$('#id').focus();	
					}
					}
				});
			});
		});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div id="wrapper">
		<div id="page" class="container">
			<div id="content"><a class="image-style"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
				<form method="post" action="/admin/addMember">
					<div>
						ID: <input type="text" id="id" name="id">
					</div>
					<div>
						pw: <input type="password" id="id" name="pw">
					</div>
					<div>
					<button type="submit" id="addMember">addMember</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>