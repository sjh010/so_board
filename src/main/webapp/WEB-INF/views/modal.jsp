<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Login Modal -->
	<div class="modal fade" id="login" role="dialog">
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

</body>
</html>