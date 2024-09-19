/**
 * mypage/mypage.jsp에 포함
 */
//포함 되었는 지 확인해 봄 
console.log("ok");
//비밀번호 변경
document.addEventListener('DOMContentLoaded', function () {
    const id = document.getElementById('id').value;
    const passwordHashInput = document.getElementById('modalPassword');
    const password2 = document.getElementById('modalPassword2');
    const submitButton = document.getElementById('submitButton');

    // 비밀번호 조건 확인 함수
    function validatePassword() {
        const passwordHash = passwordHashInput.value;
        const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

        if (regex.test(passwordHash)) {
            passwordHashInput.classList.remove('is-invalid');
            passwordHashInput.classList.add('is-valid');
            password2.disabled = false; // 조건이 충족되면 확인 필드 활성화
            return true;
        } else {
            passwordHashInput.classList.remove('is-valid');
            passwordHashInput.classList.add('is-invalid');
            password2.disabled = true; // 조건이 충족되지 않으면 확인 필드 비활성화
            return false;
        }
    }

    // 비밀번호 확인 필드에 입력 이벤트 리스너 추가
    function checkPasswordMatch() {
        if (passwordHashInput.value === password2.value) {
            password2.classList.remove('is-invalid');
            password2.classList.add('is-valid');
            if (validatePassword()) {
                submitButton.disabled = false; // 조건과 일치하면 수정 버튼 활성화
            }
        } else {
            password2.classList.remove('is-valid');
            password2.classList.add('is-invalid');
            submitButton.disabled = true; // 일치하지 않으면 수정 버튼 비활성화
        }
    }

    // 새 비밀번호 필드에 입력 이벤트 리스너 추가
    passwordHashInput.addEventListener('input', function () {
        validatePassword();
    });

    // 비밀번호 확인 필드에 입력 이벤트 리스너 추가
    password2.addEventListener('input', checkPasswordMatch);

    // 수정 버튼 클릭 이벤트 리스너 추가
    submitButton.addEventListener('click', function () {
        const passwordHash = passwordHashInput.value;
        const data = {
            id: id,
            passwordHash: passwordHash
        };
        console.log(data);
        if (validatePassword() && passwordHash === password2.value) {
            // 비밀번호 조건과 일치 여부가 모두 충족되면 Axios 요청 보내기
            axios.post('/audiro/mypage/updatePassword', data)
            .then(function (response) {
                console.log(response.data);
                // 요청이 성공했을 때 처리할 내용
                alert('비밀번호가 성공적으로 변경되었습니다.');
                var passwordModalElement = document.getElementById('passwordModal');
                var passwordModal = bootstrap.Modal.getOrCreateInstance(passwordModalElement);
                passwordModal.hide();
                // 모달 닫힌 후 초기화
                passwordModalElement.addEventListener('hidden.bs.modal', function () {
                    // 모달 초기화 코드
                    passwordHashInput.value = '';
                    password2.value = '';
                    passwordHashInput.classList.remove('is-valid', 'is-invalid');
                    password2.classList.remove('is-valid', 'is-invalid');
                    submitButton.disabled = true;

                    // 모달 관련 요소 재설정
                    passwordModalElement.classList.remove('show');
                    passwordModalElement.style.display = 'none';
                    document.body.classList.remove('modal-open');
                    document.body.style.overflow = 'auto';
                    var backdrop = document.querySelector('.modal-backdrop');
                    if (backdrop) {
                        backdrop.remove();
                    }
                }, { once: true });                
                
            })
            .catch(function (error) {
                // 요청이 실패했을 때 처리할 내용
                console.error(error); // 콘솔에 오류 메시지 출력
                alert('비밀번호 변경 중 오류가 발생했습니다. 다시 시도해 주세요.');
            });
        }
    });
});




