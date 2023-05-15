package com.tam.model;

import lombok.Data;

@Data

public class MemberVO {
	private String id; // 회원 아이디

	private String pw; // 회원 비밀번호

	private String name; // 회원 이름

	private String email; // 회원 이메일

	private String post; // 회원 우편번호

	private String addr1; // 회원 주소

	private String addr2; // 회원 상세 주소

	private String tel; // 회원 전화번호

	private int adminCk; // 관리자 구분 (0: 일반 사용자, 1:관리자)
}
