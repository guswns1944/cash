<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
 <a class="navbar-brand" href="#">Cashbook</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="/admin/index">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/admin/cashbookByMonth/now/-1/-1">cashbookByMonth</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/cashStats.html">cashStats</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/admin/logout">logout</a>
      </li>
    </ul>
  </div>
</nav>

