<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Higram</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
  <link rel="stylesheet" type="text/css" href="/css/timelineStyle.css">
</head>
<body>
	<div id="wrap" class="container">
		<header>
			<div class="d-flex align-items-end justify-content-between">
				<div class="mt-5">
					<h2 class="ml-3 text-dark">Higram</h2>
				</div>
				<div class="d-flex">
					<div class="mr-3">
						<a href="/post/post_create_view">
						<img src="/staticImages/plus.png" width="30px" height="30px"
							id="plusImg" alt="메뉴">
						</a>
					</div>
					<div class="mr-3">
						<button class="btn d-none" id="menuBtn">메뉴</button>
						<img id="menuImg" src="/staticImages/menu.png" alt="메뉴"
							width="30px" height="30px">
					</div>
				</div>
			</div>
			<hr>
		</header>
		<body>
		<!-- 타임라인 영역 -->
		<c:forEach items="${contentList}" var="content">
			<section class="contents mt-4">
				<section class="d-flex justify-content-center">
				
					<!-- 글쓴이 프로필사진, 글쓴이 아이디  + ... 더보기-->
					<div class="feedBox">
						<div class="feedHeader d-flex justify-content-between align-items-center">
							<!-- 프로필 : 누르면 마이페이지로 이동한다. -->
							<a href="#">
								<div class="userProfileId d-flex ml-2">
									<label class="mr-2"><img src="${contentView.user.profileImageUrl}" alt="프로필 사진" width="40px" height="40px"></label>
									<h4 class="m-1 text-dark">${content.user.name}</h4>
								</div>
							</a>
							
						<!-- 글쓴 사용자와 로그인 사용자가 일치할 때만 삭제 가능 -->
						<c:if test="${userName eq content.user.name}">
							<a href="#" data-toggle="modal" class="moreBtn" data-target="#MoreModal" data-post-id="${content.post.id}">
								<img src="/staticImages/moreIcon.png" id="feedHeaderMoreImg" alt="더보기" width="25px" 
									class="mr-3" height="25px">
							</a>
						</c:if>
						</div>
						
						<!-- 이미지-->
						<div class="feedImage bg-primary">
							<img src="${content.post.imagePath}" alt="피드사진" width="600px">
						</div>
						
						<!-- 좋아요 -->
						<div class="feedLike d-flex mt-2">
							<div class="ml-2 mr-2">
								<a href="#" class="likeBtn">
									<!-- 좋아요 해제 상태 -->
									<img src="/staticImages/basicHeart.png" id="basicHeartImg" 
										width="35px" height="35px" alt="하트" >
									<!-- 좋아요 상태 -->
									<img src="/staticImages/pinkHeart.png" id="basicHeartImg" class="d-none"
										width="35px" height="35px" alt="핑크하트">
								</a>
								<a href="#">
									<span class="font-weight-bold">좋아요 2개</span>
								</a>
							</div>
						</div>
						<!-- 글쓴이, 내용 -->
						<div class="ml-2 mt-2">
								<span id="userLoginId" class="m-1">${content.user.name}</span>
								<span class="ml-3">
									${content.post.content}
								</span>
						</div>
		
					<!-- 댓글: 댓글이 있는 경우에만 댓글 영역 노출-->
					<c:if test="${not empty content.commentList}">
					<!-- 댓글 목록  -->
					<c:forEach items="${content.commentList}" var="commentView">
						<div class="ml-5 mt-2 d-flex border-left">
							<span class="font-weight-bold mx-3">${commentView.user.name}</span>
							<span>${commentView.comment.content}</span>
							
							<!-- 댓글쓴이가 본인이면 삭제버튼 노출 -->
							<a hrdf="#" class="commentDelBtn" data-comment-id="${comment.id}">
								<img src="" alt="삭제" width="30px" height="30px">
							</a>
						</div>		
					</c:forEach>		
				</c:if> 
				
				<!-- 댓글 쓰기 -->
				<!-- 로그인 된 상태에서만 쓸 수 잇다. -->
				<c:if test="${not empty userId}">
					<!-- 댓글쓴이 프로필,  -->
					<div class="comment_write  mt-2 d-flex ml-2">
						<div class="mr-3">
							<img src="${commentView.user.profileImageUrl}" alt="사용자" id="profile"
								data-comment-userLoginid="${commentView.user.loginId}"
								width="40px" height="40px">
						</div>
						
							<input type="text" id="commentText${post.id}" 
								class="form-control col-10 " placeholder="댓글달기..." >
								
						<div class="ml-3">
							<button type="button" class="commentBtn btn d-none" data-post-id="${post.id}"></button>
							<img src="/staticImages/send.png" id="sendImg" alt="댓글달기"
								class="mt-1 " width="35px" height="35px">
						</div>
					</div>
				</c:if>
				
			</section>
		</section>	
		</c:forEach>			
		</body>
	</div>
</body>
</html>
<!-- siblings: 형제를 찾는 함수 
let commentContent = $(this).siblings('input'.val().trim();-->

<!-- Modal -->
<div class="modal fade" id="MoreModal">
  <div class="modal-dialog modal-sm modal-dialog-centered" role="document"> 
    <div class="modal-content ">
     	<!-- model창 안에 내용 넣기 -->
     	<div>
     		<div class="my-3 text-center">
     			<a href="#" class="delPost d-block">삭제하기</a>
     		</div>
     		<div class="border-top py-3 text-center">
     			<a href="#" class="cancel d-bolck" data-dismiss="modal">취소</a>
     		</div>
     	</div>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {
	
	// 프로필 누르면 마이페이지 이동
	
	// + 누르면 create이동
	$('#plusImg').on('click', function(e) {
		$('#plusBtn').click();
	});
	
	// 메뉴
	
	// 더보기 버튼 
	$('#feedHeaderMoreImg').on('click', function() {
		$('#feedHeaderMoreBtn').click();
		
	});

	// 하트버튼 누르기
	
	// 댓글 쓰기 - 게시 버튼 클릭
	$('#sendImg').on('click', function(e) {
		$('.commentBtn').click();
		
		// 글의 번호
		let postId = $(this).data('post-id'); // data-post-id => 하이픈으로 사용해야한다.
		// alert(postId);
		
		// input 태그 : 
		let commentContent = $('#commentText' + postId).val().trim();
		// alert(commentContent);
		if (commentContent == '') {
			alert("댓글 내용을 입력해세요.");
			return;
		}
		
		$.ajax({
			type: "POST"
			, url : "/comment/create"
			, data: {"postId": postId, "commentContent": commentContent}
			, success: function(data) {
				if (result == "success") {
					
				} else {
					
				}
			}
			, error: function() {
				
			}
		});
	});
	
	// 1. moreModal에 postId를 넣는다.
	// 피드에서 더보기(...) 클릭시 모달에 삭제될 글 번호를 넣어준다.
	$('.moreBtn').on('click', function(e) {
		e.preventDefault();
		
		let postId = $(this).data('post-id');
		// alert(postId);
		// 2. moreModal이 모달에게 또 부여한다.
		$('#moreModal').data('post-id', postId); // data-post-id="1" 효과
	});
	//모달창 안에 있는 삭제하기 버튼 클릭
	// 모달 안에 있는 삭제버튼이라고 알려줄수 있게 써준것!
	$('#moreModal .del-post').on('click', function(e) {
		e.preventDefault(); // 앵커태그로 인해 올라가는것 방지
		//postId는 모달이 모른다. moreModal까진 안다.
		
		// 3.꺼내서 사용가능!
		let postId = $('#moreModal').data('post-id');
		alert(postId);
	});
});

</script>