<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>수정하기</title>
<!-- Font Awesome CDN 추가 눈알 때문에 추가함-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />
<link
    href="https://webfontworld.github.io/Cafe24SsurroundAir/Cafe24SsurroundAir.css"
    rel="stylesheet">

<style>
    .password-toggle {
        position: relative;
    }
    .password-toggle input {
        padding-right: 2.5rem; /* 아이콘 공간 확보 */
    }
    .password-toggle .password-toggle-icon {
        position: absolute;
        right: 0.75rem;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        color: #6c757d; /* 아이콘 색상 */
    }
        .password-toggle .input-group-text {
        cursor: pointer;
    }
    
        .container {
            max-width: 500px;
            margin: 50px auto;
            text-align: center;
        }
        #preview {
            margin-top: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #preview img {
            max-width: 200px;
            max-height: 200px;
        }   
</style>   
</head>
<body style="font-family: Cafe24SsurroundAir;">
 
 <c:set var="pageTitle" value="User Profile" scope="page" />
        <%@ include file="../fragments/header.jspf" %>
<div class="mt-5"></div>

    <div class="container" style="width: 1000px;">
       
        <main>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-12 ">
                    <div class="card mx-auto" style="max-width: 18rem;">
                        <div class="card-header">
                            <h2 class="text-center my-2">프로필 수정</h2>
                        </div>
                        <div class="card-body text-center">
                            <c:url var="profile" value="/${m.path}"></c:url>
                            <img src="${profile}" class="card-img-top mt-2 mx-auto" alt="기본 프로필" style="width: 80%; height: 80%;">
                        </div>
                    </div>
                     <!-- 파일 업로드 폼 -->
                    <c:url var="profile" value="/mypage/profile"></c:url>
                    <form id="profileForm" method="post" enctype="multipart/form-data" action="${profile}">
                        <div class="mx-auto mt-1" style="max-width: 18rem;">
                     <!-- 프로필 이미지 선택 입력 필드 -->
                         <!-- 숨겨진 사용자 ID 필드 -->
                        <input type="hidden" id="usersId" value="${m.usersId}" name="usersId" />   
                        <input class="mt-2 ms-2" type="file" id="profileImage" name="file" accept="image/*" required/>
                        <!-- 미리보기 이미지 영역 -->
                            <div id="preview">
                                <img id="previewImage" src="#" alt="프로필 미리보기" style="display:none;">
                            </div>
                        <!-- 미리보기 이미지 끝 -->   
                        </div>

                    <div class="text-center">
                        <input type="submit" value="수정" class="btn btn-outline-info mt-1" style="width: 90%; height: 80%;" />
                    </div>
                    </form>
                    
                </div>
                <!-- 회원정보 수정 -->
                <div class="col-lg-9 col-md-8 col-sm-12">
                    <div class="card">
                        <div class="card-header">
                            <h2 class="text-center my-2">수정하기</h2>
                        </div>
                        <div class="card-body">
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="mainId">아이디</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="mainId" type="text" name="mainId" value="${m.id}" readonly disabled />
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="mainPassword">비밀번호</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="mainPassword" type="password" name="mainPassword" disabled/>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="mainPasswordCheck">비밀번호 확인</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" type="password" id="mainPasswordCheck" name="mainPasswordCheck" disabled/>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#passwordModal">변경</button>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="mainName">이름</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="mainName" type="text" name="mainName" value="${m.userName}" disabled/>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#nameModal">변경</button>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="mainNickname">닉네임</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="mainNickname" type="text" name="mainNickname" value="${m.nickname}" disabled />
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#nicknameModal">변경</button>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="mainPhone">전화번호</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="mainPhone" type="text" name="mainPhone" value="${m.phone}" disabled />
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#phoneModal">변경</button>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="mainEmail">이메일</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="mainEmail" type="email" name="mainEmail" value="${m.email}" disabled/>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#emailModal">변경</button>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="mainIntroduction">자기소개</label>
                                    </div>
                                    <div class="col-md-7">
                                        <textarea class="form-control" id="mainIntroduction" name="mainIntroduction" disabled>${m.introduction}</textarea>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#introductionModal">변경</button>
                                    </div>
                                </div>
                                <div class="container">
                                    <div class="row mt-5 mb-2">
                                        <!-- 반응형 레이아웃을 위한 col 클래스 사용 -->
                                        <div class="col-12 col-md-9 d-flex justify-content-center mb-2 mb-md-0">
                                           <!-- <input type="submit" class="btn btn-outline-success w-100 w-md-auto" value="완료" />-->
                                        </div>
                                        <div class="col-12 col-md-3 d-flex justify-content-center">
                                            <button id="userDelete" class="btn btn-danger w-100 w-md-auto me-3">탈퇴하기</button>
                                        </div>
                                    </div>
                                </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <%@ include file="../fragments/footer.jspf"%>
            </div>
            
