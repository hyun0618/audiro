<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>어디로</title>


        
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" 
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        
<!-- CSS 스타일 추가 마크태그에 쓰려고 했으나 그냥 빼버림-->
<style>
.carousel-item {
            width: 8500px;
            height: 450px;
            overflow: hidden;
        } 
        .carousel-item video, .carousel-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

.highlight {
    background-color: #F6E3FF;
}

.btn-group .btn {
    padding: 0.20rem 0.45rem;
    font-size: 0.8rem;
}

.radio-container {
    display: flex;
    justify-content: flex-end;
    margin-top: 2rem;
}
</style>
</head>
<body>
    
        <div class="container-fluid mt-3">
        <%@ include file="../fragments/header.jspf"%>
        </div>
    <div class="container">
    <!-- 전체 콘텐츠를 감싸는 컨테이너, 상단 마진을 추가합니다. -->
<div class="container mt-5 ms-5">
    <!-- 그리드 시스템의 행(row)을 정의합니다. -->
    <div class="row">
        <!-- 캐러셀 -->
        <div class="col-md-8">
            <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
                <!-- 캐러셀 인디케이터 (하단의 동그라미) -->
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <!-- 캐러셀 아이템을 포함하는 div -->
                <div class="carousel-inner">
                    <!-- 첫 번째 캐러셀 아이템: 동영상 -->
                    <div class="carousel-item active">
                        <c:url var="logo1" value="/images/3_.gif"></c:url>
                        <img src="${logo1}" class="d-block w-100 img-fluid" alt="Image 1"/>                   
                    </div>
                    <!-- 두 번째 캐러셀 아이템: 이미지 -->
                    <div class="carousel-item">
                        <c:url var="logo2" value="/images/2_.gif"></c:url>
                        <img src="${logo2}" class="d-block w-100 img-fluid" alt="Image 2"/>
                    </div>
                    <!-- 세 번째 캐러셀 아이템: 이미지 -->
                    <div class="carousel-item">
                        <c:url var="logo3" value="/images/1_.gif"></c:url>
                        <img src="${logo3}" class="d-block w-100 img-fluid" alt="Image 3"/>
                    </div>
                </div>
                <!-- 이전 버튼 -->
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <!-- 다음 버튼 -->
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <!-- Bootstrap 캐러셀 컴포넌트 끝 -->
        </div>
        <!-- 아코디언 섹션, 화면 크기가 md 이상일 때 3칸을 차지합니다. -->
        <div class="col-md-3">
            <!-- Bootstrap 아코디언 컴포넌트 시작 -->
            <div class="accordion" id="accordionExample">
                <!-- 첫 번째 아코디언 아이템 -->
                <div class="accordion-item">
                    <!-- 아코디언 헤더 -->
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button collapsed"  data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            💗 LIKE USER TOP3
                        </button>
                    </h2>
                    <!-- 아코디언 내용 -->
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <!-- 순위 테이블 시작 -->
                            <table class="table table-hover" style="margin: 0 auto;">
                                <thead class="table table-light">
                                    <tr>
                                        <th class="text-center">순위</th>
                                        <th class="text-center">닉네임</th>
                                        <th class="text-center">💘</th>
                                    </tr>
                                </thead>
                                <!-- rank가 1인 경우 행을 강조 -->
                                <c:forEach var="like" items="${userLikeTop3List}">
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${like.rank == 1}">
                                                <tr class="table-primary">
                                                    <td class="text-center">🐳</td>
                                                    <td class="text-center">${like.nickname}</td>
                                                    <td class="text-center">${like.count}</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td class="text-center">${like.rank}</td>
                                                    <td class="text-center">${like.nickname}</td>
                                                    <td class="text-center">${like.count}</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </c:forEach>
                            </table>
                            <!-- 순위 테이블 끝 -->
                        </div>
                    </div>
                </div>
                <!-- 두 번째 아코디언 아이템 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            👍🏻 POST TOP3
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <!-- 순위 테이블 시작 -->
                            <table class="table table-hover" style="margin: 0 auto;">
                                <thead class="table table-light">
                                    <tr>
                                        <th class="text-center">순위</th>
                                        <th class="text-center">title</th>
                                        <th class="text-center">👍🏻</th>
                                    </tr>
                                </thead>
                                <!-- rank가 1인 경우 행을 강조 -->
                                <c:forEach var="pg" items="${postGoodTop3List}">
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${pg.rank == 1}">
                                                <tr class="table-primary">
                                                    <td class="text-center">🐳</td>
                                                    <td class="text-center">${pg.title}</td>
                                                    <td class="text-center">${pg.good}</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td class="text-center">${pg.rank}</td>
                                                    <td class="text-center">${pg.title}</td>
                                                    <td class="text-center">${pg.good}</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </c:forEach>
                            </table>
                            <!-- 순위 테이블 끝 -->
                        </div>
                    </div>
                </div>
                <!-- 세 번째 아코디언 아이템 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            💬 COMMENT TOP3
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <!-- 순위 테이블 시작 -->
                            <table class="table table-hover" style="margin: 0 auto;">
                                <thead class="table table-light">
                                    <tr>
                                        <th class="text-center">순위</th>
                                        <th class="text-center">닉네임</th>
                                        <th class="text-center">&#128221;</th>
                                    </tr>
                                </thead>
                                <!-- rank가 1인 경우 행을 강조 -->
                                <c:forEach var="cu" items="${commentsUserTop3}">
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${cu.rank == 1}">
                                                <tr class="table-primary">
                                                    <td class="text-center">🐳</td>
                                                    <td class="text-center">${cu.nickname}</td>
                                                    <td class="text-center">${cu.count}</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td class="text-center">${cu.rank}</td>
                                                    <td class="text-center">${cu.nickname}</td>
                                                    <td class="text-center">${cu.count}</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </c:forEach>
                            </table>
                            <!-- 순위 테이블 끝 -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bootstrap 아코디언 컴포넌트 끝 -->
        </div>
    </div>
