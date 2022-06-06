package com.study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.study.dto.CustomUser;
import com.study.dto.MemberDTO;
import com.study.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CustomUserDetailService implements UserDetailsService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// username == userid
		log.info("userid 정보 "+username);
		
		MemberDTO member = mapper.read(username);
		
		log.info("인증 정보 "+member);
	
		return new CustomUser(member);
	}
	

}