<!-- 비밀번호 변경 모달 -->
<div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="passwordModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="passwordModalLabel">비밀번호 변경</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 비밀번호 입력 필드 -->
                <div class="mb-3" id="passwordContainer">
                    <div class="input-group">
                        <input type="password" class="form-control mt-2" id="modalPassword" name="passwordHash" placeholder="비밀번호"/>
                        <span class="input-group-text password-toggle-icon mt-2" id="togglePassword">
                            <i class="fa fa-eye"></i> <!-- 눈 아이콘 -->
                        </span>
                    
                    <div class="invalid-feedback mt-2">비밀번호는 최소 8자 이상이며, 소문자, 대문자, 숫자, 특수문자가 각각 하나 이상 포함되어야 합니다.</div>
                    <div class="valid-feedback mt-2">비밀번호 조건을 충족합니다.</div>
                    </div>
                </div>
                <!-- 비밀번호 확인 입력 필드 -->
                <div class="mb-3" id="passwordConfirmContainer">
                    <!-- 숨겨진 사용자 ID 필드 -->
                    <input type="hidden" id="id" value="${m.id}" name="id" />
                    <div class="input-group">
                        <input type="password" class="form-control mt-2" id="modalPassword2" name="passwordHash" placeholder="비밀번호 확인" disabled/>
                        <span class="input-group-text password-toggle-icon mt-2" id="togglePassword2">
                            <i class="fas fa-eye"></i> <!-- 눈 아이콘 -->
                        </span>
                    
                    <div class="invalid-feedback mt-2">비밀번호가 일치하지 않습니다.</div>
                    <div class="valid-feedback mt-2">비밀번호가 일치합니다.</div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="submitButton" disabled>수정</button>
            </div>
        </div>
    </div>
</div>
<!-- 이름 변경 모달 -->
<div class="modal fade" id="nameModal" tabindex="-1" aria-labelledby="nameModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="nameModalLabel">이름 변경</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 숨겨진 사용자 ID 필드 -->
                <input type="hidden" id="id" value="${m.id}" name="id" />
                <input class="form-control mt-2" id="userName" type="text" name="userName" placeholder="새 이름"/>
                <div class="invalid-feedback mt-2">이름은 2자에서 30자 사이의 한글 또는 영문자로 구성되어야 합니다.</div>
                <div class="valid-feedback mt-2">등록 가능한 이름 입니다.</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="updateNameButton" disabled>수정</button>
            </div>
        </div>
    </div>
</div>

<!-- 닉네임 변경 모달 -->
<div class="modal fade" id="nicknameModal" tabindex="-1" aria-labelledby="nicknameModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="nicknameModalLabel">닉네임 변경</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 숨겨진 사용자 ID 필드 -->
                <input type="hidden" id="id" value="${m.id}" name="id" />
                <input class="form-control mt-2" id="nickname" type="text" name="nickname" placeholder="새 닉네임"/>
                <div class="invalid-feedback mt-2">중복된 닉네임 또는 입력 오류입니다. 닉네임은 영문자, 숫자, 한글, 밑줄 및 점을 포함 할 수 있으며, 1자 ~ 15자 사이여야 합니다.</div>
                <div class="valid-feedback mt-2">등록 가능한 닉네임입니다.</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="updateNicknameButton" disabled>수정</button>
            </div>
        </div>
    </div>