//이름 변경
    document.addEventListener('DOMContentLoaded', function () {
        // 이름 입력 필드와 수정 버튼 요소를 가져옵니다.
        const userNameInput = document.getElementById('userName');
        const updateNameButton = document.getElementById('updateNameButton');
        const id = document.getElementById('id').value;
        // 이름 유효성 검사 함수
        function validateUserName() {
            const userName = userNameInput.value;
            // 한글 이름: 2자에서 30자 사이
            const koreanRegex = /^[가-힣]{2,30}$/;
            // 영문 이름: 2자에서 30자 사이
            const englishRegex = /^[A-Za-z]{2,30}$/;

            // 이름이 한글 또는 영문 조건을 만족하는지 검사
            if (koreanRegex.test(userName) || englishRegex.test(userName)) {
                // 조건을 만족하면 유효성 클래스를 설정하고 버튼을 활성화
                userNameInput.classList.remove('is-invalid');
                userNameInput.classList.add('is-valid');
                updateNameButton.disabled = false;
                return true;
            } else {
                // 조건을 만족하지 않으면 유효성 클래스를 설정하고 버튼을 비활성화
                userNameInput.classList.remove('is-valid');
                userNameInput.classList.add('is-invalid');
                updateNameButton.disabled = true;
                return false;
            }
        }

        // 입력 필드의 내용이 변경될 때마다 유효성 검사를 수행
        userNameInput.addEventListener('input', validateUserName);

        // 수정 버튼 클릭 시 이름을 서버로 전송
        updateNameButton.addEventListener('click', function () {
            // 유효성 검사가 통과되면
            if (validateUserName()) {
                const userName = userNameInput.value;
                const data = {
                        id: id,
                        userName: userName
                    };
                // Axios를 사용하여 서버로 POST 요청을 보냄
                axios.post('/audiro/mypage/updateUserName', data)
                .then(function (response) {
                    console.log(response.data);
                    // 요청이 성공했을 때 처리할 내용
                    alert('이름이 성공적으로 변경되었습니다.');
                    location.reload(); //->새로고침
                })
                .catch(function (error) {
                    // 요청 중 오류가 발생하면 오류 메시지를 표시
                    console.error('이름 변경 중 오류가 발생했습니다:', error);
                    alert('이름 변경 중 오류가 발생했습니다. 다시 시도해 주세요.');
                });
            }
        });
    });
    
    
    
    
//닉네임 변경 ->입력할 때 중복검사 필요함

document.addEventListener('DOMContentLoaded', function () {
    // 닉네임 입력 필드와 수정 버튼 요소를 가져옴
    const nicknameInput = document.getElementById('nickname');
    const updateNicknameButton = document.getElementById('updateNicknameButton');

    // 닉네임 유효성 검사 함수
    function validateNickname() {
        // 닉네임 입력 값 가져옴
        const nickname = nicknameInput.value;
        // 닉네임 유효성 검사 정규표현식: 영문자, 숫자, 한글, 밑줄 및 점을 포함할 수 있으며, 길이가 1자에서 15자 사이
        const nicknameRegex = /^[a-zA-Z0-9가-힣._]{1,15}$/;

        // 정규표현식을 통과하면
        if (nicknameRegex.test(nickname)) {
            return true;
        } else {
            // 유효성 클래스 설정 및 수정 버튼 비활성화
            nicknameInput.classList.remove('is-valid');
            nicknameInput.classList.add('is-invalid');
            updateNicknameButton.disabled = true;
            return false;
        }
    }

    // 닉네임 중복 검사 함수
    function checkNicknameDuplicate() {
        // 닉네임이 유효하지 않으면 중복 검사 중단
        if (!validateNickname()) {
            return;
        }

        // 닉네임 입력 값 가져옴
        const nickname = nicknameInput.value;
        const data = { nickname: nickname };
        // Axios를 사용하여 서버에 중복 검사 요청
        axios.post('/audiro/mypage/checkNickname', data)
            .then(function (response) {
                // 중복 검사 결과 처리
                if (response.data === "N") {
                    // 닉네임이 이미 존재하면 유효성 클래스 설정 및 수정 버튼 비활성화
                    nicknameInput.classList.remove('is-valid');
                    nicknameInput.classList.add('is-invalid');
                    updateNicknameButton.disabled = true;
                } else if (response.data === "Y") {
                    // 닉네임이 중복되지 않으면 유효성 클래스 설정 및 수정 버튼 활성화
                    nicknameInput.classList.remove('is-invalid');
                    nicknameInput.classList.add('is-valid');
                    updateNicknameButton.disabled = false;
                }
            })
            .catch(function (error) {
                // 중복 검사 중 오류가 발생한 경우 콘솔에 오류 메시지 출력
                console.error('닉네임 중복 검사 중 오류가 발생했습니다:', error);
            });
    }

    // 입력 필드의 내용이 변경될 때마다 유효성 검사 및 중복 검사를 수행
    nicknameInput.addEventListener('input', checkNicknameDuplicate);
    
    // 수정 버튼 클릭 시 닉네임을 서버로 전송
    updateNicknameButton.addEventListener('click', function () {
        if (validateNickname()) {
            const id = document.getElementById('id').value;
            const nickname = nicknameInput.value;
            const data = { id: id, nickname: nickname };
            axios.post('/audiro/mypage/updateNickname', data)
                .then(function (response) {
                    console.log('서버 응답:', response.data);
                    // 요청이 성공했을 때 처리할 내용
                    alert('닉네임이 성공적으로 변경되었습니다.');
                    location.reload(); // 페이지 새로고침
                })
                .catch(function (error) {
                    console.error('닉네임 변경 중 오류가 발생했습니다:', error);
                    alert('닉네임 변경 중 오류가 발생했습니다. 다시 시도해 주세요.');
                });
        }
    });
});