</div>

    
    <div class="mt-5 ms-3">
        <p style="font-size: 1.5rem;">💌 Bulletn Board</p> 
    </div>

<!--탭 시작-->
<div class="mt-4 ms-3">
    <ul class="nav nav-tabs mt-2" role="tablist">
        <li class="nav-item" role="presentation">
          <a class="nav-link active" data-bs-toggle="tab" href="#all" aria-selected="true" role="tab">전체</a>
        </li>
        <li class="nav-item" role="presentation">
          <a class="nav-link" data-bs-toggle="tab" href="#mate" aria-selected="false" tabindex="-1" role="tab" aria-controls="mate">여행메이트</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" data-bs-toggle="tab" href="#free" aria-selected="false" tabindex="-1" role="tab" aria-controls="free">자유게시판</a>
          </li>
          <li class="nav-item" role="presentation">
             <a class="nav-link disabled" data-bs-toggle="tab" href="#search" aria-selected="false" tabindex="-1" role="tab">검색 결과</a>
          </li>
        <c:url var="writing" value="/community/create">
            <c:param name="id" value="${signedInUser}"></c:param>
        </c:url>
        <a href="${writing}" class="btn btn-outline-primary ms-2 mb-1">글쓰기</a> 
        <!--검색옵션 시작-->      
        <div class="col-1 ms-5 me-2">
            <select class="form-control" name="category1">
                <option value="mf">전체</option>
                <option value="m">여행메이트</option>
                <option value="f">자유게시판</option>
            </select>
        </div>
        <div class="col-1 me-2">
            <select class="form-control" name="category2">
                <option value="t">제목</option>
                <option value="c">내용</option>
                <option value="tc">제목+내용</option>
                <!-- and 조건이 아닌 or 조건으로 검색 -->
                <option value="a">닉네임</option>
            </select>
        </div>
        <!-- 검색 옵션 끝 -->
        <!--검색 시작-->
        <div class="d-flex me-2 mb-1">
        
                <input id="inputSearch" class="form-control me-sm-2 col-10" type="search" placeholder="커뮤니티 검색" required>
                <button  id="btnSearch" class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
        
        </div>
        <!--검색 끝-->
      </ul> 
      <!--탭버튼 끝-->
      <!--탭콘텐츠시작-->
      <div id="myTabContent" class="tab-content">
      <!-- 전체 탭 내용 시작 -->
        <div class="tab-pane fade show active" id="all" role="tabpanel">
            <!-- 라디오 버튼 시작 -->
            <div class="card border-light mt-1 mb-1 py-2">
                <div class="card-header d-flex align-items-center justify-content-between">
                    <p class="mb-0">전체 목록</p>
                    <div class="btn-group ms-auto" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check" name="btnradio1" id="btnradio1_1" autocomplete="off" checked>
                        <label class="btn btn-outline-primary" for="btnradio1_1">최신순</label>
                        <input type="radio" class="btn-check" name="btnradio1" id="btnradio1_2" autocomplete="off">
                        <label class="btn btn-outline-primary" for="btnradio1_2">인기순</label>
                    </div>
                </div>
            </div>
            <!-- 라디오 버튼 끝 -->
                    <!-- 전체 글 목록 테이블 시작 -->
                    <table class="table table-hover mt-1">
                        <thead class="table table-primary">
                            <tr>
                                <th class="text-center">#</th>
                                <th class="text-center">Title</th>
                                <th class="text-center">Nickname</th>
                                <th class="text-center">Good</th>
                                <th class="text-center">Created Time</th>
                            </tr>
                        </thead>
                        <tbody id="postTableBody">
                            <!-- AJAX로 데이터를 가져와 이곳에 삽입할 것입니다. -->
                        </tbody>
                    </table>

                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center"
                            id="pagination">
                            <!-- AJAX로 페이지 링크를 가져와 이곳에 삽입할 것입니다. -->
                        </ul>
                    </nav>
                    <!-- 전체 글 목록 테이블 끝 -->
                </div><!-- 전체 탭 내용 끝 -->
                
        <!-- 여행 메이트 탭 내용 시작 -->
        <div class="tab-pane fade" id="mate" role="tabpanel" aria-labelledby="mate-tab">
            <!-- 라디오 버튼 시작 -->
            <div class="card border-light mt-1 mb-1 py-2">
                <div class="card-header d-flex align-items-center justify-content-between">
                    <p class="mb-0">여행 메이트 게시판</p>
                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                            <input type="radio" class="btn-check" name="btnradio2" id="btnradio2_1" autocomplete="off" checked>
                            <label class="btn btn-outline-primary" for="btnradio2_1">최신순</label>
                            <input type="radio" class="btn-check" name="btnradio2" id="btnradio2_2" autocomplete="off" >
                            <label class="btn btn-outline-primary" for="btnradio2_2">인기순</label>
                        </div>
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
                                <th class="text-center">Created Time</th>
                            </tr>
                        </thead>
                        <tbody id="postTableBody2">
                            <!-- AJAX로 데이터를 가져와 이곳에 삽입할 것입니다. -->
                        </tbody>
                    </table>

                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center"
                            id="pagination2">
                            <!-- AJAX로 페이지 링크를 가져와 이곳에 삽입할 것입니다. -->
                        </ul>
                    </nav>
                    <!-- 여행메이트 글 목록 테이블 끝 -->
        </div>
        <!-- 여행 메이트 탭 내용 끝-->
        <!-- 자유 게시판 탭 내용 시작 -->
        <div class="tab-pane fade" id="free" role="tabpanel" aria-labelledby="free-tab">
            <!-- 라디오 버튼 시작 -->
            <div class="card border-light mt-1 mb-1 py-2">
                <div class="card-header d-flex align-items-center justify-content-between">
                    <p class="mb-0">자유 게시판</p>
                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check" name="btnradio3" id="btnradio3_1" autocomplete="off" checked>
                        <label class="btn btn-outline-primary" for="btnradio3_1">최신순</label>
                        <input type="radio" class="btn-check" name="btnradio3" id="btnradio3_2" autocomplete="off" >
                        <label class="btn btn-outline-primary" for="btnradio3_2">인기순</label>
                    </div>
                </div>
            </div>
            <!-- 라디오 버튼 끝 -->                
                    <!-- 전체 글 목록 테이블 시작 -->
                    <table class="table table-hover mt-2">
                        <thead class="table table-primary">
                            <tr>
                                <th class="text-center">#</th>
                                <th class="text-center">Title</th>
                                <th class="text-center">Nickname</th>
                                <th class="text-center">Good</th>
                                <th class="text-center">Created Time</th>
                            </tr>
                        </thead>
                        <tbody id="postTableBody3">
                            <!-- AJAX로 데이터를 가져와 이곳에 삽입할 것입니다. -->
                        </tbody>
                    </table>

                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center"
                            id="pagination3">
                            <!-- AJAX로 페이지 링크를 가져와 이곳에 삽입할 것입니다. -->
                        </ul>
                    </nav>
                    <!-- 전체 글 목록 테이블 끝 -->
        </div>
        <!-- 자유 게시판 탭 내용 끝 -->
        <!-- 검색 결과 탭 콘텐츠 -->
    <div class="tab-pane fade" id="search" role="tabpanel" aria-labelledby="search-tab">
                    <table class="table table-hover mt-2">
                        <thead class="table table-primary">
                            <tr>
                                <th class="text-center">#</th>
                                <th class="text-center">Title</th>
                                <th class="text-center">Nickname</th>
                                <th class="text-center">Good</th>
                                <th class="text-center">Created Time</th>
                            </tr>
                        </thead>
                        <tbody id="searchResults">
                            <!-- AJAX로 데이터를 가져와 이곳에 삽입할 것입니다. -->
                        </tbody>
                    </table>
    </div>