</div>
            <!-- 전화번호 변경 모달 -->
            <div class="modal fade" id="phoneModal" tabindex="-1" aria-labelledby="phoneModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="phoneModalLabel">전화번호 변경</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- 숨겨진 사용자 ID 필드 -->
                            <input type="hidden" id="id" value="${m.id}" name="id" />
                            <input class="form-control mt-2" id="phone" type="text" name="phone" placeholder="새 전화번호"/>
                            <div class="invalid-feedback mt-2">중복된 번호 또는 형식 오류. 숫자, 하이픈을 포함할 수 있으며, 형식은 3-3-4 혹은 3-4-4여야 합니다.</div>
                            <div class="valid-feedback mt-2">변경 가능한 전화번호입니다.</div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="button" id="updatePhoneButton" class="btn btn-primary" disabled>수정</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 이메일 변경 모달 -->
            <div class="modal fade" id="emailModal" tabindex="-1" aria-labelledby="emailModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="emailModalLabel">이메일 변경</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- 숨겨진 사용자 ID 필드 -->
                            <input type="hidden" id="id" value="${m.id}" name="id" />
                            <input class="form-control mt-2" id="email" type="email" name="email" placeholder="새 이메일"/>
                            <div class="invalid-feedback mt-2">중복 이메일 또는 이메일 형식이 올바르지 않거나 길이가 6자에서 50자 사이여야 합니다.</div>
                            <div class="valid-feedback mt-2">변경 가능한 이메일입니다.</div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button id="updateEmailButton" type="button" class="btn btn-primary" disabled>수정</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 자기소개 변경 모달 -->
            <div class="modal fade" id="introductionModal" tabindex="-1" aria-labelledby="introductionModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="introductionModalLabel">자기소개 변경</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- 숨겨진 사용자 ID 필드 -->
                            <input type="hidden" id="usersIdInput" value="${m.usersId}"/>
                            <textarea class="form-control mt-2" id="introduction" name="introduction" placeholder="새 자기소개" rows="5"></textarea>
                            <div id="charCount" class="mt-2 text-end">0 / 200</div>
                            <div class="invalid-feedback mt-2">자기소개는 200자 이내로 작성해야 합니다.</div>
                            <div class="valid-feedback mt-2"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button id="updateIntroductionButton" type="button" class="btn btn-primary" >수정</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 탈퇴 모달 -->
            <!-- 모달 창: 회원 탈퇴를 위한 모달 창 -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">회원 탈퇴</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="deleteForm">
                    <!-- 비밀번호 입력 필드 -->
                    <div class="form-group">
                        <div class="input-group">
                            <input type="password" class="form-control mt-1 mb-1" id="password" placeholder="비밀번호" required>
                            <!-- 비밀번호 표시/숨김 버튼 -->
                            <div class="input-group-append mt-1 mb-1">
                                <button class="btn btn-outline-secondary toggle-password" type="button">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <!-- 비밀번호 확인 입력 필드 -->
                    <div class="form-group">
                        <div class="input-group">
                            <input type="password" class="form-control mt-3" id="confirmPassword" placeholder="비밀번호 확인" required>
                            <!-- 비밀번호 표시/숨김 버튼 -->
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary toggle-password mt-3"  type="button">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                        </div>
                        <!-- 비밀번호 일치 및 불일치 피드백 -->
                        <div class="invalid-feedback mt-2" id="invalid-feedback"></div>
                        <div class="valid-feedback mt-2" id="valid-feedback"></div>
                    </div>
                    <!-- 사용자의 ID를 저장하는 숨김 필드 -->
                    <input type="hidden" id="usersIdDelete" value="${m.usersId}"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-danger" id="confirmDelete" disabled>탈퇴</button>
            </div>
        </div>
    </div>
