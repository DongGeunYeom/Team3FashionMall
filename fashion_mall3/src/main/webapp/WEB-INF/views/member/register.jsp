<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/login.css" />
</head>
<body>
	<div class="container center-contents">
		<div class="row">
			<form method="post" class="form-signin">
				<h1 class="h2 mb-3 font-weight-normal">회원가입</h1>
				
				<div class="form-group">
					<label for="userid" class="sr-only">아이디</label>
					<input type="text" id="userid" name="userid" class="form-control" placeholder="아이디를 입력해주세요" required autofocus/>
				</div>
				
				<div class="form-group">
					<label for="password" class="sr-only">비밀번호</label>
					<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력해주세요" required/>
				</div>
				
				<div class="form-group">
					<label for="email" class="sr-only">이메일</label>
					<input type="email" id="email" name="email" class="form-control" placeholder="이메일을 입력해주세요" required/>
				</div>
				
				<button class="btn btn-lg btn-primary btn-block" type="submit">회원가입</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
	</div>
</body>
</html>