<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div id="mainbar">
  	<div id="logo">
  		<h1><a href="${pageContext.request.contextPath}/admin/index">Cashbook</a></h1>
  	</div>
  	<div id="menu" class="box">
	    <ul>
	      <li>
	        <a href="${pageContext.request.contextPath}/admin/index">Home</a>
	      </li>
	      <li>
	        <a href="${pageContext.request.contextPath}/admin/cashbookByMonth/now/-1/-1">cashbookByMonth</a>
	      </li>
	      <li>
	        <a href="${pageContext.request.contextPath}/admin/cashbookList/1">cashbookList</a>
	      </li>
	       <li >
	        <a href="${pageContext.request.contextPath}/admin/noticeList/1">noticeList</a>
	      </li>
	       <li >
	        <a href="${pageContext.request.contextPath}/admin/chart1.jsp">chart</a>
	      </li>
	       <li >
	        <a href="${pageContext.request.contextPath}/admin/visitorbookList/1">visitors</a>
	      </li>
	       <li >
	        <a href="${pageContext.request.contextPath}/admin/addMember">sign up</a>
	      </li>
	      
	      <li >
	        <a href="${pageContext.request.contextPath}/admin/logout">logout</a>
	      </li>
	    </ul>
	</div>
  </div>

