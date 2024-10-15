<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>글 작성</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />
<link
    href="https://webfontworld.github.io/Cafe24SsurroundAir/Cafe24SsurroundAir.css"
    rel="stylesheet">
<!-- Quill CSS 포함 -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

<style>

.flex-container {
    display: flex;
}
.right-align {
    margin-left: auto;
    display: flex;
    align-items: center;
    color: grey;
    font-size: 90%;
}
.editor-container {
            height: 500px;
        }
    #editor .ql-editor::before {
        font-size: 20px; /* 원하는 크기로 설정 */
    }
      

        /* 폰트 크기 옵션을 스타일링 */       
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
<body onload="startTime()"> <!-- style="font-family: Cafe24SsurroundAir;" -->
    <div class="container">
        <%@ include file="../fragments/header.jspf"%>
    </div>
    
    <div class="container mt-4">
     <!-- 맨 위에 뜨는 nav끝 -->    
        <!-- **** row 클래스를 사용하여 두 섹션을 가로로 배치합니다. **** -->
        <div class="row">
           

            <!-- 상세보기 -->
            <!-- **** col-md-8와 col-lg-9 클래스를 사용하여 반응형 너비를 설정합니다. **** -->
            <div class="col-md-8 col-lg-9">
                <main>
                    <div class="card border-light mb-3">
                        <div class="card-header">
                                    <p class="mt-3 ms-2">
                                       <span
                                            class="text-body-secondary"> 글 작성</span>
                                    </p>
                        </div>
                     <c:url var="CreatePage" value="/community/create" />
                        <form id="selectForm" method="post" action="${CreatePage}">
                        <div class="flex-container mt-2 ms-1" style="width: 20%;"> 
                                <select class="form-select" id="PostTypeId" name="PostTypeId" style="float: left;">
                                    <option value="" selected hidden>게시판 선택</option>
                                    <option value="20">여행메이트</option>
                                    <option value="30">자유게시판</option>
                            </select>
                        </div>
                        <!-- 글타입 콤보박스 끝 -->
                                <input type="hidden" name="usersId" value="${usersId}" />
                                <div class="mt-2 py-1" style="border-bottom: 1px solid grey;">
                                    <input class="form-control form-control-lg" name="title" type="text"  autofocus style="font-size: 220%; text-align: center;" placeholder="제목을 입력하세요.">
                                    <div class="flex-container">
                                        <div class="right-align me-2">
                                            <p class="m-2 p-2 mt-3 me-1"
                                                style="color: grey; font-size: 115%;">작성 시간 :</p>
                                            <div class="pt-2 me-1" id="date" style="color: grey; font-size: 120%;"></div>
                                            <div class="pt-2" id="clock" style="color: grey; font-size: 120%;"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 글 작성 content -->
                                <div class="container mt-3">
                                    <div class="editor-container" id="editor"></div>
                                    <!-- Quill 에디터 내용을 저장하기 위한 숨겨진 텍스트 영역 추가 -->
                                    <textarea id="content" name="content" style="display:none;"></textarea>
                                </div>
                                <div class="mt-2 mb-1">
                                    <!-- 수정시간 수정버튼 누를때 넣기 <p class="me-4"
                                        style="color: grey; font-size: 90%; text-align: right;">수정
                                        시간 : ${p.createdTime}</p> -->
                                </div>
                            <div class="row mt-3">
                                <div
                                    class="col-12 d-flex justify-content-between">
                                    <a  id="cancelButton"
                                        class="btn btn-outline-danger ms-3"
                                        href="../community/main">취소</a>
                                    <div>
                                        <button type="button"
                                            class="btn btn-outline-secondary me-2">임시저장</button>
                                        <input
                                            class="btn btn-outline-success me-2"
                                            type="submit" value="작성 완료">
                                    </div>
                                </div>
                            </div>
                        </form>
                        </div>

                        <div class="card-footer">
                        <!-- TODO:  -->
                        </div>
                    </div>
                </main>
            </div>
        </div>
            <div class="container-fluid">
        <%@ include file="../fragments/footer.jspf"%>
    </div>
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
    function startTime() {
        const today = new Date();
        let h = today.getHours();
        let m = today.getMinutes();
        let s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        document.getElementById('clock').innerHTML = h + ":" + m + ":" + s;
        document.getElementById('date').innerHTML = today.toLocaleDateString(); // 오늘 날짜 표시
        setTimeout(startTime, 1000);
    }

    function checkTime(i) {
        if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
        return i;
    }
    </script>
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

