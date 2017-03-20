<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
 	body {
		background: url(http://61.109.146.12:8080/GPMIS_V1.0/Images/ETC/login_bg_2010.jpg);

	}	 
</style>

<script>

	var active_menu = null;
	var menu = null;

	$(document).ready(function(){
		
		menu = '${menu}';
		
		if(menu != null){
			
			if(active_menu != null){
				active_menu.removeClass("active");
			}
			
			active_menu = $("nav a[name='${menu}']").parent();
			active_menu.addClass("active");
		}
		

	});

</script>
</head>
<body>

	<div id="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	
	<div id="view">
 		<c:choose>
			<c:when test="${menu eq 'main'}">
				<jsp:include page="main.jsp"></jsp:include>
			</c:when>
			<c:when test="${menu eq 'board'}">
				<c:choose>
					<c:when test="${subMenu eq 'list'}">
						<jsp:include page="boardList2.jsp"></jsp:include>
					</c:when>
					<c:when test="${subMenu eq 'view'}">
						<jsp:include page="boardView.jsp"></jsp:include>
					</c:when>
					<c:when test="${subMenu eq 'write'}">
						<jsp:include page="boardWrite.jsp"></jsp:include>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose> 
	</div>
	
</body>
</html>