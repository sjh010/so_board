<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			console.log("click");
			console.log($("#loginModal"));
			$("#loginModal").modal();
		});
	});
	
	
</script>

</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../board">Home</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a name="board" href="boardList2">자유게시판</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" id="btnLogin">Login</a></li>
					<li><a href="#" style="display:none">Logout</a>
					<li><a href="#">Join</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->	
		</div>
		<!-- /.container-fluid -->
	</nav>
	
	<!-- Login Modal -->
	<div class="modal fade" id="loginModal" tabIndex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content -->
			<div class="modal-content">
				<!-- Modal header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<h4>
						<span class="glyphicon glyphicon-lock"></span> Login
					</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="member_id">ID</label> <input type="text"
								class="form-control" id="member_id" placeholder="Input ID" />
						</div>
						<div class="form-group">
							<label for="member_password">PW</label> <input type="password"
								class="form-control" id="member_password" placeholder="Input PW" />
						</div>

						<button type="button" id="btnLogin" class="btn btn-primary">Login</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Login Modal -->
	<div class="modal fade" id="loginModal" tabIndex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content -->
			<div class="modal-content">
				<!-- Modal header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<h4>
						<span class="glyphicon glyphicon-lock"></span> Join
					</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="member_id">ID</label> <input type="text"
								class="form-control" id="member_id" placeholder="Input ID" />
						</div>
						<div class="form-group">
							<label for="member_password">PW</label> <input type="password"
								class="form-control" id="member_password" placeholder="Input PW" />
						</div>
						<div class="form-group">
							<label for="member_password">PW Confirm</label> <input type="password"
								class="form-control" id="member_password_confirm" placeholder="Input PW" />
						</div>
						<div class="form-group">
							<label for="member_id">NAME</label> <input type="text"
								class="form-control" id="member_name" placeholder="Input ID" />
						</div>

						<button type="button" id="btnLogin" class="btn btn-primary">Join</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>