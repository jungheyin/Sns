<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Higram:create</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
<link rel="stylesheet" type="text/css" href="/css/postStyle.css">
</head>
<body>
	<div id="wrap" class="container">
		<header class="my-2">
			<div class="d-flex justify-content-between">
				<div class="mt-2 ml-2">
					<a href="/timeline/timeline_list_view">
						<img src="/staticImages/left.png" alt="뒤로가기" width="30px" height="30px">
					</a>
				</div>
				<a href="/post/post_create_view"class="d-flex mt-2">
					<img src="${contentView.user.profileImageUrl}" alt="프로필 사진" width="30px" height="30px">
					<h4 class="ml-2 mt-1 text-dark">${contentView.user.loginId}hi1856</h4> <!-- ${userLoginId} -->
				</a>
				<div class="mt-2 mr-2">
					<button id="saveBtn" class="btn d-none">저장</button>
						<img src="/staticImages/right.png" id="svaeImg" alt="앞으로가기" width="30px" height="30px">
					</a>
				</div>
			</div>
		</header>
		<!-- 글쓰기 부분 -->
		<section class="contents">
			<!-- 이미지파일 input부분 -->
			<div class="preview d-flex justify-content-end mr-5 mt-2">
				<input type="file" id="file" 
					class="d-none" accept=".gif, .jpg, .jpeg, .png">
				<a href="#" id="photoImg">
					<img src="/staticImages/photo.png" alt="이미지" width="30px" height="30px">
				</a>
			</div>
			<section>
			<!-- 사진 미리보기 부분 -->
				<div class=" d-flex justify-content-center mt-2" id="previewImg">
				<!-- <img src="${contentView.post.images}" width="500px"  id="image"> -->
				</div>
				<!-- 내용 -->
				<div class="d-flex justify-content-center mt-1">
					<textarea id="content" class="form-control"></textarea>
				</div>
			</section>
				
		</section>
	</div>
</body>
</html>
<script>
$(document).ready(function() {
		
	// 다음버튼 누르면 저장되고 timeline/timeline_list_view으로 이동
	
	// 사진선택하기
	$('#photoImg').on('click', function() {
		$('#file').click();
	});
	
	// 파일선택시 미리보기
	$('#file').on('change', function(e) {
		
		let file = $('#file').val();
		console.log(file);
		
		// 미리보기
		let fileImg = e.target.files[0]; // 이미지 선택
		let img = URL.createObjectURL(fileImg); // 이미지 미리보기
	  $('#image').attr('src', img);
	  
		let fileName = e.target.files[0].name; // 이미지 이름
		let extension = fileName.split('.');
		
		// 확장자 유효성
		if (extension.length < 2 || 
				(extension[extension.length - 1] != 'gif'
					&& extension[extension.length - 1] != 'jpeg'
					&& extension[extension.length - 1] != 'jpg'
					&& extension[extension.length - 1] != 'png')) {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$('#file').val(''); // 비워주어야 한다.
			return;
		}
		
		
	});
	
	// 글 저장
	$('#svaeImg').on('click', function(e) {
		$('#saveBtn').click();
		
		// 내용 부분
		let content = $('#content').val();
		if (content == '') {
			alert("내용을 입력해 주세요.");
			return;
		}
		
		// 이미지 파일
		let file = $('#file').val();
		console.log(file);
		
		if (file != '') {
			let ext = file.split('.').pop().toLowerCase();
			if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg'])== -1) {
				alert("gif, png, jpg, jpeg파일만 업로드 할 수 있습니다.");
				// 파일 비우기
				$('#file').val('');
				return;
			}
		}
			
		
		
		// form태그 만들기
		let formData = new FormData();
		
		formData.append("content", content);
		formData.append("file", $('#file')[0].files[0]);
		
		// ajax
		$.ajax({
			type: "POST"
			, url: "/post/create"
			, data: formData
			, enctype: "multipart/form-data" //필수설정
			, processData: false  // 필수설정
			, contentType: false // 필수설정
			, success: function(data) {
				if (data.result == "success") {
				 location.href="/timeline/timeline_list_view";
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("글쓰기에 실패했습니다.");
			}
		});
		
	});
	
});
</script>