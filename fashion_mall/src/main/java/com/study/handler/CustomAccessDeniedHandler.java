package com.study.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

@Component // 객체생성 이름이 없으면 클래스 이름의 앞문자만 소문자로 변경한 후 사용
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		//접근 제한이 된 후 처리해야 할 작업 작성
		
		//컨트롤러 경로 지정
		response.sendRedirect("/access-denied");
		
	}
}
