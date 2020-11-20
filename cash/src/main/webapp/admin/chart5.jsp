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
				<h2><a>월별 지출 카테고리</a></h2>
				<!-- chart -->
				<div>
					<div id="chartTable"><!-- 0) 호출 -->
						<span> 연도를 입력하세요 :</span>
						<input type="text" id="year">
						<button id="totalOutMonthCategoryByYearChart" type="button">Chart</button>
					</div>
					<br>
					<div>
						<span id="totalOutMonthCategoryByYear"></span>
					</div>
					<div id="chartContainer">
						<canvas id="chart5"></canvas>
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
	$('#totalOutMonthCategoryByYearChart').click(function(){
		$('#chart5').remove();
		$("#chartContainer").append('<canvas id="chart5"></canvas>');
		$.ajax({
			url:'/admin/totalOutMonthCategoryByYear/'+$('#year').val(),
			type:'get',
			success:function(data){
				let ctx = document.getElementById('chart5').getContext('2d');
				let chart = new Chart(ctx,{
					type:'line',
					data:{
						labels:['1','2','3','4','5','6','7','8','9','10','11','12'],
						datasets:[{
							label:data[0].category_name,
							backgroundColor:[
								'rgba(255, 99, 132, 0.2)'],
				            borderColor:[
					            'rgba(255, 99, 132, 0.2)'],    
				                data:[data[0].january,data[0].february,data[0].march,data[0].april,data[0].may,data[0].june,data[0].july,data[0].august,data[0].september,data[0].october,data[0].november,data[0].december],
				                file:false,
							},{
							label:data[1].category_name,
							backgroundColor:[
								'rgba(54, 162, 235, 0.2)'],
				            borderColor:[
				                'rgba(54, 162, 235, 0.2)'],    
				                data:[data[1].january,data[1].february,data[1].march,data[1].april,data[1].may,data[1].june,data[1].july,data[1].august,data[1].september,data[1].october,data[1].november,data[1].december],
				                file:false,
							},{
							label:data[2].category_name,
							backgroundColor:[
								'rgba(255, 206, 86, 0.2)'],
				            borderColor:[
				            	'rgba(255, 206, 86, 0.2)'],    
				                data:[data[2].january,data[2].february,data[2].march,data[2].april,data[2].may,data[2].june,data[2].july,data[2].august,data[2].september,data[2].october,data[2].november,data[2].december],
				                file:false,
							},{
							label:data[3].category_name,
							backgroundColor:[
								'rgba(255, 159, 64, 0.2)'],
				            borderColor:[
				            	'rgba(255, 159, 64, 0.2)'],    
				                data:[data[3].january,data[3].february,data[3].march,data[3].april,data[3].may,data[3].june,data[3].july,data[3].august,data[3].september,data[3].october,data[3].november,data[3].december],
				                file:false,
							},{
							label:data[4].category_name,
							backgroundColor:[
								'rgba(153, 102, 255, 0.2)'],
				            borderColor:[
				            	'rgba(153, 102, 255, 0.2)'],    
				                data:[data[4].january,data[4].february,data[4].march,data[4].april,data[4].may,data[4].june,data[4].july,data[4].august,data[4].september,data[4].october,data[4].november,data[4].december]
							}]
						},
						options:{}
					});
				}
		});
		$('#totalOutMonthCategoryByYear').html('totalOutMonthCategoryByYear');
		$.ajax({
			
			url:'/admin/totalOutMonthCategoryByYear/'+$('#year').val(),
			type:'get',
			dataType: 'json',
			success:function(data){
				console.log(data);
				let html=`
					<table id="chartTable">
						<thead>
							<tr>
								<th>카테고리</th>
								<th>january</th>
								<th>february</th>
								<th>march</th>
								<th>april</th>
								<th>may</th>
								<th>june</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>\${data[0].category_name}</td>
								<td>\${data[0].january}</td>
								<td>\${data[0].february}</td>
								<td>\${data[0].march}</td>
								<td>\${data[0].april}</td>
								<td>\${data[0].may}</td>
								<td>\${data[0].june}</td>
							</tr>
							<tr>
								<td>\${data[1].category_name}</td>
								<td>\${data[1].january}</td>
								<td>\${data[1].february}</td>
								<td>\${data[1].march}</td>
								<td>\${data[1].april}</td>
								<td>\${data[1].may}</td>
								<td>\${data[1].june}</td>
							</tr>
							<tr>
								<td>\${data[2].category_name}</td>
								<td>\${data[2].january}</td>
								<td>\${data[2].february}</td>
								<td>\${data[2].march}</td>
								<td>\${data[2].april}</td>
								<td>\${data[2].may}</td>
								<td>\${data[2].june}</td>
							</tr>
							<tr>
								<td>\${data[3].category_name}</td>
								<td>\${data[3].january}</td>
								<td>\${data[3].february}</td>
								<td>\${data[3].march}</td>
								<td>\${data[3].april}</td>
								<td>\${data[3].may}</td>
								<td>\${data[3].june}</td>
							</tr>
							<tr>
								<td>\${data[4].category_name}</td>
								<td>\${data[4].january}</td>
								<td>\${data[4].february}</td>
								<td>\${data[4].march}</td>
								<td>\${data[4].april}</td>
								<td>\${data[4].may}</td>
								<td>\${data[4].june}</td>
							</tr>
						</tbody>
					</table>
					<table id="chartTable">
						<thead>
							<tr>
								<th>카테고리</th>
								<th>july</th>
								<th>august</th>
								<th>september</th>
								<th>october</th>
								<th>november</th>
								<th>december</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>\${data[0].category_name}</td>
								<td>\${data[0].july}</td>
								<td>\${data[0].august}</td>
								<td>\${data[0].september}</td>
								<td>\${data[0].october}</td>
								<td>\${data[0].november}</td>
								<td>\${data[0].december}</td>
							</tr>
							<tr>
								<td>\${data[1].category_name}</td>
								<td>\${data[1].july}</td>
								<td>\${data[1].august}</td>
								<td>\${data[1].september}</td>
								<td>\${data[1].october}</td>
								<td>\${data[1].november}</td>
								<td>\${data[1].december}</td>
							</tr>
							<tr>
								<td>\${data[2].category_name}</td>
								<td>\${data[2].july}</td>
								<td>\${data[2].august}</td>
								<td>\${data[2].september}</td>
								<td>\${data[2].october}</td>
								<td>\${data[2].november}</td>
								<td>\${data[2].december}</td>
							</tr>
							<tr>
								<td>\${data[3].category_name}</td>
								<td>\${data[3].july}</td>
								<td>\${data[3].august}</td>
								<td>\${data[3].september}</td>
								<td>\${data[3].october}</td>
								<td>\${data[3].november}</td>
								<td>\${data[3].december}</td>
							</tr>
							<tr>
								<td>\${data[4].category_name}</td>
								<td>\${data[4].july}</td>
								<td>\${data[4].august}</td>
								<td>\${data[4].september}</td>
								<td>\${data[4].october}</td>
								<td>\${data[4].november}</td>
								<td>\${data[4].december}</td>
							</tr>
						</tbody>
					</table>
					`;
				$('#totalOutMonthCategoryByYear').html(html);
				}
		});
	});
</script>
</html>