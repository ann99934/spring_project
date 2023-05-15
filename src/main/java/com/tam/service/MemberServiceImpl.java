package com.tam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.MemberMapper;
import com.tam.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper membermapper;

	/* 로그인 */
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		
		return membermapper.memberLogin(member);
	}

	// 회원가입
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		memberMapper.memberJoin(member);	
	}
	
	// 아이디 중복검사
	@Override
	public int idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return memberMapper.idCheck(id);
	}
}

