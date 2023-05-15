package com.tam.service;

import com.tam.model.MemberVO;

public interface MemberService {
	
	/*회원가입*/
	public void MemberJoin(MemberVO member)throws Exception;
	
	/*로그인*/
	public MemberVO memberLogin(MemberVO member) throws Exception;
}

