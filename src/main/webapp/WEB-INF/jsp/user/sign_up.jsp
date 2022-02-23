<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/css/sign/signUpStyle.css">
</head>
<body>
	<div id="wrap" class="container">
		<header class="d-flex align-items-center justify-content-center">
			<h4 class="logo mt-5">Higram</h4>
		</header>
		<section class="content">

		<form id="signUpForm" method="post" action="/user/sign_up">
			<div class="form-group mt-3 ">
				<!-- 아이디 -->
			 	<div class="d-flex justify-content-between">
			 		<span class="text-secondary font-weight-bold">*아이디(4글자 이상)</span>
			 		<div id="idLoginIdLength" class="small d-none">4글자 이상 입력해주세요.</div>
			 		<div id="idCheckDuplicated" class="small d-none">아이디 중복확인을 해주세요.</div>
			 		<div id="idIsDuplicate" class="small d-none">중복된 아이디 입니다.</div>
			 		<div id="idCheckOk" class="small d-none">사용 가능한 아이디 입니다.</div>
			 	</div>
			 	<input type="text" id="loginId"class="form-control" 
			 		name="loginId" placeholder="ID">
			 	<button type="button" id="loginIdCheckBtn" class="btn small">
			 		중복확인
			 	</button>
			</div>
			<!-- 이름 -->
			<div class="form-group">
					<span class="text-secondary font-weight-bold">*이름</span>
					<input type="text" id="name"class="form-control" 
						name="name" placeholder="NAME">
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<div class="d-flex justify-content-between">
					<span class="text-secondary font-weight-bold">*비밀번호</span>
					<div id="isdifferntPassword" class="small d-none">비밀번호가 일치하지 않습니다.</div>
					<div id="isSamePassword" class="small d-none">비밀번호가 일치합니다.</div>
				</div>
					<input type="password" in="password" class="form-control" 
						name="password" placeholder="PASSWORD">
			</div>
			<div class="form-group">
					<span class="text-secondary font-weight-bold">*비밀번호</span>
					<input type="password" id="confirmPassword" class="form-control" 
						name="password" placeholder="PASSWORD">
			</div>
			<!-- 이메일 -->
			<div class="form-group mb-3">
					<span class="text-secondary font-weight-bold">*이메일</span>
					<input type="text" id="email" class="form-control" 
						name="name" placeholder="EMAIL(higram@higram.com)">
			</div>
			
			<div>
				<input type="submit" id="signUpBtn" 
					class="btn btn-warning btn-block font-weight-bold text-secondary" 
					value="회원가입">
			</div>
		</form>	
		</div>
		</section>
		<footer class="d-flex justify-content-center align-items-end">
			<samll class="text-secondary">Copyright.Higram</samll>
		</footer>
	</div>
</body>

<script>
$(document).ready(function() {
	
	// 아이디 중복 확인
	$('#loginIdCheckBtn').on('click', function() {
		// alert("중복");
		let loginId = $('#loginId').val().trim();
		
			// 초기화
	   	$('#idLoginIdLength').addClass('d-none')
		$('#idCheckDuplicated').addClass('d-none')
		$('#isSamePassword').addClass('d-none')
		$('#isdifferntPassword').addClass('d-none')
		$('#idIsDuplicate').addClass('d-none')
	  
		// 4글자 이상
		if (loginId.length < 4) {
			$('#idLoginIdLength').removeClass('d-none');
		} 
		
		// ajax
		$.ajax({
			type:"POST"
			, url: "/user/is_duplicated_id"
			, data: {"loginId":loginId}
			, success: function(data) {
				if (data.result == true) {
					// 중복
					$('#idIsDuplicate').removeClass('d-none');
				} else if (data.result == false) {
					// 중복이 아닌경우
					$('#idCheckOk').removeClass('d-none');
				} else {
					// 에러
				}
			}	
			, error: function() {
				alert("아이디 중복확인에 실패 했습니다.");
			}
		});
	});
	
	 $('#signUpForm').on('submit', function(){
		e.preventDefault();
		
		// validation
		
		let loginId = $('#loginId').val().trim();
		if (loginId == '') {
			alert("아이디를 입력하세요.");
			return false;
		}
		
		let name = $('#name').val().trim();
		if (name == '') {
			alert("이름을 입력하세요.");
			return false;
		}
		
		let password = $('#password').val();
		let confirmPassword = $('#confirmPassword').val();
		if (password == '' || confirmPassword == '') {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		// 비밀번호 다르면 텍스트값 초기화
		if (password != confirmPassword) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		// TODO: 정규식 알아보기!!
		
		let email = $('#email').val().trim();
		if (email == '') {
			alert("이메일을 입력하세요.");
			return false;
		}
		
		// TODO: 이메일 형식으로 입력하세요 만들기
		
		// 아이디 중복확인 되었는지 확인
		if($('#idCheckOk').hasClass('d-none')) { //true이면 중복확인이 안됨!!
			alert("아이디 중복확인을 해주세요.");
			return;
		}
		
		// ajax 서브밋
		let url = $('#signUpForm').attr('action');
		let params = $(this).serialize();
		
		$.post(url,params)
		.done(function(data)) {
			// 응답값
			if (data.result == 'success') {
				// 성공
				alert("Higram에 오신걸 환영합니다.");
				location.href="/user/sign_in_view";
			} else {
				// 실패
				alert("회원가입에 실패했습니다. 다시 시도해주세요" ); 
			}
		});
	});
 
});
</script>
</html>