<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>여행후기 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />

<!-- Quill CSS 포함 -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">

<!-- 글꼴을 명시적으로 가져오기 -->
<style>
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

body {
	width: 100%;
	margin: 0;
	line-height: 1.6;
	background-color: white !important;
	flex-direction: column;
	align-items: center;
	font-family: 'Cafe24SsurroundAir', sans-serif; /* 웹폰트 적용 */
}

.main-class {
	margin-top: 100px;
	margin-left: 100px;
	margin-right: 100px;
}

.container-fluid {
	width: 100%;
	padding: 0;
	}

.card {
	width: 100%;
	max-width: 1200px; /* 원하는 너비로 설정 */
	margin: 0 auto;
}

/*
.card {
	margin-left: auto; /* 왼쪽 마진 자동으로 설정 */
	margin-right: auto; /* 오른쪽 마진 자동으로 설정 */
	margin-top: 50px !important; /* 위쪽 마진 추가 */
	width: 90%; /* 카드의 너비를 90%로 설정 */
	max-width: 1000px; /* 카드의 최대 너비를 1000px로 설정 */
	padding: 20px; /* 내부 패딩 추가 */
	border: 1px solid #ccc; /* 경계 설정 */
	border-radius: 8px; /* 둥근 모서리 설정 */
	background-color: #fff; /* 배경색 설정 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 설정 */
}*/

#title, #buttons-container {
	width: 100%;
}

#buttons-container .btn {
	margin-right: 5px;
	margin-left: 10px;
}

#thumbnailDeleteButton {
	display: none;
}

#savebtn {
	background-color: #f9f9a3; /* 파스텔 노란색 */
	border: none;
	color: black;
	font-weight: bold;
	padding: 10px 20px; /* 패딩을 늘려서 버튼 크기 키우기 */
	font-size: 1.2em; /* 글자 크기 키우기 */
	position: relative;
	float: right; /* 버튼을 오른쪽으로 이동 */
	margin-right: 5px; /* 다른 버튼과의 간격 */
	margin-top: 10px; /* 위쪽 간격 추가 */
}

#savebtn:hover {
	background-color: #f1f1a3; /* 호버 효과를 위한 조금 더 진한 파스텔 노란색 */
}

.btn.travelCourseBtn, .btn.thumbnailBtn {
	background-color: #a3c6f9; /* 파스텔 하늘색 */
	border: none;
}

.btn.travelCourseBtn:hover, .btn.thumbnailBtn:hover {
	background-color: #a3bff1; /* 호버 효과를 위한 조금 더 진한 파스텔 하늘색 */
}

.form-row {
	display: flex;
	flex-direction: column; /* 세로 정렬 */
	align-items: flex-start;
}

#title {
	width: 100%; /* 제목 입력란의 너비를 100%로 설정 */
	margin-bottom: 20px; /* 제목과 에디터 사이의 간격 */
}

.editor-container {
	height: 700px; /* 에디터의 높이를 크게 설정 */
	border: 1px solid #ccc; /* 에디터 경계 설정 */
	width: 100%; /* 에디터 너비를 100%로 설정 */
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="10px"]::before {
	content: '10px';
	font-size: 10px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="12px"]::before {
	content: '12px';
	font-size: 12px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="14px"]::before {
	content: '14px';
	font-size: 14px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="16px"]::before {
	content: '16px';
	font-size: 16px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="18px"]::before {
	content: '18px';
	font-size: 18px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="20px"]::before {
	content: '20px';
	font-size: 20px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="24px"]::before {
	content: '24px';
	font-size: 24px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="28px"]::before {
	content: '28px';
	font-size: 28px;
}

