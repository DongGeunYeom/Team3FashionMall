package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/views/*")
public class menuController {
	
	@GetMapping("/test")
	public void test() {
		log.info("테스트");
	}
	
}
