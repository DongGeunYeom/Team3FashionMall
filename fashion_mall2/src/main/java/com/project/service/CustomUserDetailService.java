package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.project.dto.CustomUser;
import com.project.dto.MemberDTO;
import com.project.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class CustomUserDetailService implements UserDetailsService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		//username == userid
		log.info("userid 정보 "+userid);
		
		MemberDTO member = mapper.read(userid);
		
		log.info("인증 정보 "+member);
		
		return new CustomUser(member);
	}
}
