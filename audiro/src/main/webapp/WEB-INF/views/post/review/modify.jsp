<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>여행후기 수정페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="https://webfontworld.github.io/Cafe24SsurroundAir/Cafe24SsurroundAir.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style>
/* 중앙 정렬을 위한 스타일 추가 */
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
}

.container-fluid {
	width: 100%;
	padding: 0;
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

.card-body {
	width:
}

.form-footer {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	margin-top: 1rem;
	flex-wrap: wrap; /* 요소가 줄바꿈되도록 설정 */
}

.form-footer {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	margin-top: 1rem;
	flex-wrap: wrap; /* 요소가 줄바꿈되도록 설정 */
	gap: 1rem; /* 요소 간 간격 설정 */
}

.form-footer label {
	margin-bottom: 0.5rem; /* 줄바꿈 시 간격 조정 */
}

.form-footer button {
	margin-bottom: 0.5rem; /* 줄바꿈 시 간격 조정 */
	flex-shrink: 0; /* 버튼이 줄어들지 않도록 설정 */
}

#title {
	width: 100%; /* 가로 전체 너비로 설정 */
	max-width: 1000px; /* 최대 너비 설정 (원하는 크기로 조정) */
	padding: 10px; /* 내부 여백 설정 */
	box-sizing: border-box; /* padding이 너비에 포함되도록 설정 */
	margin-bottom: 20px;
	font-size: 25px;
	font-weight: bold; /* 폰트를 진하게 설정 */
}
</style>
</head>
<body>
	<c:set var="travelReviewPage" value="내 여행일기" />
	<%@ include file="../../fragments/header.jspf"%>
	<div class="container-fluid">
		<main>
			<div class="main-class mt-5 card">

				<div class="card-header">
					<h4>여행후기 수정페이지</h4>
				</div>
				<div class="card-body">
					<form id="modifyForm" action="/audiro/post/review/update"
						method="post" class="form-inline">
						<input type="hidden" id="postId" name="postId"
							value="${list.postId}" /> <input type="hidden" id="id" name="id"
							value="${list.id}" /> <input id="title" class="form-control"
							name="title" value="${list.title}" type="text" required />
						<textarea id="summernote" name="content">${list.content}</textarea>
						<div class="form-footer">
							<label id="modifiedTime" class="col-form-label">${list.modifiedTime}</label>
							<button class="btn btn-primary" id="modifyBtn">수정완료</button>
						</div>
					</form>
				</div>
			</div>
	</div>
	</main>
	</div>
	<div class="container-fluid">
		<%@ include file="../../fragments/footer.jspf"%>
	</div>

	<script>
		// Summernote 설정
		$('#summernote').summernote({
			placeholder : '내용을 입력하세요',
			tabsize : 2,
			height : 800
		// Summernote의 초기 높이 설정
		});

		// textarea의 높이 자동 조정
		$('#summernote').on('summernote.change', function() {
			// textarea의 높이를 Summernote의 높이에 맞게 조정
			$(this).height('');
			$(this).height(this.scrollHeight);
		});
	</script>

	<!-- Axios 라이브러리 포함 -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<!-- reviewMypage.js -->
	<c:url var="mypageJS" value="/js/modify.js" />
	<script src="${mypageJS}"></script>
</body>
</html>
