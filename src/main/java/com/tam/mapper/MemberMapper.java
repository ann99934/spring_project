package com.tam.mapper;

import com.tam.model.MemberVO;

public interface MemberMapper {
	
	/* 로그인 */
		public MemberVO memberLogin(MemberVO member);

	// 회원가입
	public void memberJoin(MemberVO member);
	
	// 아이디 중복검사
	public int idCheck(String id);
}
