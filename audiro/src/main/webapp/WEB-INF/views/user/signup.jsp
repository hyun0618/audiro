<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri = "jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" 
    	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
    	crossorigin="anonymous" referrerpolicy="no-referrer" />
    <c:url var="header2Css" value="/css/header2.css" />
    <link href="${header2Css}" rel="stylesheet" />
    <c:url var="signUpCss" value="/css/signup.css" />
    <link href="${signUpCss}" rel="stylesheet" />
</head>
<body>

    <div class="container">
        <header>
            <%@ include file="../fragments/header2.jspf" %>
        </header>
        
        <main>
            <div class="card card-body mx-auto">
                <c:url var="signUpPage" value="/user/signup"/>
                <form action="${signUpPage}" method="post">
                	<div class="input-container">
                		<input type="text" class="form-control" id="id" name="id" placeholder="아이디" required autofocus />
                    	<i class="fa-solid fa-check d-none" style="color: #4caf50;"></i>
                		<div id="checkIdResult" class="text-danger"></div>
                	</div>
                    <div class="input-container">
                    	<input type="password" class="form-control" id="password" name="passwordHash" placeholder="비밀번호" required />
                    	<i class="fa-solid fa-check d-none" style="color: #4caf50;"></i>
                    	<input type="password" class="form-control" id="confirmPassword" placeholder="비밀번호 확인" required />
                    	<div id="checkPasswordResult" class="text-danger"></div>
                    </div>
                    <div class="input-container">
                    	<input type="text" class="form-control" id="username" name="userName" placeholder="이름" required />
                    	<i class="fa-solid fa-check d-none" style="color: #4caf50;"></i>
                    	<div id="checkUsernameResult" class="text-danger"></div>
                    </div>
                    <div class="input-container">
                    	<input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임" required />
                   		<i class="fa-solid fa-check d-none" style="color: #4caf50;"></i>
                   		<div id="checkNicknameResult" class="text-danger"></div>
                    </div>
                    <div class="input-container">
                    	<input type="tel" class="form-control" id="phone" name="phone" placeholder="전화번호" required />
                    	<i class="fa-solid fa-check d-none" style="color: #4caf50;"></i>
                    	<div id="checkPhoneResult" class="text-danger"></div>
                    </div>
                    <div class="input-container">
                    	<input type="email" class="form-control" id="email" name="email" placeholder="이메일" required />
                    	<i class="fa-solid fa-check d-none" style="color: #4caf50;"></i>
                    	<div id="checkEmailResult" class="text-danger"></div>
                    </div>
                    <button class="form-control btn btn-dark disabled" id="btnSignUp">작성 완료</button>
                </form>
            </div>
        </main>
        
        <footer>
            <%@ include file="../fragments/footer.jspf" %>
        </footer>  
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    
    <c:url var="signUpJs" value="/js/signup.js" />
    <script src="${signUpJs}"></script>
</body>
</html>