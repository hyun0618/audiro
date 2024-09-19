<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 여행일기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<link
	href="https://webfontworld.github.io/Cafe24SsurroundAir/Cafe24SsurroundAir.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin>
<style>
body {
	background-color: #fafafa; /* 배경색 설정 */
	font-family: Arial, sans-serif; /* 폰트 설정 */
	justify-content: center;
	align-items: center;
	flex-direction: column;
	min-height: 100vh;
	margin: 0;
}

.container-fluid {
	width: 100%;
	padding: 0;
}

.entry-content {
	flex-grow: 1; /* 내용이 적더라도 공간을 채우도록 설정 */
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 10; /* 원하는 줄 수로 설정 */
	-webkit-box-orient: vertical;
	max-height: 150px; /* 최대 높이 설정 */
	/* 추가적인 스타일이 필요할 수 있습니다 */
}

main {
	display: flex;
	justify-content: center; /* 중앙 정렬을 위한 Flexbox */
	width: 100%;
}

.profile-container {
	background-color: #fff; /* 컨테이너 배경색 */
	padding: 20px; /* 컨테이너 패딩 */
	border-radius: 10px; /* 컨테이너 테두리 반경 */
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* 컨테이너 그림자 설정 */
	width: 90%;
	max-width: 800px;
	margin-top: 20px;
}

.profile-header {
	display: flex; /* Flexbox 사용 */
	align-items: center;
	padding: 20px; /* 프로필 헤더 패딩 */
	border-bottom: 1px solid #dbdbdb; /* 프로필 헤더 하단 테두리 */
	margin-bottom: 20px;
}

.profile-header img {
	border-radius: 50%; /* 프로필 이미지 둥글게 */
	width: 120px; /* 프로필 이미지 너비 */
	height: 120px; /* 프로필 이미지 높이 */
	margin-right: 30px; /* 프로필 이미지와 텍스트 사이의 간격 */
}

.profile-header .profile-info {
	flex-grow: 1; /* 프로필 정보 Flexbox 설정 */
}

.profile-header .profile-info .username-stats {
	display: flex; /* Flexbox 사용 */
	justify-content: space-between;
	align-items: center;
}

.profile-header .profile-info h2 {
	display: flex; /* Flexbox 사용 */
	gap: 20px; /* 간격 설정 */
	font-size: 14px; /* 통계 정보 폰트 크기 */
}

.profile-header .profile-info .stats {
	display: flex; /* Flexbox 사용 */
	gap: 20px; /* 간격 설정 */
	font-size: 10px; /* 통계 정보 폰트 크기 */
}

.profile-header .profile-info .stats div {
	text-align: center; /* 텍스트 정렬 */
	display: flex;
	flex-direction: column;
}

.profile-header .profile-info .stats div span {
	font-weight: bold; /* 폰트 두께 설정 */
}

.profile-header .profile-info .bio {
	margin-top: 10px;
	font-size: 14px; /* 자기소개 폰트 크기 */
	color: #6c757d; /* 자기소개 폰트 색상 */
}

.profile-nickname-container {
	margin: 0;
	font-size: 24px;
	display: flex;
	align-items: center;
}

.profile-nickname {
	font-weight: bold;
	font-family: Arial, sans-serif; /* 원하는 깔끔한 폰트로 변경하세요 */
	color: #333; /* 원하는 글자색으로 변경하세요 */
	margin-right: 10px;
}

.profile-posts {
	display: grid; /* Grid 사용 */
	grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
	/* 자동 열 설정 */
	gap: 10px; /* 그리드 간격 */
	padding: 0 20px;
}

.profile-posts .post-item {
	position: relative;
	overflow: hidden;
	border: 1px solid #dbdbdb; /* 포스트 아이템 테두리 */
	border-radius: 10px; /* 포스트 아이템 둥글게 */
	background-color: #fff; /* 포스트 아이템 배경색 */
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* 포스트 아이템 그림자 */
	transition: box-shadow 0.3s ease, transform 0.3s ease;
	/* 마우스 오버 시 포커스 효과 */
}

.profile-posts .post-item:hover {
	box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
	transform: translateY(-5px);
}

.profile-posts .post-item img {
	width: 100%;
	height: auto;
	display: block;
}

.profile-posts .post-item .like-icon {
	position: absolute;
	top: 10px;
	right: 10px;
	background: url('https://via.placeholder.com/24x24') no-repeat center
		center; /* 하트 아이콘 배경 설정 */
	background-size: contain;
	width: 24px;
	height: 24px;
	cursor: pointer;
}

.profile-posts .post-item .post-info {
	padding: 10px;
}

.profile-posts .post-item .post-info h3 {
	margin: 0;
	font-size: 1em;
}

.profile-posts .post-item .post-info p {
	margin: 5px 0 0;
	font-size: 0.9em;
	color: #6c757d;
}

