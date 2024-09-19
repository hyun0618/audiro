<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>자유게시판</title>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />
<link
    href="https://webfontworld.github.io/Cafe24SsurroundAir/Cafe24SsurroundAir.css"
    rel="stylesheet">


<style>
.flex-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.image-hover {
    transition: transform 1.5s;
}

.image-hover:hover {
    transform: scale(2.0);
}

.btn-group .btn {
    padding: 0.25rem 0.5rem;
    font-size: 0.8rem;
}

.radio-container {
    display: flex;
    justify-content: flex-end;
    margin-top: 2rem;
}
</style>
</head>
<body> <!-- style="font-family: Cafe24SsurroundAir;"  --> 

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
                    <h3 class="card-header p-3"
                        style="background-color:#c8dff3; text-align: center;">COMMUNITY</h3>
                    <div class="card-body">
                    <!--     <h5 class="card-title m-1"
                            style="text-align: center;">Free Board</h5>
                        <h6 class="card-subtitle text-muted p-2"
                            style="text-align: center;">Feel free
                            to write 😁</h6> --> 
                    <!--      <img
                            style="display: block; margin: 0 auto; width: 100%;"
                            src="../images/freelist.png" alt="여행메이트"> -->
                    </div>
                    <div class="card-body">
                        <p class="ps-3 pe-3" style="text-align: center;">"여행을
                            즐기러 떠나요!"</p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <c:url var="main" value="/community/main">
                            <c:param name="id" value="${signedInUser}"></c:param>
                        </c:url>
                        <li class="list-group-item">
                            <a style="text-decoration: none;" href="${main}">커뮤니티 메인</a>
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
                <div class="card">
                    <div class="card-header m-1">
                        <h4 class="card-title"
                            style="text-align: center;">Community
                            Ranking</h4>
                    </div>
                    <div class="card-body">
                        <p style="text-align: center;">💗 LIKE USER
                            TOP3</p>
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
                                        <c:when test="${like.rank == 1}">
                                            <tr class="table-primary">
                                                <td class="text-center">🐬</td>
                                                <td class="text-center">${like.nickname}</td>
                                                <td class="text-center">${like.count}</td>
                                            </tr>
                                        </c:when>
                                        <c:when test="${like.rank == 2}">
                                            <tr>
                                                <td class="text-center">2</td>
                                                <td class="text-center">${like.nickname}</td>
                                                <td class="text-center">${like.count}</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td class="text-center">3</td>
                                                <td class="text-center">${like.nickname}</td>
                                                <td class="text-center">${like.count}</td>
                                            <tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </c:forEach>
                        </table>
                        <!-- post 순위 -->
                        <p class="mt-3 pt-2" style="text-align: center;">👍🏻
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
                                        <c:when test="${pg.rank == 1}">
                                            <tr class="table-primary">
                                                <td class="text-center">🐬</td>
                                                <td class="text-center">${pg.title}</td>
                                                <td class="text-center">${pg.good}</td>
                                            </tr>
                                        </c:when>
                                        <c:when test="${pg.rank == 2}">
                                            <tr>
                                                <td class="text-center">2</td>
                                                <td class="text-center">${pg.title}</td>
                                                <td class="text-center">${pg.good}</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td class="text-center">3</td>
                                                <td class="text-center">${pg.title}</td>
                                                <td class="text-center">${pg.good}</td>
                                            <tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </c:forEach>
                        </table>
                        <!-- post 순위 끝 -->
                        <!-- comment 순위 -->
                        <p class="mt-3 pt-2" style="text-align: center;">💬
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
                                        <c:when test="${cu.rank == 1}">
                                            <tr class="table-primary">
                                                <td class="text-center">🐬</td>
                                                <td class="text-center">${cu.nickname}</td>
                                                <td class="text-center">${cu.count}</td>
                                            </tr>
                                        </c:when>
                                        <c:when test="${cu.rank == 2}">
                                            <tr>
                                                <td class="text-center">2</td>
                                                <td class="text-center">${cu.nickname}</td>
                                                <td class="text-center">${cu.count}</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td class="text-center">3</td>
                                                <td class="text-center">${cu.nickname}</td>
                                                <td class="text-center">${cu.count}</td>
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
            </div>
            <!-- 여행메이트 게시글 -->
            <!-- **** col-md-8와 col-lg-9 클래스를 사용하여 반응형 너비를 설정합니다. **** -->
            <div class="col-md-8 col-lg-9">
                <main>
                    <div class="card border-light mb-3">
                        <div class="card-header">
                            <p class="mt-3 ms-2">
                                <span class="text-body-secondary">자유
                                    게시판</span>
                            </p>
                            <!-- 글 타입 끝 -->
                        </div>
                        <!-- 글목록 테이블 시작 -->
                        <div>
                            <!-- 라디오 버튼 시작 -->
                            <div class="radio-container mt-3">
                                <div class="btn-group" role="group"
                                    aria-label="Basic radio toggle button group">
                                    <input type="radio"
                                        class="btn-check"
                                        name="btnradio2"
                                        id="btnradio2_1"
                                        autocomplete="off" checked>
                                    <label class="btn btn-outline-primary"
                                        for="btnradio2_1">최신순</label> <input
                                        type="radio" class="btn-check"
                                        name="btnradio2"
                                        id="btnradio2_2"
                                        autocomplete="off"> <label
                                        class="btn btn-outline-primary"
                                        for="btnradio2_2">인기순</label>
                                </div>
                            </div>
                            <!-- 라디오 버튼 끝 -->
                            <!-- 여행메이트 글 목록 테이블 시작 -->
                            <table class="table table-hover mt-2">
                                <thead class="table table-primary">
                                    <tr>
                                        <th class="text-center">#</th>
                                        <th class="text-center">Title</th>
                                        <th class="text-center">Nickname</th>
                                        <th class="text-center">Good</th>
                                        <th class="text-center">Created
                                            Time</th>
                                    </tr>
                                </thead>
                                <tbody id="postTableBody2">
                                    <!-- AJAX로 데이터를 가져와 이곳에 삽입할 것입니다. -->
                                </tbody>
                            </table>

                            <nav aria-label="Page navigation">
                                <ul
                                    class="pagination justify-content-center"
                                    id="pagination2">
                                    <!-- AJAX로 페이지 링크를 가져와 이곳에 삽입할 것입니다. -->
                                </ul>
                            </nav>
                            <!-- 여행메이트 글 목록 테이블 끝 -->
                        </div>
                        <!-- 글목록 테이블 끝 -->
                </main>
            </div>
        </div>
        <footer>
                <div class="container-fluid">
                    <%@ include file="../fragments/footer.jspf"%>
                </div>
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
    <c:url var="free" value="/js/community_free.js" />
    <script src="${free}"></script>
    
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
    
</body>
</html>
