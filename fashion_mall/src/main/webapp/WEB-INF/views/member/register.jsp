<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body>
	
    <form action="" method="POST">
      <h2>회원가입</h2>

      <!--아이디-->
      <div class="form-group">
        <label for="">아이디</label>
        <input
          type="text"
          name=""
          id=""
          placeholder="아이디 입력"
          size="20"
          required
          autofocus
        />
        <button type="button" class="btn btn-danger">중복 확인</button>
      </div>

      <!--비밀번호-->
      <div class="form-group">
        <label for="">비밀번호</label>
        <input
          type="password"
          name=""
          id=""
          placeholder="비밀번호 입력"
          size="20"
          required
          autofocus
        />
      </div>

      <!--비밀번호 확인-->
      <div class="form-group">
        <label for="">비밀번호 확인</label>
        <input
          type="password"
          name=""
          id=""
          placeholder="비밀번호 확인"
          size="20"
          required
          autofocus
        />
      </div>

      <!-- 이름 입력-->
      <div class="form-group">
        <label for="">이름</label>
        <input
          type="text"
          name=""
          id=""
          placeholder="이름 입력"
          size="5"
          required
          autofocus
        />
      </div>

      <!--주민등록번호-->
      <div class="form-group">
        <label for="">주민등록번호</label>
        <input
          type="text"
          name=""
          id=""
          placeholder="900101"
          size="15"
          maxlength="6"
          required
          autofocus
        />
        -
        <input
          type="password"
          name=""
          id=""
          size="15"
          maxlength="7"
          required
          autofocus
        />
      </div>

      <!--이메일-->
      <div class="form-group">
        <label for="">이메일</label>
        <input type="email" name="" id="" size="30" required />
      </div>

      <!--이메일-->
      <div class="form-group">
        <label for="">이메일</label>
        <input type="text" name="" id="email_id" maxlength="18" size="10" />
        @
        <input type="text" name="" id="email_domain" maxlength="18" size="10" />
        <select class="select" name="" id="" onclick="">
          <option value="">--선택--</option>
          <option value="naver.com">naver.com</option>
          <option value="daum.net">daum.net</option>
          <option value="gmail.com">gmail.com</option>
          <option value="hanmail.com">hanmail.com</option>
          <option value="nate.com">nate.com</option>
          <option value="yahoo.com">yahoo.com</option>
        </select>
      </div>

      <!--이용약관
          - 스크롤바
          - 체크박스
          - 약관 내용 텍스트 
      -->

      <!--회원가입 / 취소 버튼-->
      <button class="btn btn-lg btn-primary btn-block" type="submit">
        회원가입
      </button>
      <button class="btn btn-lg btn-danger btn-block">취소</button>
    </form>
</body>
</html>