// 사용자 정의 언어 (한국어) 설정
var koreanTranslations = {
    'bold': '굵게',
    'italic': '기울임',
    'underline': '밑줄',
    'strike': '취소선',
    'link': '링크',
    'image': '이미지',
    'video': '비디오',
    'clean': '서식 제거',
    'header': '헤더',
    'list': '목록',
    'ordered': '순서 있는 목록',
    'bullet': '순서 없는 목록',
    'blockquote': '인용문',
    'code-block': '코드 블럭',
    'script': '첨자',
    'sub': '아래 첨자',
    'super': '위 첨자',
    'indent': '들여쓰기',
    'direction': '텍스트 방향',

};

// 툴바 버튼의 텍스트를 한국어로 변경
var toolbarButtons = document.querySelectorAll('.ql-toolbar button');
toolbarButtons.forEach(button => {
    var format = button.classList[0].split('-')[1];
    if (koreanTranslations[format]) {
        button.title = koreanTranslations[format];
    }
});

// 드롭다운 메뉴의 텍스트를 한국어로 변경
var selectItems = document.querySelectorAll('.ql-toolbar select');
selectItems.forEach(select => {
    var format = select.classList[0].split('-')[1];
    if (koreanTranslations[format]) {
        select.title = koreanTranslations[format];
        Array.from(select.options).forEach(option => {
            if (koreanTranslations[option.value]) {
                option.text = koreanTranslations[option.value];
            }
        });
    }
});


// Quill 이벤트 리스너 추가
quill.on('text-change', function(delta, oldDelta, source) {
    console.log('Text change detected!');
    console.log(delta);
});
</script>
<script>
function showAlert() {
    alert("글이 등록되었습니다.");
}

    // DOMContentLoaded 이벤트 리스너를 추가합니다. 이는 문서의 DOM 트리가 완전히 로드된 후 실행됩니다.
    document.addEventListener('DOMContentLoaded', function() {
        // 'selectForm'이라는 ID를 가진 폼 요소에 'submit' 이벤트 리스너를 추가합니다.
        document.getElementById('selectForm').addEventListener('submit', function(event) {
        	
        	
            // 'PostTypeId'라는 ID를 가진 선택 요소를 가져옵니다.
            // var select = document.getElementById('PostTypeId');
            
            
            // 'title'이라는 이름을 가진 입력 요소를 가져옵니다.
            var title = document.querySelector('input[name="title"]');
            // Quill 에디터의 내용을 가져옵니다.
            var content = document.querySelector('#editor .ql-editor').innerHTML;

            // 선택된 값이 비어 있는 경우 (게시판 선택이 안 된 경우)
            /* if (select.value === "") {
                event.preventDefault(); // 폼 제출을 막습니다.
                alert("게시판을 선택해 주세요."); // 사용자에게 경고 메시지를 표시합니다.
                return false; // 추가적인 동작을 방지하기 위해 false를 반환합니다.
            } */

            // 제목이 비어 있는 경우
            if (title.value.trim() === "") {
                event.preventDefault(); // 폼 제출을 막습니다.
                alert("제목을 입력해 주세요."); // 사용자에게 경고 메시지를 표시합니다.
                return false; // 추가적인 동작을 방지하기 위해 false를 반환합니다.
            }

            // 내용이 비어 있는 경우
            if (content.trim() === "<p><br></p>") {
                event.preventDefault(); // 폼 제출을 막습니다.
                alert("내용을 입력해 주세요."); // 사용자에게 경고 메시지를 표시합니다.
                return false; // 추가적인 동작을 방지하기 위해 false를 반환합니다.
            }
            
            // 폼 제출 전 Quill 에디터의 내용을 숨겨진 텍스트 영역에 설정합니다.
            document.getElementById('content').value = content;
            

            showAlert(); // 글이 등록되었음을 알림
        });
    });
</script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('cancelButton').addEventListener('click', function(event) {
            event.preventDefault(); // 링크 이동을 막습니다.
            var userConfirmed = confirm("작성중인 글쓰기를 종료하시겠습니까?");
            if (userConfirmed) {
                window.location.href = "../community/main"; // 확인을 누르면 링크로 이동합니다.
            }
        });
    });
</script>


</body>
</html>
