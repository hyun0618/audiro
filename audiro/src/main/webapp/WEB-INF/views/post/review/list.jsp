<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

/* 전체적인 스타일 설정 */
body {
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background-color: #f8f9fa;
	margin: 0;
	/*font-family: 'Cafe24SsurroundAir', sans-serif; /* 웹폰트 적용 */
}

/* 컨테이너 스타일 설정 */
.container-fluid {
	width: 100%;
	max-width: 1000px;
}

/* 카드 링크 스타일 설정 */
.card-link {
	cursor: pointer;
	color: #000; /* 기본 텍스트 색상 */
	transition: color 0.3s; /* 색상 변경 트랜지션 설정 */
	text-decoration: none; /* 밑줄 제거 */
}

.card-link:hover {
	color: #29088A; /* 마우스 호버 시 텍스트 색상 변경 */
	text-decoration: none; /* 밑줄 제거 */
	
}


.btn.likeReview {
	font-size: 16px; /* 텍스트 크기를 조정 */
	line-height: 1.5; /* 줄 간격을 조정 */
	padding: 10px; /* 내부 여백을 추가 */
	height: 150px; /* 원하는 높이로 설정 */
	overflow: auto; /* 내용이 넘칠 경우 스크롤을 추가 */
}

.likeReview.active {
	filter: grayscale(0%) brightness(100%);
}

.likeReview .likeIcon {
	background-image: url(/audiro/images/like_black2.png);
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	display: inline-block;
}

.likeReview.active .likeIcon {
	background-image: url(/audiro/images/like_red2.png);
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	display: inline-block;
}

.btn-mint {
	background-color: #1f63a2; /
	border: none;
	color: white;
	font-weight: bold;
	padding: 10px 20px; /* 버튼 크기 조정 */
	font-size: 1.2em; /* 글자 크기 */
	border-radius: 5px; /* 모서리 둥글게 */
	transition: background-color 0.3s; /* 호버 효과 */
	margin-bottom: 20px; /* 아래 마진 추가 */
}

.btn-mint:hover {
	background-color: #273086;
}

/* 카드 고정 높이 스타일 설정 */
.card-fixed-height {
	height: 150px; /* 원하는 고정 높이 설정 */
	overflow: hidden; /* 내용이 넘칠 경우 숨김 */
	/*display: flex;*/
	flex-direction: column;
	justify-content: space-between;
	border: 1px solid #ccc;
	border-radius: 8px;
	padding: 30px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	background-color: #fff;
}

/* 카드 본문 스타일 설정 */
.card-body {
	flex: 1; /* 카드 본문이 남은 공간을 차지하도록 설정 */
	overflow: hidden; /* 넘치는 내용 숨김 */
    /*display: flex; /* Flexbox를 사용하여 내부 요소를 정렬 */  
    flex-direction: column; /* 세로 방향으로 요소들을 배열 */
    justify-content: space-between; /* 요소들을 상하로 분산 배치 */
    height: 100%; /* 카드 내부를 꽉 채우기 위해 높이 100% 설정 */
}



/* 카드 내용 스타일 설정 */
.card-content {
	flex-grow: 1; /* 내용이 적더라도 공간을 채우도록 설정 */
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 5; /* 원하는 줄 수로 설정 */
	-webkit-box-orient: vertical;
	min-height: 150px; /* 원하는 최소 높이 설정 */
	max-height: 400px; /* 최대 높이 설정 */
	font-size: 16px; /* 폰트 크기 설정 */
	margin-bottom: auto; /* 제목과 가까울 때까지 공간을 채움 */
}

/* 카드 내용 내 이미지 스타일 설정 */
.card-content img {
	max-width: 100%; /* 이미지가 카드의 너비를 넘지 않도록 설정 */
	height: auto; /* 이미지의 높이는 자동 조정 */
	max-height: 300px; /* 이미지의 최대 높이 설정 */
	object-fit: cover; /* 이미지가 컨테이너에 맞게 조정되도록 설정 */
}



