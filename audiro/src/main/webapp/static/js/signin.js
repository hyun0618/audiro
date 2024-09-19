/**
 * signin.jsp 파일에 포함
 */

document.addEventListener('DOMContentLoaded', function() {
    const inputId = document.querySelector('input#id');
    const chkSaveId = document.querySelector('input#chkSaveId');
    const btnSignin = document.querySelector('input#btnSignin');
    
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('result') === 'f') {
        alert('아이디 또는 비밀번호가 일치하지 않습니다.');
    }
    
    btnSignin.addEventListener('click', function() {
        
        if (chkSaveId.checked) {
            let expirationDate = new Date();
            expirationDate.setMonth(expirationDate.getMonth() + 1);
            
            const expires = expirationDate.toUTCString();
            
            document.cookie = `savedId=${inputId.value}; expires=${expires}`;
        } else {
            let pastDate = new Date();
            pastDate.setFullYear(pastDate.getFullYear() - 1);
            
            const expires = pastDate.toUTCString();
            
            document.cookie = `savedId=${inputId.value}; expires=${expires}`;
        }
    });
    
    function setSavedId() {
        const cookies = document.cookie.split(';');
        
        for (let cookie of cookies) {
            const parts = cookie.split('=');
            const name = parts[0].trim();
            const value = parts[1];
            
            if (name === 'savedId') {
                inputId.value = value;
                chkSaveId.checked = true;
                break;
            }
        }
    };
    
    setSavedId();
})