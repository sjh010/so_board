<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>

<style>
	@media screen and (max-width:600px) {
		.regdate,.regno,.writer,.viewcount{
			visibility: hidden;
		}
	 .title{
			visibility: visible;
		}
	}
	#table1 th, td{
		text-align: center;
	}
	#table1 td.title{
		text-align: left;
	}
	#write{
		position: relative;
		text-align: right;
	}
	.title>a{
		text-decoration: none;
		color: #000;
	}
	#search{
		margin-top: 10px;
	}
	#search1{
		width: 35%;
	}
	#search2{
		width: 65%;
	}

	#pagination{
		text-align: center;
	}
</style>

<script>
	
	$(document).ready(function(){
		
		$(".pagination").html("${paging}");
		
		$("#btnWrite").click(function(){
			$(location).attr("href", "/board/write");
		});
	});
	
</script>

</head>

<body>
	<div class="container">
	
		<div class="page-header">
			<h1>자유게시판 <small>자유게시판</small></h1>
		</div>
	
		<table class="table table-hover" id="table1">
			<tr>
				<th class="col-md-1 regno hidden-xs">No</th>
				<th class="col-md-5 title">제목</th>
				<th class="col-md-2 writer hidden-xs">작성자</th>
				<th class="col-md-3 regdate hidden-xs">날짜</th>
				<th class="col-md-1 viewcount hidden-xs">조회수</th>
			</tr>
			
			<c:forEach items="${boardList}" var="board">
				<tr>
					<td class="col-md-1 regno hidden-xs">${board.board_no}</td>
					<td class="title col-md-5">
						<a href="boardView?board_no=${board.board_no}">${board.board_title}</a><span class="badge">5</span>
					</td>
					<td class="col-md-2 writer hidden-xs">${board.board_writer}</td>
					<td class="col-md-3 regdate hidden-xs">${board.board_regdate}</td>
					<td class="col-md-1 viewcount hidden-xs">1</td>
				</tr>
			</c:forEach>
			
		</table>
		
		<div id="pagination"> <!-- < 1 2 3 4 5 > -->
			<nav>
				<ul class="pagination"></ul>
			</nav>
		</div><!-- end pagination -->
		
		<div id="write">
			<button type="button" class="btn btn-primary" id="btnWrite">글쓰기</button>
		</div>
		
		<div id="search">
			<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
			<div class="input-group">
				<select class="form-control" id="search1">
					<option>제목+본문</option>
					<option>제목만</option>
					<option>작성자</option>
				</select>
				<input type="text" class="form-control" id="search2">
	      		<span class="input-group-btn">
	        		<button class="btn btn-primary glyphicon glyphicon-search" type="button"></button>
	      		</span>
	    	</div>
	    	</div>
	    	<div class="col-md-4"></div>
	    	</div>
    	</div><!-- end search -->
    	
	</div><!-- end container -->
</body>
</html>