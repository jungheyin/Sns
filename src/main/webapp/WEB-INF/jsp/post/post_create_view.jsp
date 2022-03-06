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
		<header class="bg-warning">
			<div class="d-flex justify-content-between">
				<div class="mt-2 ml-2">
					<a href="/timeline/timeline_list_view">
						<img src="/staticImages/left.png" alt="뒤로가기" width="30px" height="30px">
					</a>
				</div>
				<div class="d-flex mt-2">
					<img src="/staticImages/catProfileIcon.png" alt="프로필 사진" width="30px" height="30px">
					<h5 class="ml-2 mt-1">hi1856</h5> <!-- ${userLoginId} -->
				</div>
				<div class="mt-2 mr-2">
					<button id="saveBtn" class="btn d-none">저장</button>
						<img src="/staticImages/right.png" alt="앞으로가기" width="30px" height="30px">
					</a>
				</div>
			</div>
		</header>
		<!-- 글쓰기 부분 -->
		<section class="contents">
				<div class="d-flex justify-content-end mr-5 mt-2">
					<input type="file" id="file" class="d-none" accept=".gif, .jpg, .jpeg, .png">
					<a href="#" id="photoImg"><img src="/staticImages/photo.png" alt="이미지" width="30px" height="30px"></a>
				</div>
			<section>
				<!-- 사진 -->
				<div class="d-flex justify-content-center mt-2">
					<div class="photoBox bg-info d-none">
						<!-- TODO: 사진 선택시 사진이 나타낸다. -->
					</div>
				</div>
				<!-- 내용 -->
				<div class="d-flex justify-content-center mt-1">
					<textarea id="content" class="form-control"></textarea>
				</div>
			</section>
				
		</section>
		<footer></footer>
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
	
	function handIeImgFileSelect(e) {
		let files = e.target.files;
		let filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			// https://greatps1215.tistory.com/4
			
		});
	}
	// 사진 업로드 했을 때, 사진파일이 보인다.
	$('#file').on('change', function() {
		
	});
});
</script>