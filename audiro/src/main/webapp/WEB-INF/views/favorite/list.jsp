<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>audiro</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />
<link href="https://webfontworld.github.io/Cafe24SsurroundAir/Cafe24SsurroundAir.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
    
<c:url var="favoriteListCss" value="/css/favorite_list.css" />
<link href="${favoriteListCss}" rel="stylesheet" />
 
</head>
<body>
    <div class="container-fluid">
        <%@ include file="../fragments/header.jspf"%>
        <main class="favorite">
             <div class="favorite-content">
	            <div class="title">
	                <c:url var="heart" value="/images/heart.png" />
	                <img src="${heart}" alt="heart" height="70">
	            </div>
	            
	            <div class="d-flex justify-content-between align-items-center">
                    <ul class="nav nav-tabs w-100">                       
                        <!--Nav tabs -->
                        <!-- <ul class="nav nav-tabs w-100"> -->
                            <li class="nav-item flex-fill text-center">
                                <a class="nav-link ${activeTab == '#tab-destination' ? 'active' : ''}" data-bs-toggle="tab" href="#tab-destination">여행지</a>
                            </li>
                            <li class="nav-item flex-fill text-center">
                                <a class="nav-link ${activeTab == '#tab-users' ? 'active' : ''}" data-bs-toggle="tab" href="#tab-users">관심유저</a>
                            </li>
                            <li class="nav-item flex-fill text-center">
                                <a class="nav-link ${activeTab == '#tab-post' ? 'active' : ''}" data-bs-toggle="tab" href="#tab-post">여행후기</a>
                            </li>
                      </ul>
                  </div>
                        
                  <div class="card">
                    <div class="card-body"> 
                        <!-- Sort Options -->
						<div id="sort-container" class="d-flex justify-content-end ms-2 mt-2 mr-2">
						    <select id="sort-select" onchange="sortFavorites()">
						        <option value="created_time" ${currentSort == 'created_time' ? 'selected' : ''}>최근 ♥순</option>
						        <option value="name" ${currentSort == 'name' ? 'selected' : ''}>이름순</option>
						    </select>
						</div>
					</div>
					
                       
                        <!--Tab panes -->
                        <div class="tab-content">
                            <div id="tab-destination" class="tab-pane fade ${activeTab == '#tab-destination' ? 'show active' : ''}">
                                <div id="favorite-list">
						            <c:forEach items="${favoriteDestination}" var="destination">
						                <c:if test="${destination.usersId == sessionScope.signedInUsersId}">
						                    <div class="favorite-list-container card">
						                    		<a href="/audiro/travel/details?id=${destination.destinationId}">
						                        		<img src="${destination.imgUrl}" alt="${destination.favoriteDestination}" />
						                        </a>
						                        <div class="title-like-container">
	                                                 <h5 class="card-title">
	                                                 	<a href="/audiro/travel/details?id=${destination.destinationId}">${destination.favoriteDestination}</a>
	                                                 </h5>
	                                                 <c:url var="like" value="/images/like_black.png" />
	                                                 <p class="like" onclick="toggleLike(this)" data-type="destination" data-id="${destination.destinationId}">
	                                                 	<img src="${like}" alt="like"></p>
	                                                 
                                                </div>
						                    </div>
						                </c:if>
						            </c:forEach>
						        </div>
                            </div>
                            <div id="tab-users" class="tab-pane fade ${activeTab == '#tab-users' ? 'show active' : ''}">
                                <div id="favorite-list">
						            <c:forEach items="${favoriteUsers}" var="user">
						                <c:if test="${user.usersId == sessionScope.signedInUsersId}">
						                    <div class="favorite-list-container card">   
						                        <div class="title-like-container">
	                                                 <h5 class="card-title" onclick="window.location.href='/audiro/post/review/mypage?id=${user.interestedUserId}'">${user.interestedUserNickname}</h5>
	                                                 <c:url var="like" value="/images/like_black.png" />
	                                                 <p class="like" onclick="toggleLike(this)" data-type="user" data-id="${user.interestedUserId}" >
	                                                 	<img src="${like}" alt="like"></p>
                                                </div>
						                    </div>
						                </c:if>
						            </c:forEach>
						        </div>
                            </div>
                            <div id="tab-post" class="tab-pane fade ${activeTab == '#tab-post' ? 'show active' : ''}">
                                <div id="favorite-list">
						            <c:forEach items="${favoritePost}" var="post">
						                <c:if test="${post.usersId == sessionScope.signedInUsersId}">
						                    <div class="favorite-list-container card">  
						                        <div class="title-like-container">
	                                                 <h5 class="card-title" onclick="window.location.href='/audiro/community/details?postId=${post.postId}'">${post.favoritePostTitle}</h5>
	                                                 <c:url var="like" value="/images/like_black.png" />
	                                                 <p class="like" onclick="toggleLike(this)" data-type="post" data-id="${post.postId}">
	                                                 	<img src="${like}" alt="like"></p>
                                                </div>
						                    </div>
						                </c:if>
						            </c:forEach>
						        </div>
                            </div>
                        </div>
                    </div>
                </div>
            
	            <div id="recently-viewed-container" class="ms-5">
	                <h3>최근 본 여행지</h3>
	                 <div id="recently-viewed">
	                    <!-- 최근 본 여행지 목록은 JavaScript에서 렌더링 -->
	                </div>
	            </div>
         
            
        </main>
    </div>
    
    <div class="container-fluid">
        <%@ include file="../fragments/footer.jspf" %>
    </div>
	
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous">
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    
    <script>
	const signedInUser = `${signedInUser}`;
	</script>
	<c:url var="favoriteListJS" value="/js/favorite_list.js" />
	<script src="${favoriteListJS}"></script>
        
   
</body>
</html>