</div>
            
            <!-- 모달 끝 -->
        </main>
    </div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>



<!-- 눈알 -->
<script>
    function togglePasswordVisibility(passwordFieldId, toggleIcon) {
        const passwordField = document.getElementById(passwordFieldId);
        const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordField.setAttribute('type', type);
        toggleIcon.classList.toggle('fa-eye');
        toggleIcon.classList.toggle('fa-eye-slash');
    }

    document.addEventListener('DOMContentLoaded', function () {
        const togglePassword = document.getElementById('togglePassword');
        const togglePassword2 = document.getElementById('togglePassword2');

        togglePassword.addEventListener('click', function () {
            togglePasswordVisibility('modalPassword', this.querySelector('i'));
        });

        togglePassword2.addEventListener('click', function () {
            togglePasswordVisibility('modalPassword2', this.querySelector('i'));
        });
    });
</script>
<!-- 눈알 -->
<!-- JavaScript 코드 추가 -->
<c:url var="mypage" value="/js/community_mypage.js" />
<script src="${mypage}"></script>

<!-- 미리보기 -->
<script>
//프로필 미리 보기
// 파일 입력 필드의 change 이벤트 리스너 등록
 document.getElementById('profileImage').addEventListener('change', function () {
     const input = this; // input 요소를 가리킴
     if (input.files && input.files[0]) { // 파일이 선택된 경우
         const reader = new FileReader(); // FileReader 객체 생성
         reader.onload = function (e) { // 파일이 로드된 경우 실행
             const previewImage = document.getElementById('previewImage'); // 미리보기 이미지 요소
             previewImage.src = e.target.result; // 미리보기 이미지의 src를 선택된 파일로 설정
             previewImage.style.display = 'block'; // 미리보기 이미지를 표시
         };
         reader.readAsDataURL(input.files[0]); // 파일을 읽고 base64 데이터 URL로 변환
     }
 });
</script>
<!-- test -->
<script>
document.getElementById('userDelete').addEventListener('click', function() {
    // 사용자에게 탈퇴 확인 메시지 표시
    if (confirm('정말로 탈퇴하시겠습니까?')) {
        // Vanilla JavaScript를 사용하여 모달 창을 표시
        var deleteModalElement = document.getElementById('deleteModal');
        var deleteModal = new bootstrap.Modal(deleteModalElement);
        deleteModal.show();
    }
});

// 비밀번호 표시/숨김 기능
document.querySelectorAll('.toggle-password').forEach(button => {
    button.addEventListener('click', function() {
        const input = this.parentElement.previousElementSibling; // 비밀번호 입력 필드
        const icon = this.querySelector('i'); // 아이콘 요소
        // 비밀번호 입력 필드의 타입을 변경하여 비밀번호 표시/숨김 토글
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.remove('fa-eye'); // 눈 아이콘 클래스 제거
            icon.classList.add('fa-eye-slash'); // 눈 슬래시 아이콘 클래스 추가
        } else {
            input.type = 'password';
            icon.classList.remove('fa-eye-slash'); // 눈 슬래시 아이콘 클래스 제거
            icon.classList.add('fa-eye'); // 눈 아이콘 클래스 추가
        }
    });
});

// 비밀번호 일치 여부 검사
const passwordInput = document.getElementById('password'); // 비밀번호 입력 필드
const confirmPasswordInput = document.getElementById('confirmPassword'); // 비밀번호 확인 입력 필드
const invalidFeedback = document.getElementById('invalid-feedback'); // 비밀번호 불일치 피드백 요소
const validFeedback = document.getElementById('valid-feedback'); // 비밀번호 일치 피드백 요소
const confirmDeleteButton = document.getElementById('confirmDelete'); // 탈퇴 버튼

