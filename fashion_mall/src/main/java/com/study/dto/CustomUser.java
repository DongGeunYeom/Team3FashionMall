package com.study.dto;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User {
	
	private MemberDTO member;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(MemberDTO member) {
		super(member.getUser_id(), member.getPassword(), member.getAuthList() //list구조
															  .stream()
															  .map(auth -> new SimpleGrantedAuthority(auth.getAuth())) // SimpleGrantedAuthority 로만들어서 넘겨줘야한다
															  .collect(Collectors.toList()));
		this.member = member;
	}
	
}
