<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>커뮤니티</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />
<link
    href="https://webfontworld.github.io/Cafe24SsurroundAir/Cafe24SsurroundAir.css"
    rel="stylesheet">
<style>


#secretSentence {
    display: flex;
    align-items: center; /* 수직 정렬 */
}
#secretSentenceP {
    margin-top: 3px;
}
#secretCommentImg {
    margin-right: 8px; /* 이미지와 텍스트 사이 간격 */
}

#commentDecoratingImages {
    display: inline-block;
    vertical-align: middle;
}

#commentNickname, #commentModifiedTime {
    display: inline-block;
    vertical-align: middle;
    margin-bottom: 0;
}

#commentNickname {
    /*    margin-left: 10px; 이미지와 닉네임 사이의 간격 조정 */
    
}

#commentModifiedTime {
    /*    margin-left: 10px;  닉네임과 수정날짜 사이의 간격 조정 */
    font-size: 12px;
    color: #b6c0c0;
}

.comment-image {
    /*   border: 0.5px solid #B7B4E6; 댓글 프로필 이미지 테두리 설정 */
    /*  box-shadow: 0 0 8px #B7B4E6;  댓글 프로필 이미지 설정 */
    border-radius: 5px; /* 테두리의 모서리를 둥글게 설정 (선택 사항) */
    transition: transform 0.3s ease; /* 애니메이션 설정 */
}

.comment-image:hover {
    transform: scale(1.1); /* 마우스를 가져다 대면 약간 확대 */
}

.icon {
    cursor: pointer;
    width: 30px; /* 이미지 크기 조정 */
    height: 30px;
    margin-right: 20px; /* 버튼과 아이콘 사이 간격 */
    display: none; /* 기본적으로 보이지 않게 설정 */
}

.icon.visible {
    display: inline; /* 보이는 상태로 변경 */
}

.open-icon {
    cursor: pointer;
    width: 30px; /* 이미지 크기 조정 */
    height: 30px;
    margin-right: 10px; /* 버튼과 아이콘 사이 간격 */
}

.lock-icon {
    cursor: pointer;
    width: 30px; /* 이미지 크기 조정 */
    height: 30px;
    margin-right: 10px; /* 버튼과 아이콘 사이 간격 */
}

.button-container {
    display: flex;
    justify-content: flex-end;
    align-items: center; /* 버튼과 아이콘을 수직으로 정렬 */
    /* margin-top: 10px;  필요한 경우 간격 조정 */
}

input::placeholder {
    color: #b6c0c0 !important; /* 원하는 색상으로 변경 */
    opacity: 1; /* 필요에 따라 투명도 조정 */
}

textarea::placeholder {
    color: #b6c0c0 !important; /* 원하는 색상으로 변경 */
    opacity: 1 !important; /* 필요에 따라 투명도 조정 */
}

.flex-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.image-hover {
    transition: transform 0.5s;
}