// 비밀번호 조건 확인 함수
function validatePassword() {
    const password = passwordInput.value;
    
    if (password.length > 0) {
        passwordInput.classList.remove('is-invalid');
        passwordInput.classList.add('is-valid');
        confirmPasswordInput.disabled = false; // 비밀번호가 입력되면 비밀번호 확인 필드 활성화
        return true;
    } else {
        passwordInput.classList.remove('is-valid');
        passwordInput.classList.add('is-invalid');
        confirmPasswordInput.disabled = true; // 비밀번호가 입력되지 않으면 비밀번호 확인 필드 비활성화
        confirmDeleteButton.disabled = true; // 탈퇴 버튼 비활성화
        return false;
    }
}

// 비밀번호 확인 필드의 값이 변경될 때마다 일치 여부 검사
function checkPasswordMatch() {
    if (passwordInput.value === confirmPasswordInput.value && passwordInput.value.length > 0) {
        confirmPasswordInput.classList.remove('is-invalid'); // 불일치 클래스 제거
        confirmPasswordInput.classList.add('is-valid'); // 일치 클래스 추가
        invalidFeedback.style.display = 'none'; // 불일치 피드백 숨김
        validFeedback.style.display = 'block'; // 일치 피드백 표시
        confirmDeleteButton.disabled = false; // 탈퇴 버튼 활성화
    } else {
        confirmPasswordInput.classList.add('is-invalid'); // 불일치 클래스 추가
        confirmPasswordInput.classList.remove('is-valid'); // 일치 클래스 제거
        invalidFeedback.style.display = 'block'; // 불일치 피드백 표시
        validFeedback.style.display = 'none'; // 일치 피드백 숨김
        confirmDeleteButton.disabled = true; // 탈퇴 버튼 비활성화
    }
}

// 비밀번호 입력 필드의 값이 변경될 때마다 비밀번호 조건 검사
passwordInput.addEventListener('input', function() {
    validatePassword();
    checkPasswordMatch(); // 비밀번호 조건 검사가 끝난 후 비밀번호 일치 여부 검사
});

// 비밀번호 확인 입력 필드의 값이 변경될 때마다 비밀번호 일치 여부 검사
confirmPasswordInput.addEventListener('input', checkPasswordMatch);

// 초기 상태에서 탈퇴 버튼 비활성화
confirmDeleteButton.disabled = true;
confirmPasswordInput.disabled = true;
</script>

<script>
//탈퇴 버튼 클릭 이벤트 리스너
confirmDeleteButton.addEventListener('click', function () {
    const usersId = document.getElementById('usersIdDelete').value; // 사용자 ID 가져오기
    const passwordHash = passwordInput.value; // 비밀번호 가져오기
    const data = { usersId: usersId, passwordHash: passwordHash };
    // Axios를 사용하여 서버로 요청 전송
    axios.post('/audiro/mypage/delete',data)
        .then(function (response) {
            // 서버 응답이 성공적일 때
            if (response.data === "Y") {
                alert('회원 탈퇴가 성공적으로 처리되었습니다.');
                window.location.href = "<%= request.getContextPath() %>/"; // 탈퇴 후 리다이렉션할 페이지
            } else if(response.data === "N") {
                alert('비밀번호가 일치하지 않습니다. 다시 시도해 주세요.');
            } else if(response.data === "NN") {
            	 alert('비정상적인 접근입니다.');
            } else {
            	alert('회원 탈퇴 중 오류가 발생했습니다. 다시 시도해 주세요.');
            }
        })
        .catch(function (error) {
            console.error('회원 탈퇴 중 오류가 발생했습니다:', error);
            alert('회원 탈퇴 중 오류가 발생했습니다. 다시 시도해 주세요.');
        });
});
</script>


<!-- test끝 -->
</body>
</html>