@font-face {
	font-family: 'Cafe24SsurroundAir';
	src:
		url('https://webfontworld.github.io/Cafe24SsurroundAir/Cafe24SsurroundAir.woff2')
		format('woff2'),
		url('https://webfontworld.github.io/Cafe24SsurroundAir/Cafe24SsurroundAir.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

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


.input-group input.form-control, /*검색창 위아래*/
.input-group select.form-select {
    padding: 20px; /* 위아래 여백 설정 */
    font-size: 20px; /* 원하는 폰트 크기 설정 */
    font-weight: bold; /* 진하게 설정 */
}

.input-group button.btn.btn-outline-secondary { /*검색버튼*/
    padding: 12px 30px; /* 버튼 내부 여백 설정 */
    font-size: 18px; /* 버튼 텍스트 크기 설정 */
    line-height: 1.5; /* 버튼 텍스트 줄 높이 설정 */
}

.reviewCard:hover {
    background-color: #EFF8FB;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /*그림자*/
    /*border-color: #210B61;/*테두리선*/
    transform: scale(1.05);
}
.reviewCard {
   transition: box-shadow 0.3s ease;/*그림자*/
    transition: border-color 0.3s ease;
    border: 2.5px solid transparent;/*테두리선*/
     transition: transform 0.3s ease;/*크기확대*/
}



/
</style>


</head>
<body style="font-family: Cafe24SsurroundAir;">
	<c:set var="travelReviewPage" value="여행후기" />
	<%@ include file="../../fragments/header.jspf"%>

	<div class="container-fluid"></div>

		<main class="row justify-content-center" style="margin-top: 50px;">
			<div class="main-class ">
				<input id="postId" name="postId" type="hidden"
					value="${post.postId}" /> <input id="usersId" name="usersId"
					type="hidden" value="${signedInUsersId}" />
				<!-- 여행일기 목록불러오기 -->
				<div class="col-md-15 listContainer">
					<div class="mt-2 card" id="list">
						<div class="card-header me-1">
							<h3 class="my-3">
								<a href="<c:url value='/post/review/list' />" class="card-link">
									여행 후기 게시판 </a>
							</h3>
						</div>
						<div class="card-body">
							<div class="mb-3"></div>
							<div>
								<!-- 로그인한 경우 추가 기능 -->
								<c:if test="${not empty signedInUser}">
									<div
										style="display: flex; align-items: center; gap: 10px; justify-content: flex-end;">
										<!-- 한 줄로 배치하고 버튼 간격 설정 -->
										<c:set var="createUrl" value="create" />
										<a href="${createUrl}">
											<button type="button" class="btn-mint">여행 후기 작성하러 가기</button>
										</a>
										<c:set var="mypageUrl" value="mypage?id=${signedInUsersId}" />
										<a href="${mypageUrl}">
											<button type="button" class="btn-mint">나의 여행일기</button>
										</a>
									</div>
								</c:if>

							</div>

							<!-- 검색창 -->
							<div class="mb-3">
								<form id="search" name="search" method="GET" action="list">
									<div class="input-group">
										<select class="form-select form-select-sm me-2"
											name="category" style="flex: 2;">
											<option value="t">제목</option>
											<option value="c">내용</option>
											<option value="tc">제목+내용</option>
											<option value="n">닉네임</option>
										</select> <input type="text" class="form-control"
											placeholder="검색어를 입력하세요" aria-label="검색어를 입력하세요"
											name="keyword" style="flex: 8;">
										<button class="btn btn-outline-secondary" type="submit">검색</button>
									</div>
								</form>
							</div>

							<div class="row row-cols-1 row-cols-md-4 g-4"
								id="reviewContainer">
								<!-- 여행후기 카드 반복문  이미지변경하기 -->
								<c:forEach var="list" items="${list}">
									<div class="col class-card">
										<input id="postId" name="postId" type="hidden"
											value="${post.postId}" /> <input id="usersId" name="usersId"
											type="hidden" value="${signedInUsersId}" />
										<div class="card h-100 d-flex flex-column reviewCard">
											<div class="position-relative">
												<a href="details?postId=${list.postId}&id=${list.id}"
													class="card-link"></a>
												<div class="card-content"
													onclick="window.location.href='details?postId=${list.postId}&id=${list.id}'">
													${list.content}</div>
												<p
													class="btn likeReview ${list.favoritePost != null ? 'active' : ''}"
													data-review-id="${list.postId}"
													style="border: none; position: absolute; top: 10px; right: 1px; z-index: 10;">
													<%--   <img src="<c:url value='/images/like.png' />" alt="like" style="width: 24px; height: 24px;" /> --%>
													<span class="likeIcon" alt="like"
														style="width: 30px; height: 30px;" />
												</p>
											</div>
											<div class="card-body">
												<!-- 클릭 시 상세페이지로 이동하는 링크 -->
												<h5 class="card-title"
													style="font-weight: bold; font-color: #29088A; font-size: 1.5rem;">
													<a href="details?postId=${list.postId}&id=${list.id}"
														class="card-link">${list.title}</a>
												</h5>
												<a href="#" class="list-group-item list-group-item-action">
													<div class="d-flex w-100 justify-content-between">
														<small>${list.modifiedTime}</small>
													</div>
												</a>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
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

	<!-- Axio JS 라이브러리 -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<!-- reviewMypage.js -->
	<c:url var="listJS" value="/js/list.js" />
	<script src="${listJS}"></script>

</body>
</html>