.image-hover:hover {
    transform: scale(1.3);
}
</style>
</head>
<body>
        <div class="container">
        <%@ include file="../fragments/header.jspf"%>
    </div>
    
    <div class="container mt-4">
         
     <!-- 맨 위에 뜨는 nav끝 -->
        <!-- **** row 클래스를 사용하여 두 섹션을 가로로 배치합니다. **** -->
        <div class="row">
            <!-- 사이드 메뉴 -->
            <!-- **** col-md-4와 col-lg-3 클래스를 사용하여 반응형 너비를 설정합니다. **** -->
            <div class="col-md-4 col-lg-3 mb-3">
                <div class="card mb-3">
                    <c:choose>
                        <c:when test="${p.postTypeId == 20}">
                            <h3 class="card-header p-3"
                                style="background-color: #c8dff3; text-align: center;">COMMUNITY</h3>
                            <div class="card-body">
                          <!--      <h5 class="card-title m-1"
                                    style="text-align: center;">travel
                                    mate</h5>
                                <h6 class="card-subtitle text-muted p-2"
                                    style="text-align: center;">Looking
                                    for a travel mate!</h6>-->
                              <!--  <img
                                    style="display: block; margin: 0 auto; width: 100%;"
                                    src="../images/mate.png" alt="여행메이트"> -->
                            </div>
                            <div class="card-body">
                                <p class="ps-3 pe-3"
                                    style="text-align: center;">
                                    “여행 계획 있으신가요? 어디로, 누구랑 뭐 하러 가고
                                    싶으세요?”<br />#친구
                                </p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <h3 class="card-header p-3"
                                style="background-color: #c8dff3; text-align: center;">COMMUNITY</h3>
                            <div class="card-body">
                            <!--     <h5 class="card-title m-1"
                                    style="text-align: center;">Free
                                    Board</h5>
                                <h6 class="card-subtitle text-muted p-2"
                                    style="text-align: center;">Feel
                                    free to write 😁</h6>
                                <img
                                    style="display: block; margin: 0 auto; width: 100%;"
                                    src="../images/free.png" alt="여행메이트">  -->
                            </div>
                            <div class="card-body">
                                <p class="ps-3 pe-3"
                                    style="text-align: center;">"여행을
                                    즐기러 떠나요!"</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    
                    <ul class="list-group list-group-flush">
                        <c:url var="main" value="/community/main">
                            <c:param name="id" value="${signedInUser}"></c:param>
                        </c:url>
                        <li class="list-group-item">
                            <a style="text-decoration: none;"  href="${main}">커뮤니티 메인</a>
                        </li>
                        <c:url var="alllist" value="/community/alllist">
                            <c:param name="id" value="${signedInUser}"></c:param>
                        </c:url>
                        <li class="list-group-item">
                            <a style="text-decoration: none;" href="${alllist}">전체 목록</a>
                        </li>
                        <c:url var="matelist" value="/community/matelist">
                            <c:param name="id" value="${signedInUser}"></c:param>
                        </c:url>
                        <li class="list-group-item">
                            <a style="text-decoration: none;" href="${matelist}">여행 메이트</a>
                        </li>
                        <c:url var="freelist" value="/community/freelist">
                            <c:param name="id" value="${signedInUser}"></c:param>
                        </c:url>
                        <li class="list-group-item">
                            <a style="text-decoration: none;" href="${freelist}">자유게시판</a>     
                        </li>
                        <c:url var="create" value="/community/create">
                            <c:param name="id" value="${signedInUser}"></c:param>
                        </c:url>
                        <li class="list-group-item">
                            <a style="text-decoration: none;" id="create" href="${create}">글쓰기</a>     
                        </li>
                    </ul>
                    <div class="card-body">
                        <c:url var="home" value="/"></c:url>
                        <a style="text-decoration: none;" href="${home}"
                            class="card-link p-2">#어디로 메인</a> 
                        <c:url var="tp" value="/travel/plan" />
                            <a
                            style="text-decoration: none;" href="${tp}"
                            class="card-link p-2">#여행지 찾기</a> <br /> 
                        <c:url var="tpl" value="/travel/plan/list" />
                            <a
                            style="text-decoration: none;" href="${tpl}"
                            class="card-link p-2">#여행
                            계획&nbsp;&nbsp;&nbsp;</a> 
                            <c:url var="trp" value="/post/review/list" />
                            <a href="${trp}"
                            style="text-decoration: none;"
                            class="card-link p-2">#여행 후기</a>
                    </div>
                   
                </div>
                <!-- 랭킹 시작 -->
                <c:choose>
                    <c:when test="${p.postTypeId == 20}">
                        <div class="card">
                            <div class="card-header m-1">
                                <h4 class="card-title"
                                    style="text-align: center;">Community
                                    Ranking</h4>
                            </div>
                            <div class="card-body">
                                <p style="text-align: center;">💗
                                    LIKE USER TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">닉네임</th>
                                            <th class="text-center">💘</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="like"
                                        items="${userLikeTop3List}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${like.rank == 1}">
                                                    <tr
                                                        class="table-primary">
                                                        <td
                                                            class="text-center">🐬</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${like.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">2</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">3</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- post 순위 -->
                                <p class="mt-3 pt-2"
                                    style="text-align: center;">👍🏻
                                    POST TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">제목</th>
                                            <th class="text-center">👍🏻</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="pg"
                                        items="${postGoodTop3List}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${pg.rank == 1}">
                                                    <tr
                                                        class="table-primary">
                                                        <td
                                                            class="text-center">🐬</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${pg.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">2</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">3</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- post 순위 끝 -->
                                <!-- comment 순위 -->
                                <p class="mt-3 pt-2"
                                    style="text-align: center;">💬
                                    COMMENT TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">닉네임</th>
                                            <th class="text-center">📑</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="cu"
                                        items="${commentsUserTop3}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${cu.rank == 1}">
                                                    <tr
                                                        class="table-primary">
                                                        <td
                                                            class="text-center">🐬</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${cu.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">2</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">3</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- comment 순위 끝-->
                            </div>
                        </div>
                        <!-- 랭킹 끝 -->
                    </c:when>
                    <c:otherwise>
                        <div class="card">
                            <div class="card-header m-1">
                                <h4 class="card-title"
                                    style="text-align: center;">Community
                                    Ranking</h4>
                            </div>
                            <div class="card-body">
                                <p style="text-align: center;">💗
                                    LIKE USER TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">닉네임</th>
                                            <th class="text-center">💘</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="like"
                                        items="${userLikeTop3List}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${like.rank == 1}">
                                                    <tr
                                                        class="table-primary">
                                                        <td
                                                            class="text-center">🐬</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${like.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">2</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">3</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- post 순위 -->
                                <p class="mt-3 pt-2"
                                    style="text-align: center;">👍🏻
                                    POST TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">제목</th>
                                            <th class="text-center">👍🏻</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="pg"
                                        items="${postGoodTop3List}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${pg.rank == 1}">
                                                    <tr
                                                        class="table-primary">
                                                        <td
                                                            class="text-center">🐬</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${pg.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">2</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">3</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- post 순위 끝 -->
                                <!-- comment 순위 -->
                                <p class="mt-3 pt-2"
                                    style="text-align: center;">💬
                                    COMMENT TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">닉네임</th>
                                            <th class="text-center">📑</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="cu"
                                        items="${commentsUserTop3}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${cu.rank == 1}">
                                                    <tr
                                                        class="table-primary">
                                                        <td
                                                            class="text-center">🐬</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${cu.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">2</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">3</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- comment 순위 끝-->
                            </div>
                        </div>
                        <!-- 랭킹 끝 -->
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 상세보기 -->
            <!-- **** col-md-8와 col-lg-9 클래스를 사용하여 반응형 너비를 설정합니다. **** -->
            <div class="col-md-8 col-lg-9">
                <main>
                    <div class="card border-light mb-3">
                        <div class="card-header">
                            <!-- 글 타입 시작-->
                            <c:choose>
                                <c:when test="${p.postTypeId == 20}">
                                    <p class="mt-3 ms-2">
                                        <span
                                            class="text-body-secondary">여행
                                            메이트 구해요</span>
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <p class="mt-3 ms-2">
                                        <span
                                            class="text-body-secondary">자유
                                            게시판</span>
                                    </p>
                                </c:otherwise>
                            </c:choose>
                            <!-- 글 타입 끝 -->
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="mt-4 py-2"
                                    style="border-bottom: 1px solid grey;">
                                    <input id="inputPostId" type="text" class="visually-hidden" value="${p.postId}"/>
                                    <input id="inputPostUsersId" type="text" class="visually-hidden" value="${p.usersId}"/>
                                    <!-- 로그인한 usersid -->
                                    <input id="inputLoginUsersId" type="text" class="visually-hidden" value="${signedInUsersId}"/>
                                    <p
                                        style="font-size: 220%; text-align: center;">${p.title}</p>
                                    <div class="flex-container">
                                        <p class="m-2 p-2"
                                            style="font-size: 105%;">
                                            <span class="me-2">
                                                <c:url var="postUserProfile" value="${p.path}" ></c:url>
                                                <img alt="작성자 프로필" src="../${postUserProfile}" style="width: 40px;">
                                            </span>${p.nickname}</p>
                                        <p class="m-2 p-2 mt-3 me-3"
                                            style="color: grey; font-size: 90%;">작성
                                            시간 : ${p.createdTime}</p>
                                    </div>
                                </div>
                                <div class="container mt-3 m-4 p-5">
                                    <div>
                                        <p>${p.content}</p>
                                    </div>
                                </div>
                            </form>
                            <!-- good시작 -->
                                <!-- d-flex 요소 안에 data-post-id와 data-users-id 설정 -->
                        <!--     <div class="d-flex align-items-center justify-content-between mt-2 mb-1"> -->
                            <div class="d-flex align-items-center justify-content-between mt-2 mb-1">
                                <div class="d-flex align-items-center">
                                    <img id="btngood" class="image-hover" alt="good1" src="../images/good1.png" style="width: 40px; height: auto; margin-right: 5px;" data-post-id="${p.postId}" data-users-id="${signedInUsersId}" data-author-id="${p.usersId}">
                                    <span style="margin-top: 11px;">추천&nbsp;</span>
                                    <span class="badge rounded-pill pe-2 ps-2" style="margin-top: 12px; background-color:#96c8ef;">${p.good}</span>
                                </div>
                                <p class="mb-0 me-4" style="color: grey; font-size: 90%; text-align: right;">수정 시간 : ${p.modifiedTime}</p>
                            </div>
                            <!-- good끝 -->
                            <div
                                class="d-flex justify-content-between mt-3 me-3">
                                <c:choose>
                                     <c:when test="${p.postTypeId == 20}">
                                <c:url var="mate" value="/community/matelist">
                                     <c:param name="id" value="${signedInUser}"></c:param>
                                </c:url>
                                <a class="btn btn-outline-dark ms-2"
                                    href="${mate}">최신 목록</a>
                                    </c:when>
                                    <c:when test="${p.postTypeId == 30}">
                                <c:url var="free" value="/community/freelist">
                                     <c:param name="id" value="${signedInUser}"></c:param>
                                </c:url>
                                <a class="btn btn-outline-dark ms-2"
                                    href="${free}">최신 목록</a>                                    
                                    </c:when>
                                </c:choose>
                                <div>
                                    <c:url var="postModifyPage"
                                        value="/community/modify">
                                        <c:param name="postId"
                                            value="${p.postId}" />
                                        <c:param name="id"
                                            value="${p.id}" />
                                    </c:url>
                                <!-- 로그인 사용자 아이디와 작성자 아이디가 같은 경우에만 수정하기 버튼을 보여줌 -->
                                <c:if test="${signedInUser eq p.id}">
                                    <a class="btn btn-outline-primary me-2"
                                        href="${postModifyPage}">수정</a>
                                        <c:url var="delete"
                                        value="/community/delete">
                                        <c:param name="postId"
                                            value="${p.postId}"></c:param>
                                    </c:url>
                                    <a class="btn btn-outline-danger"
                                        id="deleteButton" href="${delete}"
                                        onclick="return confirmDeletion()">삭제</a>
                                </c:if>
                                </div>
                            </div>

                        </div>

                        <div class="card-footer">
                            <div class="container">
                            <!-- 댓글 목록 가져오기(에이작스 이용) -->
                            <div id="commentsListBody">
                            
                                <!-- AJAX로 데이터를 가져와 이곳에 삽입할 것입니다. -->
                            </div>
                            <!-- 페이지 번호 가져옴(에이작스 이용) -->
                            <div>
                            <!-- 페이지 번호 버튼 부분 -->
                                 <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center"
                                        id="commentsPagination"> <!--여기서 부여한 아이디 중요함 -->
                            <!-- AJAX로 페이지 링크를 가져와 이곳에 삽입할 것입니다. -->
                                    </ul>
                                 </nav>
                            </div>
                            
                            <!-- 댓글 등록 -->
                             <%--로그인 정보가 세션에 저장된 경우 --%>
                             <c:if test="${not empty signedInUser}">
                                <div class="row">
                                    <div class="col-12 ms-2" style="width: 98%;">
                                        <textarea class="form-control mt-4" id="exampleTextarea" rows="3" placeholder="착하고 고운 언어를 사용해 주세요 ㅠ_ㅠ"></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 button-container">
                                        <img src="https://img.icons8.com/?size=100&id=l0nYZP2WZJqy&format=png&color=000000" id="openIcon"  class="icon visible" alt="open" />
                                        <img src="https://img.icons8.com/?size=100&id=88611&format=png&color=000000" id="lockIcon" class="icon" alt="lock" />
                                        <button class="btn btn-outline-success mt-3 mb-3 me-2"  onclick="checkTextarea()">댓글 등록</button>
                                    </div>
                                </div>
                            </c:if>
                            <%--세션에 로그인 정보가 없는 경우 --%>
                            <c:if test="${empty signedInUser}">
                                    <div class="row">
                                        <div class="col-12">
                                            <textarea class="form-control mt-4" id="exampleTextarea" rows="3" placeholder="로그인 후 댓글 등록이 가능합니다." disabled></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 button-container">
                                            <img src="https://img.icons8.com/?size=100&id=l0nYZP2WZJqy&format=png&color=000000" id="openIcon" class="icon hidden" alt="open" />
                                            <img src="https://img.icons8.com/?size=100&id=88611&format=png&color=000000"  id="lockIcon" class="icon hidden" alt="lock" />                                            
                                            <button class="btn btn-primary mt-3 mb-3 me-1" disabled>댓글 등록</button>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <!-- 댓글 등록 컨테이너 끝 -->
                        </div>
                        <!-- 카드 풋터끝 -->
                    </div>
                </main>
            </div>
        </div>
        <!-- 저작권 표시 꼭 있어야함 -->
        <footer class="container mt-4 mb-5">
        
        

        <div class="row">
            <div class="col-12 text-end">
                <a target="_blank" href="https://icons8.com/icon/DFelf9dA7GBS/heart-lock" style="color: gray;">Icons by :</a>
                <a target="_blank" href="https://icons8.com" style="color: gray;">Icons8</a>
            </div>
        </div>
        <%@ include file="../fragments/footer.jspf"%>
    </footer>
    </div>
    <!-- 부트스트랩 js라이브러리 -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <!-- 우리가 만드는 js파일 앞에 두어야 함 순서중요! -->
    <!-- Axio JS 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- 우리가 만드는 js파일 -->
    <!-- <c:url var="commentsJS" value="/js/comments.js" /> -->
    <!-- <script src="${commentsJS}"></script> -->
    
    <script>
document.addEventListener('DOMContentLoaded', function() {
    // 글쓰기 버튼 클릭 이벤트 리스너 추가
    document.querySelector('#create').addEventListener('click', function(event) {
        // 사용자 ID가 없으면 경고 메시지를 표시하고 페이지 이동을 막습니다.
        var id = "${signedInUser}";
        if (!id) {
            event.preventDefault(); // 링크 이동을 막습니다.
            alert("로그인 하세요.");
        }
    });
});
</script>
<script>
  function confirmDeletion() {
    return confirm("정말 삭제하시겠습니까?");
  }
</script>   

<!-- test -->
 <script>
        // 현재 상태 값을 저장하는 변수
        let isPrivate = 0; // 0이면 공개댓글, 1이면 비밀댓글

        // openIcon과 lockIcon 요소를 가져옵니다.
        const openIcon = document.getElementById('openIcon');
        const lockIcon = document.getElementById('lockIcon');
        const textarea = document.getElementById('exampleTextarea');
        
        // openIcon을 클릭했을 때 실행될 함수
        function toggleIcons() {
            if (isPrivate === 0) {
                // openIcon이 보이는 상태에서 클릭되면 lockIcon을 보이게 하고 openIcon을 숨깁니다.
                openIcon.classList.remove('visible');
                openIcon.classList.add('hidden');
                lockIcon.classList.remove('hidden');
                lockIcon.classList.add('visible');
                isPrivate = 1; // 상태 값을 1로 설정
                textarea.placeholder = "비밀 댓글을 작성하세요.";
            } else {
                // lockIcon이 보이는 상태에서 클릭되면 openIcon을 보이게 하고 lockIcon을 숨깁니다.
                lockIcon.classList.remove('visible');
                lockIcon.classList.add('hidden');
                openIcon.classList.remove('hidden');
                openIcon.classList.add('visible');
                isPrivate = 0; // 상태 값을 0으로 설정
                textarea.placeholder = "착하고 고운 언어를 사용해 주세요 ㅠ_ㅠ";
            }
        }

        // openIcon과 lockIcon 요소에 클릭 이벤트 리스너를 추가합니다.
        openIcon.addEventListener('click', toggleIcons);
        lockIcon.addEventListener('click', toggleIcons);

        // 텍스트 영역이 비어 있는지 확인하는 함수
        function checkTextarea() {
            if (textarea.value.trim() === "") {
                alert("내용을 입력하세요.");
                textarea.focus();
            } else {
                // 댓글을 등록하는 함수를 호출합니다.
                registerComment();
            }
        }

        // 댓글을 등록하는 함수
        function registerComment() {
          //  const comment = textarea.value.trim();
            // 세션에 저장된 로그인 사용자 아이디를 자바스크립트 변수에 저장
            const usersId = '${signedInUsersId}'; // 실제로 서버에서 세션 사용자 아이디를 가져와야 합니다.
            const postId = document.getElementById('inputPostId').value;
            const content = document.getElementById('exampleTextarea').value;
            const data = { postId, usersId, content, isPrivate };

            // 매핑된 Rest컨트롤러의 리턴값이 1일때 실행
            axios.post('/audiro/community/api/comments', data)
                .then(response => {
                    if (response.data === 1) {
                        alert("댓글이 등록되었습니다.");
                        textarea.value = ""; // 텍스트 영역 초기화
                       // loadComments(1);
                        location.reload(); // 새로고침
                    } else {
                        alert("댓글 등록에 실패했습니다.");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("댓글 등록에 실패했습니다.");
                });
        }
    </script>
<!-- test끝 -->
 
 <!-- test -->
     <!-- 우리가 만드는 js파일 -->
    <c:url var="c" value="/js/commnunity_comments.js" />
    <script src="${c}"></script>
    
    <c:url var="g" value="/js/community_good.js" />
    <script src="${g}"></script>
    
 <!-- test끝 -->
</body>
</html>
