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
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
		<div id="content"><a class="image-style" href="#"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
			<div id="box1" class="post">
				<h2><a>연도별 카테고리 지출 내역</a></h2>
				<!-- chart -->
				<div>
					<div id="chartTable"><!-- 0) 호출 -->
						<span> 연도를 입력하세요 :</span>
						<input type="text" id="year">
						<button id="categoryByYearChart" type="button">Chart</button>
					</div>
					<br>
					<div>
						<span id="categoryByYear"></span>
					</div>
					<div id="chartContainer">
						<canvas id="doughnutChart"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- table -->
	
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$('#categoryByYearChart').click(function(){
		$('#doughnutChart').remove();
		$("#chartContainer").append('<canvas id="doughnutChart"></canvas>');
		$.ajax({
			url:'/admin/categoryByYear/'+$('#year').val(),
			type:'get',
			success:function(data){
				let doughnutCtx = $('#doughnutChart');
				let doughnutChart = new Chart(doughnutCtx,{
					type:'doughnut',
					data:{
						labels:['식비','관광','생활','의료'],
						datasets:[{
							backgroundColor:[
								'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)'],
				            borderColor:[
					            'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)'],    
				            data:[data.식비,data.관광,data.생활,data.의료]
							}]
						},
						options:{}
					});
				}
		});
		$('#categoryByYear').html('categoryByYear');
		$.ajax({
			url:'/admin/categoryByYear/'+$('#year').val(),
			type:'get',
			success:function(data){
				let html=`
					<table id="chartTable">
					<tr>
						<th>식비</th>
						<th>관광</th>
						<th>생활</th>
						<th>의료</th>
					</tr>
					<tr>
						<td>\${data.식비}</td>
						<td>\${data.관광}</td>
						<td>\${data.생활}</td>
						<td>\${data.의료}</td>
					</tr>
				</table>
					`;
				$('#categoryByYear').html(html);
				}
		});
	});
</script>
</html>