// 전화번호 변경

document.addEventListener('DOMContentLoaded', function () {
    // 전화번호 입력 필드와 수정 버튼 요소를 가져옴
    const phoneInput = document.getElementById('phone');
    const updatePhoneButton = document.getElementById('updatePhoneButton');
    const id = document.getElementById('id').value;

    // 전화번호 유효성 검사 함수
    function validatePhone(event) {
        // 입력된 전화번호에서 숫자 이외의 모든 문자를 제거
        let phone = event.target.value.replace(/\D/g, '');
        const phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;

        // 전화번호 길이에 따라 형식을 설정
        if (phone.length === 10) {
            // 전화번호가 10자리인 경우 3-3-4 형식으로 설정
            phone = phone.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
            phoneInput.value = phone;
        } else if (phone.length === 11) {
            // 전화번호가 11자리인 경우 3-4-4 형식으로 설정
            phone = phone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
            phoneInput.value = phone;
        }

        // 전화번호 유효성을 검사하고, 유효성 클래스 설정 및 수정 버튼 활성화/비활성화
        if (phoneRegex.test(phone)) {
            phoneInput.classList.remove('is-invalid');
            phoneInput.classList.add('is-valid');
            updatePhoneButton.disabled = false;
            // 전화번호 유효성 검사가 통과되면 중복 검사 수행
            checkPhoneDuplicate(phone);
        } else {
            phoneInput.classList.remove('is-valid');
            phoneInput.classList.add('is-invalid');
            updatePhoneButton.disabled = true;
        }
    }

    // 전화번호 중복 검사 함수
    function checkPhoneDuplicate(phone) {
        const data = { phone: phone };
        // Axios를 사용하여 서버에 중복 검사 요청
        axios.post('/audiro/mypage/checkPhone', data)
            .then(function (response) {
                // 중복 검사 결과 처리
                if (response.data === "N") {
                    // 전화번호가 이미 존재하면 유효성 클래스 설정 및 수정 버튼 비활성화
                    phoneInput.classList.remove('is-valid');
                    phoneInput.classList.add('is-invalid');
                    updatePhoneButton.disabled = true;
                } else if (response.data === "Y") {
                    // 전화번호가 중복되지 않으면 유효성 클래스 설정 및 수정 버튼 활성화
                    phoneInput.classList.remove('is-invalid');
                    phoneInput.classList.add('is-valid');
                    updatePhoneButton.disabled = false;
                }
            })
            .catch(function (error) {
                // 중복 검사 중 오류가 발생한 경우 콘솔에 오류 메시지 출력
                console.error('전화번호 중복 검사 중 오류가 발생했습니다:', error);
            });
    }

    // 입력 필드의 내용이 변경될 때마다 유효성 검사 수행
    phoneInput.addEventListener('input', validatePhone);

    // 수정 버튼 클릭 시 전화번호를 서버로 전송
    updatePhoneButton.addEventListener('click', function () {
        // 유효한 경우, 입력된 전화번호 값을 가져옴
        const phone = phoneInput.value;
        // 전송할 데이터를 객체 형태로 생성
        const data = { id: id, phone: phone };

        // Axios를 사용하여 서버에 전화번호 업데이트 요청
        axios.post('/audiro/mypage/updatePhone', data)
            .then(function (response) {
                // 서버 응답을 콘솔에 출력
                console.log('서버 응답:', response.data);
                // 요청이 성공했을 때 처리할 내용
                alert('전화번호가 성공적으로 변경되었습니다.');
                // 페이지 새로고침
                location.reload();
            })
            .catch(function (error) {
                // 전화번호 변경 중 오류가 발생한 경우 콘솔에 오류 메시지 출력
                console.error('전화번호 변경 중 오류가 발생했습니다:', error);
                // 오류 메시지를 사용자에게 표시
                alert('전화번호 변경 중 오류가 발생했습니다. 다시 시도해 주세요.');
            });
    });
});