<!-- 검색탭끝 -->
      </div>
      <!--탭콘텐츠끝-->
</div>
<!-- 탭 끝 -->
<footer class="footer mt-5 mb-3 pb-3 pt-5">
    <div class="container-fluid">
        <%@ include file="../fragments/footer.jspf"%>
    </div>
</footer>
</div><!--전체 페이지 div 컨테이너 안 끝-->

 <!-- Bootstrap 5 JS 포함: 캐러셀 기능 활성화를 위해 필요 -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<c:url var="communityJS" value="/js/community.js" />
<script src="${communityJS}"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // 글쓰기 버튼 클릭 이벤트 리스너 추가
    document.querySelector('.btn-outline-danger.ms-2.mb-1').addEventListener('click', function(event) {
        // 사용자 ID가 없으면 경고 메시지를 표시하고 페이지 이동을 막습니다.
        var id = "${signedInUser}";
        if (!id) {
            event.preventDefault(); // 링크 이동을 막습니다.
            alert("로그인 하세요.");
        }
    });
});
</script>

<!--검색 test -->
<script>
/**
 * 
 */

 
 document.addEventListener('DOMContentLoaded', function() {
    // 검색 버튼 클릭 이벤트 리스너 추가
    document.getElementById('btnSearch').addEventListener('click', function(event) {
        event.preventDefault(); // 폼 제출을 막습니다.

        // 검색어 가져오기
        const query = document.getElementById('inputSearch').value;

        // 검색어가 비어있는지 확인
        if (!query.trim()) {
            alert("검색어를 입력하세요.");
            return;
        }

        // 선택한 카테고리 값 가져오기
        const category1 = document.querySelector('select[name="category1"]').value;
        const category2 = document.querySelector('select[name="category2"]').value;

        // '검색 결과' 탭 활성화
        const searchTabLink = document.querySelector('a[href="#search"]');
        if (searchTabLink) {
            const searchTab = new bootstrap.Tab(searchTabLink);
            searchTab.show();
        }

        // 검색 요청 데이터
        const data = {
            keyword: query,
            category1: category1,
            category2: category2
        };

        console.log('검색 요청 데이터:', data);

        // Axios를 사용하여 검색 요청 보내기
        axios.post('../community/search', data)
            .then(function(response) {
                console.log('검색 응답 데이터:', response.data);
                // 검색 결과를 가져온 후 표시할 HTML 요소 가져오기
                const divSearchResultsContainer = document.getElementById('search');
                const searchResultsContainer = document.getElementById('searchResults');
                // 기존 검색 결과 초기화
                searchResultsContainer.innerHTML = '';

                // 검색 결과가 없는 경우
                if (response.data == null || response.data.length === 0) {
                	divSearchResultsContainer.innerHTML = '<div style="padding: 100px;"><p class="text-center mb-5">검색 결과가 없습니다.</p><div>';
                    return;
                }

                // 검색 결과를 반복하며 HTML 생성
                response.data.searchPostList.forEach(post => {
                	const postDetailsPage = `../community/details?postId=\${post.postId}`;
                    const resultHTML = `
                        <tr class="table-light">
                            <td class="text-center">\${post.postId}</td>
                            <td class="text-center"> 
                                <a href="\${postDetailsPage}">\${post.title}</a>
                            </td>
                            <td class="text-center">\${post.nickname}</td>
                            <td class="text-center">\${post.good}</td>
                            <td class="text-center">\${post.createdTime}</td>
                        </tr>
                    `;
                    console.log(resultHTML);
                    searchResultsContainer.innerHTML += resultHTML;
                });
            })
            .catch(function(error) {
                console.error('검색 중 오류 발생:', error);
            });
    });
});
</script>
<!--검색 test 끝-->


</body>
</html>