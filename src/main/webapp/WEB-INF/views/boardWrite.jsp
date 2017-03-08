<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	session.setAttribute("user_id", "sojeonghwan");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Write</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
	.board_title{
		margin-top: 20px;
	}
	.board_content{
		text-align: center;
	}
	.register{
		margin-top: 10px;
		text-align: center;
	}
</style>
</head>
<body>
	<div class="container">
		
		<div class="page-header">
			<h1>자유게시판 <small>글쓰기</small></h1>
		</div>
	
		<form action="writeBoard" method="post" class="form-horizontal">
		
			<div class="form-group board_title">
				<label for="inputTitle" class="col-sm-1 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" name="board_title" class="form-control" id="board_title">
				</div>
			</div>
			
			<div class="form-group board_content">
				<label for="inputContent" class="col-sm-1 control-label">내용</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="20" name="board_content" id="board_content"></textarea>
				</div>
			</div>
	
			<div class="register col-sm-12">
				<button type="submit" class="btn btn-primary" id="btnRegister">등록</button>
			</div>
			
		</form>
	</div>

</body>
</html>