//이메일 변경

document.addEventListener('DOMContentLoaded', function () {
    // 이메일 입력 필드와 수정 버튼 요소를 가져옴
    const emailInput = document.getElementById('email');
    const updateEmailButton = document.getElementById('updateEmailButton');
    const id = document.getElementById('id').value;

    // 이메일 유효성 검사 함수
    function validateEmail(event) {
        // 이메일 입력 값 가져옴
        const email = event.target.value;
        // 이메일 유효성 검사 정규표현식과 길이 조건
        const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        const isValid = emailRegex.test(email) && email.length >= 6 && email.length <= 50;

        // 유효성을 검사하고, 유효성 클래스 설정 및 수정 버튼 활성화/비활성화
        if (isValid) {
            emailInput.classList.remove('is-invalid');
            emailInput.classList.add('is-valid');
            checkEmailDuplicate(email);
        } else {
            emailInput.classList.remove('is-valid');
            emailInput.classList.add('is-invalid');
            updateEmailButton.disabled = true;
        }
    }

    // 이메일 중복 검사 함수
    function checkEmailDuplicate(email) {
        const data = { email: email };
        // Axios를 사용하여 서버에 중복 검사 요청
        axios.post('/audiro/mypage/checkEmail', data)
            .then(function (response) {
                // 중복 검사 결과 처리
                if (response.data === "N") {
                    // 이메일이 이미 존재하면 유효성 클래스 설정 및 수정 버튼 비활성화
                    emailInput.classList.remove('is-valid');
                    emailInput.classList.add('is-invalid');
                    updateEmailButton.disabled = true;
                } else if (response.data === "Y") {
                    // 이메일이 중복되지 않으면 유효성 클래스 설정 및 수정 버튼 활성화
                    emailInput.classList.remove('is-invalid');
                    emailInput.classList.add('is-valid');
                    updateEmailButton.disabled = false;
                }
            })
            .catch(function (error) {
                // 중복 검사 중 오류가 발생한 경우 콘솔에 오류 메시지 출력
                console.error('이메일 중복 검사 중 오류가 발생했습니다:', error);
            });
    }

    // 입력 필드의 내용이 변경될 때마다 유효성 검사 수행
    emailInput.addEventListener('input', validateEmail);

    // 수정 버튼 클릭 시 이메일을 서버로 전송
    updateEmailButton.addEventListener('click', function () {
        // 유효한 경우, 입력된 이메일 값을 가져옴
        const email = emailInput.value;
        // 전송할 데이터를 객체 형태로 생성
        const data = { id: id, email: email };

        // Axios를 사용하여 서버에 이메일 업데이트 요청
        axios.post('/audiro/mypage/updateEmail', data)
            .then(function (response) {
                // 서버 응답을 콘솔에 출력
                console.log('서버 응답:', response.data);
                // 요청이 성공했을 때 처리할 내용
                alert('이메일이 성공적으로 변경되었습니다.');
                // 페이지 새로고침
                location.reload();
            })
            .catch(function (error) {
                // 이메일 변경 중 오류가 발생한 경우 콘솔에 오류 메시지 출력
                console.error('이메일 변경 중 오류가 발생했습니다:', error);
                // 오류 메시지를 사용자에게 표시
                alert('이메일 변경 중 오류가 발생했습니다. 다시 시도해 주세요.');
            });
    });
});


