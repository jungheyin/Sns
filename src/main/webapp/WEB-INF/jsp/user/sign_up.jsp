<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="signUpWrap" class="container">
	<form id="signUpForm" method="post" action="/user/sign_up">
		<!-- 아이디 -->
		<div class="form-group">
			<div class="d-flex justify-content-between">
				<span class="text-secondary font-weight-bold">*아이디</span>
				<!-- 아이디 문구 -->
				<div id="idLoginIdLength" class="small d-none text-info font-weight-bold">
					4글자 이상 입력 가능합니다.
				</div>
				<div id="idCheckDuplicated" class="small d-none text-danger font-weight-bold">
					아이디 중복확인을 해주세요.
				</div>
				<div id="idIsDuplicate" class="small d-none text-danger font-weight-bold">
					중복된 아이디 입니다.
				</div>
				<div id="idCheckOk" class="small d-none font-weight-bold">
					사용 가능한 아이디 입니다.
				</div>
			</div>
				
				<input type="text" id="loginId" class="form-control" name="loginId"
					placeholder="ID(4글자 이상)" >
				
				<button type="button" id="loginIdCheckBtn" class="btn d-none"></button>
				<label id="loginIdCheckText">
				<span class="font-weight-bold">중복확인</span>
				</label>
		</div>
		<!-- 이름 -->
		<div class="form-group">
			<span class="text-secondary font-weight-bold">*이름</span>
			<input type="text" id="name" name="name" class="form-control"
				placeholder="NAME">
		</div>
		<!-- 비밀번호 -->
		<div class="form-group">
			<div class="d-flex justify-content-between">
				<span class="text-secondary font-weight-bold">*비밀번호</span>
				<!-- 비밀번호 문구 -->
				<div id="isDifferentPassword" class="small d-none text-danger font-weight-bold">
					비밀번호가 일치하지 않습니다.
				</div>
				<div id="isSamePassword" class="small d-none font-weight-bold">
					비밀번호가 일치합니다.
				</div>
				<div id="passwordRule" class="small d-none text-info font-weight-bold">
					특수문자/문자/숫자 포함 형태의 8~15자리 이내 입력 가능합니다.
				</div>
			</div>
				
				<input type="password" id="password" class="form-control mb-3" 
					name="password" placeholder="특수문자/문자/숫자 포함 형태의 8~15자리 이내" >
					
		<!-- 확인 비밀번호 -->
		<div class="form-group">
			<span class="text-secondary font-weight-bold">*비밀번호</span>
			<input type="password" id="confirmPassword" name="confirmPassword" 
				class="form-control"placeholder="PASSWORD">
		</div>
		
		<!-- 이메일 -->
		<div class="form-group">
			<div class="d-flex justify-content-between">
				<span class="text-secondary font-weight-bold">*이메일</span>
			
				<!-- 비밀번호 문구 -->
				<div id="notEmail" class="small d-none text-danger font-weight-bold">
					사용 할 수 없는 이메일입니다.
				</div>
				<div id="emailOk" class="small d-none font-weight-bold">
					사용 할 수 있는 이메일입니다.
				</div>
				
			</div>
			<div>
				<input type="text" id="email" class="form-control mb-4" 
					name="email" placeholder="higram@higram.com" >
			</div>		
		<!-- 회원가입 버튼 -->			
		<div>
			<input type="button" id="signUpBtn" 
				class="btn btn-block fornt-weight-bold text-white"
				value="회원가입">
		</div>		
	</form>
</div>

<script>
$(document).ready(function(e) {
	//중복확인 버튼
	$('#loginIdCheckText').on('click', function() {
		$('#loginIdCheckBtn').click();
		
		let loginId = $('#loginId').val().trim();
		
		// id 문구 초기화
		$('#idLoginIdLength').addClass('d-none');
		$('#idCheckDuplicated').addClass('d-none');
		$('#idIsDuplicate').addClass('d-none');
		$('#idCheckOk').addClass('d-none');
		
		if (loginId.length < 4) {
			$('#idLoginIdLength').removeClass('d-none');
			return;
		}
		
		// ajax
		$.ajax({
			type : "POST"
			,url : "/user/is_duplicated_id"
			, data: {"loginId": loginId}
			, success: function(data) {
				if (data.result == true) {
					// 중복
					$('#idIsDuplicate').removeClass('d-none');
				} else if (data.result == false) {
					// 중복이 아닌 경우
					$('#idCheckOk').removeClass('d-none');
				}
			}
			, error: function(error) {
				alert("아이디 중복확인에 실패 했습니다.");
			}
		});
	});
	
	// 이메일 정규식 체크
	function emailCheck(email) {
		var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		return reg.test(email);
	}
	// 비밀번호 정규식 
	function passwordCheck(password) {
		var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
 
		return regExp.test(password);
	}	
	// 회원가입 버튼
	$('#signUpBtn').on('click', function(e) {
		//e.preventDefault();
		// alert("회원가입");
		
		// 로그인
		let loginId = $('#loginId').val().trim();
		if(loginId == '') {
			alert("아이디를 입력해 주세요.");
			return false;
		}
		
			// 중복확인 눌렀는지 확인
		if ($('#idCheckOk').hasClass('d-none')) {
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
		
		// 이름
		let name = $('#name').val().trim();
		if (name == '') {
			alert("이름을 입력해 주세요.");
			return false;
		}
	
	
		// 비밀번호
		let password = $('#password').val();
		let confirmPassword = $('#confirmPassword').val();
		
			// 비밀번호 초기화
			$('#isDifferentPassword').addClass('d-none');
			$('#isSamePassword').addClass('d-none');
			$('#passwordRule').addClass('d-none');
			
		if (password == '' ||confirmPassword == '') {
			alert("비밀번호를 입력하세요.");
			return false;
		} else if (!passwordCheck(password)) {
			$('#passwordRule').removeClass('d-none');
			return false;
		} else if (password != confirmPassword) {
			$('#isDifferentPassword').removeClass('d-none');
			$('#password').val('');
			$('#confirmPassword').val('');
			return false;
		} else if (password == confirmPassword) {
			$('#isSamePassword').removeClass('d-none');
		} 
		
		// 이메일
		let email = $('#email').val().trim();
		
		$('#notEmail').addClass('d-none');
		$('#emailOk').addClass('d-none');
		
		 if (email == '') {
			 alert("이메일은 입력해 주세요.");
			 return false;
		 }  else if (!emailCheck(email)) {
			 $('#notEmail').removeClass('d-none');
			 return false;
		 } else if (emailCheck(email)) {
			 $('#emailOk').removeClass('d-none');
			
		 }
		 
		 
		// ajax 호출
		let url = $('#signUpForm').attr('action');
		let params = $('#signUpForm').serialize();
		
		$.post(url, params)
		.done(function(data) {
			if (data.result == 'success') {
				// 성공
				alert("회원가입에 성공 했습니다.");
				location.href = "/user/sign_in_view";
			} else {
				alert("회원가입에 실패 했습니다.");
			}
		});
	});
});
</script>