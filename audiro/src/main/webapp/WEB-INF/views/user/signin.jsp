<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri = "jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
    <c:url var="header2Css" value="/css/header2.css" />
    <link href="${header2Css}" rel="stylesheet" />
    <c:url var="signinCss" value="/css/signin.css" />
    <link href="${signinCss}" rel="stylesheet" />
</head>
<body>

    <div class="container">
        <header>
            <%@ include file="../fragments/header2.jspf" %>
        </header>
    
        <main>
            <div class="card card-body mx-auto">
                <form method="post">
                    <input type="text" class="form-control" id="id" name="id" placeholder="아이디" required />
                    <input type="password" class="form-control" id="password" name="passwordHash" placeholder="비밀번호" required />
                    <input type="submit" class="form-control btn btn-dark" id="btnSignin" value="로그인" />
                    <div>
                        <input type="checkbox" id="chkSaveId" />
                        <label for="chkSaveId">아이디 저장</label>
                    </div>
                </form>
            </div>
            <div class="container-link">
                <a href="/audiro/user/signup">회원가입</a>
            </div>
        </main>
        
        <footer>
            <%@ include file="../fragments/footer.jspf" %>
        </footer>  
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    
    <c:url var="signinJs" value="/js/signin.js" />
    <script src="${signinJs}"></script>
</body>
</html>