//자기소개 변경 -> 이건 프로필 테이블

document.addEventListener('DOMContentLoaded', function () {
    // 자기소개 입력 필드와 수정 버튼 요소를 가져옴
    const introductionInput = document.getElementById('introduction');
    const updateIntroductionButton = document.getElementById('updateIntroductionButton');
    const usersId = document.getElementById('usersIdInput').value;
    const charCount = document.getElementById('charCount');
    
    // 자기소개 유효성 검사 함수
    function validateIntroduction(event) {
        // 자기소개 입력 값 가져옴
        const introduction = event.target.value;
        // 자기소개 길이 검사 (200자 이하)
        const isValid = introduction.length <= 200;
        
        // 글자 수 표시 업데이트
        charCount.innerHTML = introduction.length + " / 200";
        
        // 글자 수가 200자를 초과하면 빨간색으로 표시
        if (introduction.length > 200) {
            charCount.style.color = "red";
        } else {
            charCount.style.color = "black";
        }

        // 유효성을 검사하고, 유효성 클래스 설정 및 수정 버튼 활성화/비활성화
        if (isValid) {
            introductionInput.classList.remove('is-invalid');
            introductionInput.classList.add('is-valid');
            updateIntroductionButton.disabled = false;
        } else {
            introductionInput.classList.remove('is-valid');
            introductionInput.classList.add('is-invalid');
            updateIntroductionButton.disabled = true;
        }
    }

    // 입력 필드의 내용이 변경될 때마다 유효성 검사 수행
    introductionInput.addEventListener('input', validateIntroduction);

    // 수정 버튼 클릭 시 자기소개를 서버로 전송
    updateIntroductionButton.addEventListener('click', function () {
        // 유효한 경우, 입력된 자기소개 값을 가져옴
        const introduction = introductionInput.value;
        // 전송할 데이터를 객체 형태로 생성
        const data = { usersId: usersId, introduction: introduction };

        // Axios를 사용하여 서버에 자기소개 업데이트 요청
        axios.post('/audiro/mypage/updateIntroduction', data)
            .then(function (response) {
                // 서버 응답을 콘솔에 출력
                console.log('서버 응답:', response.data);
                // 요청이 성공했을 때 처리할 내용
                alert('자기소개가 성공적으로 변경되었습니다.');
                // 페이지 새로고침
                location.reload();
            })
            .catch(function (error) {
                // 자기소개 변경 중 오류가 발생한 경우 콘솔에 오류 메시지 출력
                console.error('자기소개 변경 중 오류가 발생했습니다:', error);
                // 오류 메시지를 사용자에게 표시
                alert('자기소개 변경 중 오류가 발생했습니다. 다시 시도해 주세요.');
            });
    });
});

        
        
//프로필 변경
//폼 제출 이벤트 처리
document.getElementById('profileForm').addEventListener('submit', function (e) {
    e.preventDefault(); // 기본 폼 제출 동작 방지

    const formData = new FormData(); // FormData 객체 생성
    const profileImageInput = document.getElementById('profileImage'); // 파일 입력 필드 요소
    const usersIdInput = document.getElementById('usersId');
    formData.append('file', profileImageInput.files[0]); // 선택된 파일을 FormData에 추가
    formData.append('usersId', usersIdInput.value);

    // Axios를 사용하여 파일 업로드 요청 전송
    axios.post('/audiro/mypage/profile', formData, {
        headers: {
            'Content-Type': 'multipart/form-data' // 요청 헤더 설정
        }
    })
    .then(function (response) {
        if (response.data === "Y") {
            alert('프로필 이미지가 성공적으로 변경되었습니다.');
            location.reload();
        } else if (response.data === "N") {
            alert('변경 중 오류가 발생했습니다. 다시 시도해 주세요.');
        }
    })
    .catch(function (error) {
        console.error('프로필 변경 중 오류가 발생했습니다:', error);
    });
});