.ql-snow .ql-picker.ql-size .ql-picker-item[data-value="32px"]::before {
	content: '32px';
	font-size: 32px;
}
</style>
</head>
<body class="bg-white">
	<c:set var="travelReviewPage" value="내 여행일기" />
	<%@ include file="../../fragments/header.jspf"%>
	<div class="container-fluid">

		<main>
			<div class="main-class mt-5 card">

				<div class="card-header">
					<h4>여행후기 글쓰기</h4>
				</div>
				<div class="card-body">
					<c:url var="reviewPage" value="/post/review/list" />

					<!-- 여행후기 작성 폼 -->
					<form id="createForm">
						<input type="hidden" name="id" value="${signedInUser}" />

						<!-- 제목 입력란 -->
						<div class="form-group">
							<input id="title" name="title" class="form-control" type="text"
								placeholder="제목을 입력하세요" required>
						</div>

						<!-- Quill 에디터를 사용한 내용 입력 -->
						<div class="form-group mt-3">
							<div class="editor-container" id="editor"></div>
							<!-- Quill 에디터 내용을 저장하기 위한 숨겨진 텍스트 영역 -->
							<textarea id="c_editor" name="content" style="display: none;"></textarea>
						</div>
					</form>

					<!-- 저장 버튼 -->
					<button type="submit" class="btn" id="savebtn">저장</button>
				</div>
			</div>
		</main>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-wEmeIV1mKuiNp12aFgE3XrA6sgC09K6Qap604vR9CLMNHOVvA20vFJo7Gh2NvGhP"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<c:url var="createJS" value="/js/create.js" />
	<script src="${createJS}"></script>

	<!-- Quill 라이브러리 -->
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<!-- Quill JavaScript 파일을 포함 -->
	<script>

// 글씨 크기 옵션 설정
var Size = Quill.import('attributors/style/size');
Size.whitelist = ['10px', '12px', '14px', '16px', '18px', '20px', '24px', '28px', '32px']; // 여기서 글씨 크기 옵션을 설정할 수 있습니다
Quill.register(Size, true);

// 글씨 색상 옵션 설정
var Color = Quill.import('attributors/style/color');
Quill.register(Color, true);

// 툴바 옵션 설정
var toolbarOptions = [
    [{ 'size': ['10px', '12px', '14px', '16px', '18px', '20px', '24px', '28px', '32px'] }], // 폰트 크기 옵션
    [{ 'color': [] }], // 글씨 색상 옵션 (Quill에서 기본 색상 팔레트 사용)
    [{ 'header': [1, 2, 3, false] }], // 헤더 스타일
    ['bold', 'italic', 'underline', 'strike'], // 굵게, 기울임, 밑줄, 취소선
    [{ 'list': 'ordered'}, { 'list': 'bullet' }], // 목록 (순서 있는, 순서 없는)
    ['link', 'image', 'video'], // 링크, 이미지, 비디오
    ['blockquote', 'code-block'], // 블럭 인용문, 코드 블럭
    [{ 'script': 'sub'}, { 'script': 'super' }], // 아래첨자, 위첨자
    [{ 'indent': '-1'}, { 'indent': '+1' }], // 들여쓰기, 내어쓰기
    [{ 'direction': 'rtl' }], // 텍스트 방향 (오른쪽에서 왼쪽)
    ['clean'] // 서식 제거
];

// Quill 에디터 초기화
var quill = new Quill('#editor', {
    theme: 'snow', // 'snow' 테마 사용
    placeholder: '여기에 내용을 입력하세요.', // 한국어 placeholder
    modules: {
        toolbar: toolbarOptions // 설정한 툴바 옵션을 사용
    }
});

// 'clean' 버튼 클릭 시 모든 콘텐츠 제거
document.querySelector('.ql-clean').addEventListener('click', function() {
    quill.setContents([]); // 모든 콘텐츠를 제거
});

// Quill 에디터 내용 저장
document.getElementById('savebtn').addEventListener('click', function() {
    var content = quill.root.innerHTML;
    document.getElementById('c_editor').value = content;
    document.getElementById('createForm').submit();
});

</script>

</body>
</html>
