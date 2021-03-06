<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>

<style>
	.panel-body{
		height: 300px;
	}
	
	#writeInfo{
		display: inline-block;
	}
	
	#table1{
		background-color: lightblue;
		
	}
	#title{
		padding-left: 15px;
	}

	#reply{
		height: 100px;
	}
	
</style>
</head>
<body>
	<div class="container">
		<div class="page-header">
				<h1>자유게시판 <small>글보기</small></h1>
		</div>
		
		<div class="panel panel-info">
			<table class="table panel-info" id="table1">
				<tr>
					<th id="title" class="col-sm-8">${board.board_title}</th>
		    		<th id="regdate" class="col-sm-2">작성일 : ${board.board_regdate}</th>
		    		<th id="writer" class="col-sm-2">작성자 : ${board.board_writer}</th>
				</tr>
				</table> 	    
		  	<div class="panel-body">
		    	${board.board_content}
		  	</div>
		</div>
		
		<div class="row" id="reply">
			<div class="col-lg-12">
    			<div class="input-group">
      				<input type="text" class="form-control" placeholder="댓글을 입력하세요.">
      				<span class="input-group-btn">
        				<button class="btn btn-info" type="button">댓글달기</button>
      				</span>
      			</div><!-- /input-group -->
			</div><!-- /.col-lg-6 -->
		</div><!-- /row -->
	</div>
</body>
</html>