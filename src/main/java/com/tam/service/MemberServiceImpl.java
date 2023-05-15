package com.tam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.MemberMapper;
import com.tam.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberMapper membermapper;
	
	/* 회원가입 */
	@Override
	public void MemberJoin(MemberVO member) throws Exception {	
		membermapper.memberJoin(member);
		
	}


	/* 로그인 */
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		
		return membermapper.memberLogin(member);
	}


	
}