.blog-post-item a {
	text-decoration: none; /* 링크 밑줄 제거 */
	color: inherit; /* 링크 색상 상속 */
}

#scrollToTopBtn {
	position: fixed;
	bottom: 30px;
	right: 30px;
	width: 50px;
	height: 50px;
	background: url('https://via.placeholder.com/50x50') no-repeat center
		center; /* 맨 위로 가기 버튼 배경 */
	background-size: contain;
	cursor: pointer;
	display: none; /* Initially hidden */
}

.blog-post-item:hover {
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	transform: scale(1.05);
	box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
}

.read-more { /* 더보기 */
	font-size: 0.8em; /* 글자 크기 줄이기 */
	text-align: right; /* 오른쪽 정렬 */
}

.entry-title { /* post-title*/
	font-size: 1em; /* 글자 크기 조정 */
	text-align: left; /* 왼쪽 정렬 */
}

.entry-container {
	position: relative; /* 부모 요소를 기준으로 위치 설정 */
}

.modified-time { /*수정시간*/
	position: absolute;
	bottom: 0px;
	left: 5px;
	font-size: 0.7em; /* 글자 크기 더 작게 */
	color: #6c757d; /* 색상 설정 */
}

/* 좋아요 버튼 스타일 */
.likeReviewBtn, .userLike {
	width: 30px;
	height: 30px;
	background: url("../../images/like_black.png") no-repeat center center;
	background-size: contain;
	border: none !important;
}

.likeReviewBtn.active, .userLike.active {
	background: url("../../images/like_red2.png") no-repeat center center;
	background-size: contain;
}
</style>
</head>
<body>
	<c:set var="travelReviewPage" value="${post[0].nickname}님의 여행일기" />
	<%@ include file="../../fragments/header.jspf"%>
	<div class="container-fluid">

		<main class="main-class mt-5">
			<div class="profile-container">
				<div class="profile-header">
					<input type="hidden" value="${signedInUsersId}" id="usersId" /> <img
						src="../../images/defaultprofile5.png" class="profile-img"
						alt="프로필 이미지">
					<div class="profile-info">
						<div class="username-stats">
							<h2 class="profile-nickname-container style="font-size: 18px;">
								<span id="nickname" class="profile-nickname">${post[0].nickname}</span>
								<%-- 
								<button id="userLike"
									class="userLike ${post[0].favoriteUserId != null ? 'active' : ''}"
									data-user-id="${signedInUsersId}"></button--%>
							</h2>
							<div class="stats">
								<div style="font-size: 15px;">
									<span>${countMyReview}</span> Posts
								</div>
								<%--<div>
									<span>${countLike}</span> Likes
								</div>
								<div>
									<span>150</span> comments
								</div>--%>
							</div>
						</div>
						<div class="bio">${post[0].introduction}</div>
					</div>
				</div>
				<div class="profile-posts" id="profilePosts">
					<!-- 여행후기 반복문 -->
					<c:forEach var="post" items="${post}">
						<c:if test="${post.postId != previousPostId}">
							<article id="post-${post.postId}"
								class="post-${post.postId} post type-post status-publish format-standard has-post-thumbnail hentry category-lifestyle">
								<div class="blog-post-item"
									style="border: 1px solid #dbdbdb; padding: 15px; margin-bottom: 15px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: box-shadow 0.3s ease;">

									<!-- .featured-image -->
									<div class="entry-container">
										<header class="entry-header">
											<div class="entry-content"
												onclick="window.location.href='details?postId=${post.postId}&id=${postlist.id}'">
												${list[0].content}</div>
											<h4 class="entry-title">
												<a href="details?postId=${post.postId}" rel="bookmark">${post.title}</a>
											</h4>
										</header>
										<!-- .entry-content -->
										<div class="modified-time">
											<small>${post.modifiedTime}</small>
										</div>
										<!-- .modified-time -->
										<div class="card-header" style="text-align: right">
											<button
												class="btn likeReviewBtn ${post.favoritePost != null ? 'active' : ''}"
												data-review-id="${post.postId}"></button>
										</div>
									</div>
									<!-- .entry-container -->
								</div>
								<!-- .blog-post-item -->
							</article>
							<c:set var="previousPostId" value="${post.postId}" />
						</c:if>
					</c:forEach>
				</div>
			</div>
		</main>
	</div>
	<div class="container-fluid">
		<%@ include file="../../fragments/footer.jspf"%>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-wEmeIV1mKuiNp12aFgE3XrA6sgC09K6Qap604vR9CLMNHOVvA20vFJo7Gh2NvGhP"
		crossorigin="anonymous"></script>

	<!-- Axio JS 라이브러리 -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<!-- reviewMypage.js -->
	<script>
		let signedInUsersId = $
		{
			sessionScope.signedInUsersId
		};
	</script>
	<c:url var="mypageJS" value="/js/mypage.js" />
	<script src="${mypageJS}"></script>
</body>
</html>