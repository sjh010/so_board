<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Write</title>
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
<script>

	var fileList = [];	// 파일을 담을 리스트
	
	
	$(document).ready(function(){
		
		var $fileInput = $("#board_files");	// input file 태그
		var $fileZone = $("#fileZone");		// 파일 정보 및 드래그 앤 드랍 영역
		var $submit = $("#btnSubmit");		// 업로드 버튼
		var $form = $("#board_form");		// 게시물 폼
		
		// input file 태그를 통해서 파일을 선택할 때마다 리스트에 파일 추가 및 정보표시
		$fileInput.on("change", function(){	
			var file = $(this)[0].files;
			
			for(var i=0; i<file.length; i++){
				fileList.push(file[i]);
				$fileZone.append("<p>file name : " + file[i].name + " file size : " + file[i].size + "bytes</p>");
			}
		});
		
		// Upload 버튼 클릭 시, ajax를 통해 파일 업로드
		$submit.click(function(){
			
			var formData = new FormData();
			
			
			formData.append("board_title", $("#board_title").val());
			formData.append("board_content", $("#board_content").val());
			formData.append("board_writer", '<%=(String) session.getAttribute("member_id")%>');
			
			
			for(var i=0; i<fileList.length; i++){
				formData.append("board_files", fileList[i]);
			}
			
			console.log(formData);
			
			$.ajax({
				method : "POST",
				url : "writeBoard",
				processData : false,
				contentType : false,
				data : formData,
				success : function(url){
					console.log(url);
					$(location).attr("href", url);
					
				}
			});
		});
			
		$fileZone.on("dragover dragenter dragleave", function(event){
			event.stopPropagation();
			event.preventDefault();
			$fileZone.css({border : "2px dotted red"});
			return false;
		}, false);
			
		$fileZone.on("drop", function(event){			
			event.stopPropagation();
			event.preventDefault();
				
			$fileZone.css({border : "2px solid red"});
				
			var file = event.originalEvent.dataTransfer.files[0];
			fileList.push(file);
			$fileZone.append("<p>file name : " + file.name + " file size : " + file.size + "bytes</p>");
		});	
	});
	
	function openFileWindow(){
		$("#board_files").click();
	}

	//// HTML5의 Drag n Drop 속성 컨트롤
	function allowDrop(e){
		e.preventDefault();
	}
	
	function drag(e){
		console.log(e.target);
		e.dataTranfer.setData("text", e.target.name);
	}
	
	function drop(e){
		e.preventDefault();
	
		var file = e.dataTransfer.files[0];
		var dragZone = document.getElementById("dragZone");
		
		dragZone.innerHTML = "<p>file name : " + file.name + " file size : " + file.size + "bytes</p>";
		
		fileList.push(file);
	}
////

</script>

</head>
<body>
	<div class="container">
		
		<div class="page-header">
			<h1>자유게시판 <small>글쓰기</small></h1>
		</div>
	
		<form class="form-horizontal" id="board_form" enctype="multipart/form-data">
		
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
			
			 <div class="form-group board_file col-sm-12">
   				<button type="button" class="btn btn-info col-sm-1" id="btnFile" onclick="openFileWindow()">파일</button>
    			<input type="file" id="board_files" multiple="multiple" style="display:none">
    			<ul id="fileZone" class="col-sm-11">
    				
    			</ul>
  			</div>
	
			<div class="register col-sm-12">
				<button type="button" class="btn btn-primary" id="btnSubmit">등록</button>
			</div>
			
		</form>
	</div>

</body>
</html>