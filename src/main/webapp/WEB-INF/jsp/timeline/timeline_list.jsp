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
		<!-- 헤더부분 -->
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
		<!-- 바디부분 -->
		<body>
			<section class="contents mt-4">
			
			<!-- 타임 라인 부분!! -->
				<c:forEach items="${contentList}" var="content">
				<section class="d-flex justify-content-center">
					<div class="feedBox">
					<!-- 상단: 프로필, ...더보기 버튼 (삭제,수정) -->
						<div class="feedHeader d-flex justify-content-between align-items-center">
							<!-- 프로필 : 누르면 마이페이지로 이동한다. -->
							<a href="#">
								<div class="userProfileId d-flex ml-2">
									<label class="mr-2"><img src="/staticImages/catProfileIcon.png" alt="프로필 사진" width="40px" height="40px"></label>
									<h4 class="m-1 text-dark"></h4>
								</div>
							</a>
							<!-- 더보기 -->
							<input type="button" id="feedHeaderMoreBtn" class="btn btn-success d-none" value="더보기">
							<img src="/staticImages/moreIcon.png" id="feedHeaderMoreImg" alt="더보기" width="25px" 
								class="mr-3" height="25px">
						</div>
						
						<!-- 사진 -->
						<div class="feedImage bg-primary">
							<img src="${content.post.imagePath} " alt="피드사진" width="600px">
						</div>
						
						<!-- 좋아요 -->
						<div class="feedLike d-flex mt-2">
							<!-- 하트 -->
							<div class="ml-2 mr-2">
								<a href="#" class="likeBtn">
									<!-- 종아요 해제 상태 -->
									<div>
										<img src="/staticImages/basicHeart.png" id="basicHeartImg" class=" "
											width="35px" height="35px" alt="하트" >
									</div>
									<!-- 좋아요 상태 -->
									<div>
										<img src="/staticImages/pinkHeart.png" id="basicHeartImg" class="d-none"
											width="35px" height="35px" alt="핑크하트">
									</div>
								</a>
							</div>
							<div class="mt-2">
							 	<span class="font-weight-bold">좋아요 2개</span>
							</div>
						</div>
						
						<!-- 글쓴이, 내용 -->
						<div class="feedPost ml-2 mt-2">
							<!-- 글쓴이 -->
							<span class="m-1 font-weight-bold">${content.user.name}</span>
							<span>
								${content.post.centent}
							</span>
						</div>
					
						<!-- 댓글 부분 -->
						
						<!-- 댓 목록: 댓글이 있는 경우에만 댓글 영역 노출 -->
						<c:if test="${not empty content.commentList}">
						<c:forEach items="${content.commentList}" var="commentView" >
							<!-- 댓글 목록 -->
								<div class="ml-5 mt-2 border-left">
									<span class="mx-3">${commentView.user.name}</span>
									<span class="mx-3">${commentView.comment.content}</span>
									
									<!-- 댓글쓴이가 본인이면 삭제버튼 노출 -->
									<a href="#" class="commentDeleteBtn" data-comment-id="${comment.id}">
										<img src="/staticImages/ .png" alt="" width="30px" height="30px">
									</a>
								</div>		
						</c:forEach>
						</c:if>
						<!-- 댓글 쓰기 -->
						<!-- 로그인 된 상태에서만 쓸 수 잇다. -->
						<c:if test="${not empty userId}"></c:if>
							<!-- 사용자 프로필 사진 -->
							<div class="comment_write  mt-2 d-flex ml-2">
								<div class="mr-3">
									<img src="/staticImages/catProfileIcon.png" alt="사용자" id="profile"
										width="40px" height="40px">
								</div>
								<!-- 댓글 쓰기 -->
								<input type="text" id="commentText${post.id}" 
									class="form-control col-10 " placeholder="댓글달기..." >
								<!-- 댓글 버튼 -->
								<div class="ml-3">
									<button type="button" class="commentBtn btn btn-info d-none"></button>
									<img src="/staticImages/send.png" id="sendImg" alt="댓글달기"
										class="mt-1 " width="35px" height="35px">
								</div>
							</div>
					</div>
			</section>
		</section>				
		</body>
		
	</div>
</body>
</html>
<!-- siblings: 형제를 찾는 함수 
let commentContent = $(this).siblings('input'.val().trim();-->
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
		
		let postId = $('.commentBtn').data('post-id'); // data-post-id => 하이픈으로 사용해야한다.
		// alert(postId);
		
		// input 태그 : 
		let commentContent = $('#commentText' + postId).val().trim();
		// alert(commentContent);
		
		
	});
});
</script>