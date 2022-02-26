<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="signUpWrap" class="container">
<form id="signUpForm" method="post" action="/user/sign_up">
		<!-- 아이디 -->
	<div class="form-group mt-3 ">
		<div class="d-flex justify-content-between">
			<span class="text-secondary font-weight-bold">*아이디(4글자 이상)</span>
			<div id="idLoginIdLength" class="small d-none text-danger font-weight-bold">4글자 이상 입력해주세요.</div>
			<div id="idCheckDuplicated" class="small d-none text-danger font-weight-bold">아이디 중복확인을
				해주세요.</div>
			<div id="idIsDuplicate" class="small d-none text-danger font-weight-bold">중복된 아이디 입니다.</div>
			<div id="idCheckOk" class="small d-none font-weight-bold">사용 가능한 아이디 입니다.</div>
		</div>
		<input type="text" id="loginId" class="form-control mb-1" name="loginId"
			placeholder="ID">
			
		<button type="button" id="loginIdCheckBtn" class="btn d-none">
			중복확인</button>
		<label><span id="loginIdCheckText" class="ml-1 font-weight-bold">중복확인</span></label>
	</div>
	<!-- 이름 -->
	<div class="form-group">
		<span class="text-secondary font-weight-bold">*이름</span> <input
			type="text" id="name" class="form-control" name="name"
			placeholder="NAME">
	</div>
	<!-- 비밀번호 -->
	<div class="form-group">
		<div class="d-flex justify-content-between">
			<span class="text-secondary font-weight-bold">*비밀번호</span>
			<div id="isdifferntPassword" class="small d-none text-danger font-weight-bold">비밀번호가 일치하지
				않습니다.</div>
			<div id="isSamePassword" class="small d-none font-weight-bold">비밀번호가 일치합니다.</div>
			<div id="passwordRule" class="small font-weight-bold text-warning">특수문자/문자/숫자 포함 형태의 8~15자리 이내</div>
		</div>
		<input type="password" id="password" class="form-control"
			name="password" placeholder="PASSWORD">
	</div>

	<div class="form-group">
		<span class="text-secondary font-weight-bold">*비밀번호</span> <input
			type="password" id="confirmPassword" class="form-control"
			name="password" placeholder="PASSWORD">
	</div>
	<!-- 이메일 -->
	<div class="form-group">
		<div class="d-flex justify-content-between">
			<span class="text-secondary font-weight-bold">*이메일</span>
			<div id="notEmail" class="small d-none text-danger font-weight-bold">사용할수 없는 이메일입니다.</div>
			<div id="emailOk" class="small d-none font-weight-bold">사용할수 있는 이메일입니다.</div>
		</div>
		<input type="text" id="email" class="email form-control"
			name="email" placeholder="EMAIL(higram@higram.com)">
	</div>

	<div>
		<input type="submit" id="signUpBtn"
			class="btn btn-block font-weight-bold text-white"
			value="회원가입">
	</div>
</form>
</div>



<script>
	$(document).ready(function() {
		
		// 중복확인 text 누르면 btn이 눌린다.
		$('#loginIdCheckText').on('click', function(e) {
			$('#loginIdCheckBtn').click();
		
			let loginId = $('#loginId').val().trim();

			// 초기화
			// 아이디
			$('#idLoginIdLength').addClass('d-none');
			$('#idCheckDuplicated').addClass('d-none');
			$('#idIsDuplicate').addClass('d-none');
			$('#idCheckOk').addClass('d-none');

			// 4글자 이상
			if (loginId.length < 4) {
				$('#idLoginIdLength').removeClass('d-none');
				return;
			}

			// ajax
			$.ajax({
				type : "POST",
				url : "/user/is_duplicated_id",
				data : {
					"loginId" : loginId
				},
				success : function(data) {
					if (data.result == true) {
						// 중복
						$('#idIsDuplicate').removeClass('d-none');
					} else if (data.result == false) {
						// 중복이 아닌경우
						$('#idCheckOk').removeClass('d-none');
					} else {
						// 에러
					}
				},
				error : function() {
					alert("아이디 중복확인에 실패 했습니다.");
				}
			});
		});
	
		// 회원가입버튼
		$('#signUpForm').on('submit', function(e) {
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
			
			// 비밀번호 초기화
			$('#isdifferntPassword').addClass('d-none');
			$('#isSamePassword').addClass('d-none');
			$('#passwordRule').removeClass('d-none');
			

			
			let regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

			if(!regExpPw.test($("input[id='password']").val())) {

				return false;
			} else if (password != confirmPassword) {
				$('#isdifferntPassword').removeClass('d-none');
				$('#passwordRule').addClass('d-none');
				$('#password').val('');
				$('#confirmPassword').val('');
				return false;
			} else if (password == confirmPassword) {
				$('#isSamePassword').removeClass('d-none');
				
				return false;
			}
			
		
			
			// 이메일
			let email = $('.email').val().trim();
			alert("이메일");
			if (email == '') {
				alert("이메일을 입력하세요.");
				return false;
			}
			
			$('#notEmail').addClass('d-none');
			$('#emailOk').addClass('d-npne');
			
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				
			if (email.match(regExp) != null) {
				$('#emailOk').removeClass('d-none');	
				return false;
			} else {
				$('#notEmail').removeClass('d-none');
				return false;
			}
			

			// TODO: 이메일 형식으로 입력하세요 만들기
			
			// 아이디 중복확인 되었는지 확인
			if($('#idCheckOk').hasClass('d-none')) { //true이면 중복확인이 안됨!!
				alert("아이디 중복확인을 해주세요.");
				return;
			}
			
		
		});

	});
</script>
