<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Post Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.main-class {
	margin-top: 100px;
	margin-left: 350px;
	margin-right: 350px;
}

.card {
	width: 100%;
	max-width: 1200px; /* 원하는 너비로 설정 */
	margin: 0 auto;
}

.c-profile-image {
	width: 80px; /* 프로필 이미지의 크기 설정 */
	height: 80px;
	border-radius: 50%; /* 동그라미 형태를 만들기 위한 설정 */
	object-fit: cover; /* 이미지가 잘리지 않고 비율을 유지하도록 설정 */
}

.card-header {
	justify-content: space-between;
	align-items: center;
}

#p-profile-image {
	width: 50px; /* 프로필 이미지의 크기 설정 */
	height: 50px;
	border-radius: 50%; /* 동그라미 형태를 만들기 위한 설정 */
	object-fit: cover; /* 이미지가 잘리지 않고 비율을 유지하도록 설정 */
	margin-left: 10px;
}

.label-time.text-center {
	text-align: center;
	font-size: 2.5em; /* 글자 크기 키우기 */
	display: block;
}

.like-btn {
	margin-right: 10px;
}

.label-title {
	width: 300%;
	text-align: center;
	font-size: 2.5em;
}

.favorite-btn {
	fill: #98FF98;
	transition: fill 0.3s;
}

.favorite-btn.clicked {
	fill: #3EB489;
}

#content {
	width: 100%;
	min-height: 500px;
	white-space: pre-line;
	margin-bottom: 20px;
}

.nickname-link {
	text-decoration: none; /* 링크 스타일 제거 */
	color: inherit; /* 글자 색상 상속 */
}


</style>
</head>
<body>
	<c:set var="pageTitle" value="Post Details" />
	<%@ include file="../../fragments/header.jspf"%>
	<div class="container-fluid">

		<main>
			<div class="main-class mt-5 card">
				<input id="postId" name="postId" type="hidden"
					value="${post.postId}" /> <input type="hidden" id="loginUsersId"
					value="${signedInUsersId}" />
				<table class="table table-borderless">
					<tbody>
						<tr>
							<td colspan="2"
								class="d-flex align-items-center justify-content-between">
								<label id="title" class="label-title">${post.title}</label> <!-- 후기 찜담기 버튼 (하트이미지 추후에 변경) -->
								<c:set var="pageTitle" value="여행후기" /> 
							<%-- 
                                    <button class="btn favorite-btn" data-review-id="${post.postId}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
                                        <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                                    </svg>
                                    <label class="favoriteMe" for="like-btn-${post.postId}">${countFavorite}</label>
                                    </button>
                                    --%>
							</td>
						</tr>
						<tr>
							<td class="profile-container" colspan="2"
								style="display: flex; align-items: center; justify-content: space-between;">
								<div style="display: flex; align-items: center;">

									<c:url var="path" value="../../${post.path}"></c:url>
									<img src="../../images/defaultprofile5.png" alt="프로필 이미지"
										class="p-profile-image" id="p-profile-image" />
									<div>
										<a href="/audiro/post/review/mypage?id=${post.usersId}"
											class="nickname-link"> <span>${post.nickname}</span>
										</a> <br /> <label for="modifiedTime" class="label-time"
											id="modifiedTime"
											style="margin-left: 2px; flex-shrink: 0; font-size: 0.8em;">
											${post.modifiedTime} </label>
									</div>
								</div> <!-- 로그인한 경우 추가 기능 --> <c:if
									test="${sessionScope.signedInUsersId eq post.usersId}">
									<div>
										<div>
											<form class="reviewBtn" method="post">
												<input id="postId" name="postId" type="hidden"
													value="${post.postId}" />
												<!-- <button type="button" class="btn btn-danger" onclick="deletePost(${post.postId}, '${signedInUser}')">삭제</button> -->
												<button id="deletebtn" class="btn btn-outline-danger"
													style="margin-left: auto;">
													<svg xmlns="http://www.w3.org/2000/svg" width="16"
														height="16" fill="currentColor" class="bi bi-trash3"
														viewBox="0 0 16 16">
                                                        <path
															d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5" />
                                                    </svg>
												</button>
												<button id="modifybtn" class="btn btn-outline-success">수정</button>
											</form>
										</div>
									</div>
								</c:if>

							</td>
						</tr>
						<tr>
							<td>
								<div id="content" class="form-control"
									style="white-space: pre-line; margin-bottom: 20px;">${post.content}</div>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- 댓글창 -->
				<table class="table table-borderless" style="width: 100%;">
					<tbody>
						<tr>
							<td style="border: none; width: 85%;">
								<div style="display: flex; align-items: flex-end;">
									<!-- 프로필 db내용불러오기로 수정할 예정 -->
									<div
										style="margin-right: 10px; display: flex; flex-direction: column; align-items: center;">


									</div>
									<textarea id="comment" class="form-control" rows="3"
										style="flex: 1; margin-right: 10px;"></textarea>
									<button id="registerCommmetbtn" type="button"
										class="btn btn-dark" style="align-self: flex-end;">댓글등록</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

				<div id="commentList" class="mt-1">
					<!-- 댓글목록리스트 -->
				</div>
			</div>
		</main>
	</div>
	<div class="container-fluid">
		<%@ include file="../../fragments/footer.jspf"%>
	</div>
	<script>
		const signedInUser = `${signedInUser}`;
	</script>

	<!-- Bootstrap의 JS 라이브러리 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<!-- Axios 라이브러리 포함 -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<!-- reviewMypage.js -->
	<c:url var="detailsJS" value="/js/details.js" />
	<script src="${detailsJS}"></script>

</body>
</html>