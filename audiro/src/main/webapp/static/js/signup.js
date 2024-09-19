/**
 * signup.jsp 파일에 포함
 */

document.addEventListener('DOMContentLoaded', () => {
    let isIdChecked = false;
    let isPasswordChecked = false;
    let isUserNameChecked = false;
    let isNicknameChecked = false;
    let isPhoneChecked = false;
    let isEmailChecked = false;
    
    const inputId = document.querySelector('input#id');
    inputId.addEventListener('change', checkId);
    
    const inputPassword = document.querySelector('input#password');
    const inputConfirmPassword = document.querySelector('input#confirmPassword');
    inputPassword.addEventListener('change', checkPassword);
    inputConfirmPassword.addEventListener('change', checkPassword);
    
    const inputUsername = document.querySelector('input#username');
    inputUsername.addEventListener('change', checkUsername);
    
    const inputNickname = document.querySelector('input#nickname');
    inputNickname.addEventListener('change', checkNickname);
    
    const inputPhone = document.querySelector('input#phone');
    inputPhone.addEventListener('change', checkPhone);
    
    const inputEmail = document.querySelector('input#email');
    inputEmail.addEventListener('change', checkEmail);
    
    function changeButtonState() {
        const btnSignUp = document.querySelector('button#btnSignUp');
        
        if (isIdChecked && isPasswordChecked && isUserNameChecked
            && isNicknameChecked && isPhoneChecked & isEmailChecked) {
            
            btnSignUp.classList.remove('disabled');
        } else {
            btnSignUp.classList.add('disabled');
        }
    }
    
    function checkId(event) {
        const id = event.target.value;
		const icon = inputId.nextElementSibling;
        const checkIdResult = document.querySelector('div#checkIdResult');
        const idRegex = /^[a-zA-Z0-9._]{5,15}$/;
        
        if (!idRegex.test(id)) {
            isIdChecked = false;
            checkIdResult.innerHTML = '영문자, 숫자, 밑줄 및 점을 포함할 수 있으며, 길이가 5자에서 15자 사이여야 합니다.';
			icon.classList.add("d-none");
			changeButtonState();
            return;
        }
        
        const uri = `../api/user/check-id?id=${id}`;
        
        axios
        .get(uri)
        .then((response) => {
            
            if (response.data === 'Y') {
                isIdChecked = true;
                checkIdResult.innerHTML = '';
				icon.classList.remove("d-none");
            } else {
                isIdChecked = false;
                checkIdResult.innerHTML = '사용할 수 없는 아이디입니다.';
				icon.classList.add("d-none");
            }
            
            changeButtonState();
        })
        .catch((error) => {
            console.log(error);
        })
    }
    
    function checkPassword() {
        const password = inputPassword.value;
        const confirmPassword = inputConfirmPassword.value;
		const icon = inputPassword.nextElementSibling;
        const checkPasswordResult = document.querySelector('div#checkPasswordResult');
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/;
        
		if (!passwordRegex.test(password)) {
		    isPasswordChecked = false;
		    checkPasswordResult.innerHTML = '최소 8자 이상이며, 소문자, 대문자, 숫자, 특수문자가 각각 하나 이상 포함되어야 합니다.';
			icon.classList.add("d-none");
			changeButtonState();
		    return;
		} else {
			checkPasswordResult.innerHTML = '';
		}
        
        if (password === confirmPassword) {
            isPasswordChecked = true;
            checkPasswordResult.innerHTML = '';
			icon.classList.remove("d-none");
        } else {
            isPasswordChecked = false;
            checkPasswordResult.innerHTML = '비밀번호가 일치하지 않습니다.';
			icon.classList.add("d-none");
        }
        
        changeButtonState();
    }
    
    function checkUsername(event) {
        const username = event.target.value;
		const icon = inputUsername.nextElementSibling;
        const checkUsernameResult = document.querySelector('div#checkUsernameResult');
        const usernameRegexKo = /^[가-힣]{2,30}$/;
        const usernameRegexEn = /^[a-zA-Z]{2,30}$/;
        
        if (usernameRegexKo.test(username) || usernameRegexEn.test(username)) {
            isUserNameChecked = true;
            checkUsernameResult.innerHTML = '';
			icon.classList.remove("d-none");
        } else {
            isUserNameChecked = false;
            checkUsernameResult.innerHTML = '한글 이름은 길이가 2자에서 30자 사이의 한글로, 영문 이름은 2자에서 30자 사이의 영문자로 구성되어야 합니다.';
			icon.classList.add("d-none");
        }
        
        changeButtonState();
        
    }
    
    function checkNickname(event) {
        const nickname = event.target.value;
		const icon = inputNickname.nextElementSibling;
        const checkNicknameResult = document.querySelector('div#checkNicknameResult');
        const nicknameRegex = /^[a-zA-Z0-9가-힣._]{1,15}$/;

        if (!nicknameRegex.test(nickname)) {
            isNicknameChecked = false;
            checkNicknameResult.innerHTML = '영문자, 숫자, 한글, 밑줄 및 점을 포함할 수 있으며, 길이가 1자에서 15자 사이여야 합니다.';
			icon.classList.add("d-none");
            changeButtonState();
            return;
        }

        const uri = `../api/user/check-nickname?nickname=${nickname}`;
        
        axios
        .get(uri)
        .then((response) => {
            if (response.data === 'Y') {
                isNicknameChecked = true;
                checkNicknameResult.innerHTML = '';
				icon.classList.remove("d-none");
            } else {
                isNicknameChecked = false;
                checkNicknameResult.innerHTML = '사용할 수 없는 닉네임입니다.';
                icon.classList.add("d-none");
            }
            
            changeButtonState();
        })
        .catch((error) => {
            console.log(error);
        })
    }
    
    function checkPhone(event) {
        let phone = event.target.value.replace(/\D/g, '');
		const icon = inputPhone.nextElementSibling;
        const checkPhoneResult = document.querySelector('div#checkPhoneResult');
        const phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;
        
        if (phone.length === 10) {
            phone = phone.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
            inputPhone.value = phone;
        } else if (phone.length === 11) {
            phone = phone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
            inputPhone.value = phone;
        }     
        
        if (!phoneRegex.test(phone)) {
            isPhoneChecked = false;
            checkPhoneResult.innerHTML = '숫자, 하이픈을 포함할 수 있으며, 길이는 3-3-4 혹은 3-4-4이어야 합니다.';
			icon.classList.add("d-none");
            changeButtonState();
            return;
        }
        
        const uri = `../api/user/check-phone?phone=${phone}`;
        
        axios
        .get(uri)
        .then((response) => {            
            if (response.data === 'Y') {
                isPhoneChecked = true;
                checkPhoneResult.innerHTML = ''
				icon.classList.remove("d-none");
            } else {
                isPhoneChecked = false;
                checkPhoneResult.innerHTML = '사용할 수 없는 전화번호입니다.'
                icon.classList.add("d-none");
            }
            
            changeButtonState();
        })
        .catch((error) => {
            console.log(error);
        })
    }
    
    function checkEmail(event) {
        const email = event.target.value;
		const icon = inputEmail.nextElementSibling;
        const checkEmailResult = document.querySelector('div#checkEmailResult');
        const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        
        // 이메일 정규 표현식은 전체 문자열의 길이를 제한할 수 없음
        if (email.length < 6 || email.length > 50) {
            isEmailChecked = false;
            checkEmailResult.innerHTML = '길이는 6자에서 50자 사이여야 합니다.';
            icon.classList.add("d-none");
            changeButtonState();
            return;
        }
        
        if (!emailRegex.test(email)) {
            isEmailChecked = false;
            checkEmailResult.innerHTML = '이메일 형식을 확인하세요.';
            icon.classList.add("d-none");
            changeButtonState();
            return;
        }
        
        const uri = `../api/user/check-email?email=${email}`;
        
        axios
        .get(uri)
        .then((response) => {
            if (response.data === 'Y') {
                isEmailChecked = true;
                checkEmailResult.innerHTML = '';
                icon.classList.remove("d-none");
            } else {
                isEmailChecked = false;
                checkEmailResult.innerHTML = '사용할 수 없는 이메일입니다.';
                icon.classList.add("d-none");
            }
            
            changeButtonState();
        })
        .catch((error) => {
            console.log(error);
        })
    }
})