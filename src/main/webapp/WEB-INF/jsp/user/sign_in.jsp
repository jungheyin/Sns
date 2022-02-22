<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Higram:로그인</title>

 <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script><link rel="stylesheet" type="text/css" href="/css/sign/signInStyle.css">
</head>
<body>
		<div id="wrap" class="container d-flex justify-content-center align-items-center">
			<form id="loginForm" method="post" action="/user/sign_in">
				<div class="w-100">
					<h4 class="text-center mb-4">Higram</h4>
					
					<input type="text" id="loginId" name="loginId" 
					class="form-control mb-3" placeholder="ID">
					
					<input type="password" id="password" name="password"
					class="form-control mb-4" placeholder="PASSWORD">
					
					<input type="submit" class="btn btn-block btn-warning" value="로그인">
				
					<a href="/user/sign_up_view" class="btn btn-secondary btn-block">회원가입</a>
				</div>
			</form>
		</div>
		
<script>
$(document).ready(function() {

	$('#loginForm').on('submit', function(e) {
		e.preventDefault();
		// alert("클릭");
		// validation 
		let loginId = $('#loginId').val().trim();
		if (loginId == '') {
			alert("ID를 입력해주세요.");
			return false;
		}
		
		let password = $('#password').val();
		if (password == '') {
			alert("PASSWORD를 입력해주세요.");
			return false;
		}

		// ajax 
		
		let url = $(this).attr('action');
		let param = 
		
		$.post(url,param)

		 
	});
	
	
});


</script>		
</body>
</html>