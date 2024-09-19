<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>audiro</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	

<link href="https://webfontworld.github.io/goodchoice/Jalnan.css" rel="stylesheet">
<link href="https://webfontworld.github.io/HSBomBaram/HSBomBaram2.css" rel="stylesheet">
<link href="https://webfontworld.github.io/BMHannaAir/BMHannaAir.css" rel="stylesheet">

<c:url var="homeCss" value="/css/home.css" />
<link href="${homeCss}" rel="stylesheet" />

</head>

<body>

	<div class="container-fluid">
		<%@ include file="./fragments/header.jspf"%>
	</div>
	
	<div class="background-image"></div>
	
	<div class="container">
	
		<!-- 인기 여행지 -->
		<h3 class="top-title">찜 여행지 순위</h3>
		<div id="destinationCarousel" class="carousel slide" data-bs-ride="carousel">
				
			<div class="carousel-inner">
				<c:forEach items="${topDestination}" var="destination" varStatus="status">
					<c:choose>
						<c:when test="${status.index % 3 == 0}">
							<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
								<div class="d-flex justify-content-center">
						</c:when>
					</c:choose>
					<div class="carousel-image">
						<h3 id="destination-name">${destination.name}</h3>	
						<p class="top-rank">${status.index + 1}위</p>
						<img src="${destination.imgUrl}" class="d-block w-100" alt="${destination.name}" onclick="window.location.href='/audiro/travel/details?id=${destination.travelDestinationId}'"/>
						<p class="like" onclick="toggleLike(this)" data-id="${destination.travelDestinationId}" data-type="destination">
						<img src="images/like.png" alt="like" /></p>	
						<p class="num-favorites-dest">${destination.numFavorites}</p>	
					</div>
					<c:choose>
						<c:when test="${status.index % 3 == 2 || status.index == (topDestination.size() - 1)}">
								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
			
			<div style="height: 50px;"></div>
			
			<div class="carousel-indicators">
                <button type="button" data-bs-target="#destinationCarousel" data-bs-slide-to="0" class="active" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#destinationCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#destinationCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#destinationCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
                <button type="button" data-bs-target="#destinationCarousel" data-bs-slide-to="4" aria-label="Slide 5"></button>
            </div>
	
			<div id="heart-animation">
				<img src="images/heart.png" alt="heart" class="heart" />
			</div>
			
			<div class="carousel-controls">
				<button class="carousel-control-btn prev" type="button" data-bs-target="#destinationCarousel" data-bs-slide="prev">
					<svg width="20" height="20" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					    <path fill-rule="evenodd" d="M11.854 1.646a.5.5 0 0 1 0 .708L5.707 8l6.147 5.646a.5.5 0 0 1-.708.708l-6.5-6a.5.5 0 0 1 0-.708l6.5-6a.5.5 0 0 1 .708 0z" />
					 </svg>
				</button>
				
				<button class="carousel-control-btn next" type="button" data-bs-target="#destinationCarousel" data-bs-slide="next">
					<svg width="20" height="20" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					     <path fill-rule="evenodd" d="M4.146 1.646a.5.5 0 0 1 .708 0l6.5 6a.5.5 0 0 1 0 .708l-6.5 6a.5.5 0 0 1-.708-.708L10.293 8 4.146 2.854a.5.5 0 0 1 0-.708z" />
					 </svg>
				</button>
			</div>
			
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
					</div>
					<div class="modal-body text-center">
						로그인 이후 사용 가능합니다.<br>로그인 페이지로 이동하시겠습니까?
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<button type="button" id="confirmBtn" class="btn btn-primary">확인</button>
					</div>
				</div>
			</div>
		</div>


		<!-- 인기 여행후기 -->
		<h3 class="top-title">인기 여행후기</h3>
		<div id="postCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<c:forEach items="${topPost}" var="post" varStatus="status">
					<c:choose>
						<c:when test="${status.index % 3 == 0}">
							<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
								<div class="d-flex justify-content-center">
						</c:when>
					</c:choose>
						<div class="my-card">
							<p class="top-rank">${status.index + 1}위</p>
							<p class="num-favorites-post">${post.numFavorites}</p>
							<div id="post-title" onclick="window.location.href='/audiro/community/details?postId=${post.postId}'">${post.title}</div>
							<div id="post-content" onclick="window.location.href='/audiro/community/details?postId=${post.postId}'">${post.content}</div>
							<p id="post-like" class="like" onclick="toggleLike(this)"
								data-id="${post.postId}" data-type="post">
								<img src="images/like_black.png" alt="like" /></p>	
							
						</div>
					<c:choose>
						<c:when test="${status.index % 3 == 2 || status.index == (topPost.size() - 1)}">
								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
			
			<div style="height: 50px;"></div>
			
			<div class="carousel-indicators">
	                <button type="button" data-bs-target="#postCarousel" data-bs-slide-to="0" class="active" aria-label="Slide 1"></button>
	                <button type="button" data-bs-target="#postCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
	                <button type="button" data-bs-target="#postCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
	                <button type="button" data-bs-target="#postCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
	                <button type="button" data-bs-target="#postCarousel" data-bs-slide-to="4" aria-label="Slide 5"></button>
	            </div>
			
				<div class="carousel-controls">
					<button class="carousel-control-btn prev" type="button" data-bs-target="#postCarousel" data-bs-slide="prev">
						<svg width="20" height="20" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						     <path fill-rule="evenodd" d="M11.854 1.646a.5.5 0 0 1 0 .708L5.707 8l6.147 5.646a.5.5 0 0 1-.708.708l-6.5-6a.5.5 0 0 1 0-.708l6.5-6a.5.5 0 0 1 .708 0z" />
						</svg>
					</button>
					
					<button class="carousel-control-btn next" type="button" data-bs-target="#postCarousel" data-bs-slide="next">
						<svg width="20" height="20" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" d="M4.146 1.646a.5.5 0 0 1 .708 0l6.5 6a.5.5 0 0 1 0 .708l-6.5 6a.5.5 0 0 1-.708-.708L10.293 8 4.146 2.854a.5.5 0 0 1 0-.708z" />
						</svg>
					</button>
				</div>
		  </div>
	</div>
	
	
	
	<!-- rolling -->
		<div class="wrap">
			<div class="rolling-list">
				<ul>
					<li>
						<div class="image-wrap">
							<img
								src="https://api.cdn.visitjeju.net/photomng/imgpath/201908/19/bec31477-1674-4d35-b6c2-f6ec2f7fb73f.jpg"
								alt="용머리해안" />
							<h3 class="image-title">용머리해안</h3>
							<p class="image-descript">제주특별자치도 서귀포시 안덕면 산방로 218-10</p>
						</div>
					</li>
					<li>
						<div class="image-wrap">
							<img
								src="https://api.cdn.visitjeju.net/photomng/imgpath/201810/17/41209f96-3700-4de3-8545-347a602229e2.jpg"
								alt="성산일출봉" />
							<h3 class="image-title">성산일출봉</h3>
							<p class="image-descript">제주특별자치도 서귀포시 성산읍 일출로 284-12</p>
						</div>
					</li>
					<li>
						<div class="image-wrap">
							<img
								src="https://api.cdn.visitjeju.net/photomng/imgpath/202110/25/f468adfc-c167-4b88-b325-3a7926f40066.png"
								alt="아쿠아플라넷 제주" />
							<h3 class="image-title">아쿠아플라넷 제주</h3>
							<p class="image-descript">제주특별자치도 서귀포시 성산읍 섭지코지로 95</p>
						</div>
					</li>
					<li>
						<div class="image-wrap">
							<img
								src="https://api.cdn.visitjeju.net/photomng/imgpath/202308/29/d8e383ae-c13c-4432-8f1b-6f3ed3e45ef7.jpg"
								alt="휴애리자연생활공원" />
							<h3 class="image-title">휴애리자연생활공원</h3>
							<p class="image-descript">제주특별자치도 서귀포시 남원읍 신례동로 256</p>
						</div>
					</li>
					<li>
						<div class="image-wrap">
							<img
								src="https://www.headlinejeju.co.kr/news/photo/201604/271094_172068_5605.jpg"
								alt="서귀포 가시리마을" />
							<h3 class="image-title">서귀포 가시리마을</h3>
							<p class="image-descript">제주특별자치도 서귀포시 표선면 가시로565번길 20</p>
						</div>
					</li>
					<li>
						<div class="image-wrap">
							<img
								src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcXawdc%2FbtrfZqvEU3G%2FLNkZCFfae8wTNWfNJNTHJK%2Fimg.jpg"
								alt="원주 소금산 출렁다리" />
							<h3 class="image-title">원주 소금산 출렁다리</h3>
							<p class="image-descript">강원특별자치도 원주시 지정면 소금산길 12</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	
	
	
	

	<div class="container-fluid">
		<%@ include file="./fragments/footer.jspf"%>
	</div>

	<!-- script -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	

	<!-- js -->

	<!-- <script>
		window.embeddedChatbotConfig = {
			chatbotId : "pgf573bMUX-3poQ0E4AMT",
			domain : "www.chatbase.co"
		}
	</script>
	<script src="https://www.chatbase.co/embed.min.js"
		chatbotId="pgf573bMUX-3poQ0E4AMT" domain="www.chatbase.co" defer>
		
	</script> -->

	<script>
		const signedInUser = `${signedInUser}`;
	</script>
	<c:url var="homeJS" value="/js/home.js" />
	<script src="${homeJS}"></script>

</body>
</html>