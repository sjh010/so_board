<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	
	body{
		padding-top : 70px;
	}
	
	.navbar{
		background-color: #c3e7ec;
	}  


	.check{
		margin-bottom: 10px;
	}

	.error{
		color: red;
	}
	.success{
		color: green;
	}
	
	img{
		width : 150px;
		height: 70px;
		text-align: center;
	}
	.modal-header{
		text-align: center;
	}
	
	#btnLoginGo, #btnJoinGo{
		margin-top: 15px;
		font-size: 17px;
	}
	
</style>

<script>
	
	$(document).ready(function(){
		
		loginCheck();
		
		vaildation();
		
		$("#btnLogin").click(function(){
			$("#loginModal").modal();
		});
		
		$("#btnJoin").click(function(){
			$("#joinModal").modal();
		})

	});
	
	function loginCheck(){
		
		if('<%=(String)session.getAttribute("member_name")%>' != "null"){
			console.log("로그인되어있음.");
			console.log(member_name);
			$("#btnLogin").css("display","none");
			$("#btnJoin").css("display", "none");
			$("#btnLogout").css("display","block");
			$("#login_member").css("display", "block");
		}
	}
	
	function login(member_id, member_password){
		
		var member_id = member_id || $("#loginForm input[name='member_id']").val();
		var member_password = member_password || $("#loginForm input[name='member_password']").val();
		
		if(member_id == ""){
			alert("아이디를 입력하세요.");
			return;
		}
		else if(member_password == ""){
			alert("비밀번호를 입력하세요.");
			return;
		}
	
		var data = {"member_id" : member_id, "member_password" : member_password};
		
		$.ajax({
			url: "login",
			type: "POST",
			data: data,
			dataType: "text",
			success: function(response){
				if(response == "success"){
					$("loginForm").each(function(){
						this.reset();
					});
					location.reload();
				}
				else{
					alert("아이디 또는 비밀번호가 잘못되었습니다.");
				}
			}
		});
	}
	
	function logout(){
		
		$.ajax({
			url: "logout",
			type: "GET",
			dataType: "text",
			data: null,
			success: function(response){
				location.reload();
			},
			error: function(){
				alert("logout error");
			}
		});
	}
	
	function joinCheck(){
		
		console.log("join check");
		
		if($("#msgId").hasClass("success") && $("#msgPw").hasClass("success") && 
				$("#msgPwc").hasClass("success") && $("#joinModal #member_name").val() != "")
			return true;
		return false;
	}
	
	function join(){
		
		if(joinCheck() == false){
			alert("입력이 잘못되었습니다!");
		}
		else{
			var member_id = $("#joinForm #member_id").val();
			var member_password = $("#joinForm #member_password").val();
			var member_name = $("#joinForm #member_name").val();
			
			var member = {"member_id" : member_id, "member_password" : member_password, "member_name" : member_name};
			
			console.log(member);
			
			$.ajax({
				url: "join",
				type: "POST",
				data: member,
				success: function(){
					
					login(member_id, member_password);
				}
			});
		}
	}
	
	function vaildation(){
		
		$("#joinModal #member_id").focusout(function(){

			var msgId = $("#msgId");
			var val = $(this).val();
			var regex = /^[a-z0-9]{4,16}$/;
			
			if(val=="" || val==null){
				addError(msgId)
				msgId.text("필수 입력입니다.");
			}
			else if(!regex.test(val)){
				addError(msgId);
				msgId.text("4자리 이상 16자리 이하, 영문과 숫자만 가능합니다.");
			}
			else{
				addSuccess(msgId)
				msgId.text("가능한 아이디 입니다.")
			}
		});
		
		$("#joinModal #member_password").focusout(function(){
			
			var msgPw = $("#msgPw");
			var val = $(this).val();
			var regex = /^[a-z0-9]{4,16}$/;
			
			if(val=="" || val==null){
				addError(msgPw)
				msgPw.text("필수 입력입니다.");
			}
			else if(!regex.test(val)){
				addError(msgPw);
				msgPw.text("4자리 이상 16자리 이하, 영문과 숫자만 가능합니다.");
			}
			else{
				addSuccess(msgPw)
				msgPw.text("가능한 비밀번호 입니다.")
			}
			
		});
		
		$("#joinModal #member_password_confirm").focusout(function(){
			
			var password = $("#joinModal #member_password").val();
			var msgPwc = $("#msgPwc");
			var val = $(this).val();
			
			if(val=="" || val==null){
				addError(msgPwc);
				msgPwc.text("필수 입력입니다.");
			}
			else if(val != password){
				addError(msgPwc);
				msgPwc.text("일치하지 않습니다.");
			}
			else if(val == password){
				addSuccess(msgPwc);
				msgPwc.text("일치합니다.");
			}
		});
		
		function addError(selector){
			selector.removeClass("success");
			selector.addClass("error");
		}
		function addSuccess(selector){
			selector.removeClass("error");
			selector.addClass("success");
		}
	}
	

</script>

</head>
<body>

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">Home</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a name="board" href="boardList2"><strong>자유게시판</strong></a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a id="login_member" style="display:none"><strong>${member_name}님</strong></a></li>
					<li><a href="#" id="btnLogin"><strong>Login</strong></a></li>
					<li><a href="#" onclick="logout()" id="btnLogout"  style="display:none"><strong>Logout</strong></a>
					<li><a href="#" id="btnJoin"><strong>Join</strong></a></li>
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

					<img src="/resources/images/login.png"/>
				</div>
				<div class="modal-body">
					<form id="loginForm" method="post">
						<div class="form-group">
							<label for="member_id">ID</label> 
							<input type="text" class="form-control" name="member_id" placeholder="Input ID" />
						</div>
						<div class="form-group">
							<label for="member_password">PW</label> 
							<input type="password" class="form-control" name="member_password" placeholder="Input PW" />
						</div>

						<button type="button" onclick="login()" id="btnLoginGo" class="btn-block btn btn-primary">Login</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Join Modal -->
	<div class="modal fade" id="joinModal" tabIndex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content -->
			<div class="modal-content">
				<!-- Modal header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					
						<!-- <span class="glyphicon glyphicon-lock"></span> --> 
						<img src="/resources/images/join.png"/>
					
				</div>
				<div class="modal-body">
					<form id="joinForm">
						<div class="form-group">
							<label for="member_id">ID</label> <input type="text"
								class="form-control" id="member_id" placeholder="Input ID" />
						</div>
						<div id="msgId" class="check"></div>
						<div class="form-group">
							<label for="member_password">PW</label> <input type="password"
								class="form-control" id="member_password" placeholder="Input PW" />
						</div>
						<div id="msgPw" class="check"></div>
						<div class="form-group">
							<label for="member_password">PW Confirm</label> <input type="password"
								class="form-control" id="member_password_confirm" placeholder="Input PW" />
						</div>
						<div id="msgPwc" class="check"></div>
						<div class="form-group">
							<label for="member_id">NAME</label> <input type="text"
								class="form-control" id="member_name" placeholder="Input ID" />
						</div>
						<div id="msgName" class="check"></div>

						<button type="button" onclick="join()" id="btnJoinGo" class="btn-block btn btn-primary">Join</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>