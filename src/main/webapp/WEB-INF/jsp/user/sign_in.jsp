<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="contents">
	<form id="lgoinForm" method="post" action="/user/sign_in">
		<div class="d-flex justify-content-center">
			<input type="text" name="loginId" id="loginId" 
				class="form-control col-3 mb-2 mt-4" placeholder="ID">
		</div>
			
		<div class="d-flex justify-content-center">
			<input type="password" name="password" id="password" 
				class="form-control col-3" placeholder="PASSWORD">
		</div>
			
		<div class="d-flex justify-content-center mt-4">
			<input type="submit" name="loginBtn" id="loginBtn" 
				class="loginBtn btn btn-block col-3 font-weight-bold text-white" 
				value="로그인">
		</div>
			
		<div class="d-flex justify-content-center mt-2">
			<a href="/user/sign_up_view" 
				class="signUpBtn text-white btn btn-block col-3 font-weight-bold 
					">
				회원가입</a>
		</div>
			
	</form>
</div>

<script>
$(document).ready(function() {
	// 로그인 버튼
	$('#lgoinForm').on('submit', function(e) {
		e.preventDefault();
		
		// alert("로그인");
		
		// validation
		let loginId = $('#loginId').val().trim();
		if (loginId == '') {
			alert("ID를 입력하세요.");
			return false;
		}
		
		let password = $('#password').val().trim();
		if (password == '') {
			alert("PASSWORD를 입력해주세요.");
			return false;
		}
		
		//ajax
		
		$.ajax({
			type: "POST"
			, url: "/user/sign_in"
			, data: {"loginId":loginId, "password":password}
			, success: function(data) {
				if (data.result == "success") {
					// 성공
					location.href ="/timeline/timeline_list_view";
				} else {
					// 실패
					alert(data.errorMessage);
				}
			}
			, error: function(error) {
				alert("실패");
			}
		});
	});
});	
</script>
