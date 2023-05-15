package com.tam.model;

public class MemberVO {
		//회원 id
		private String memberId;
		
		//회원 비밀번호
		private String memberPw;
		
		//회원 이름
		private String memberName;
		
		//회원 이메일
		private String memberMail;
		
		//회원 생일
		private String memberBirth;
		
		//회원우편번호
		private String memberPost;
		
		//회원 주소
		private String memberAddr1;
		
		//회원 주소
		private String memberAddr2;
		
		//회원 전화번호
		private String memberTel;
		
		// 관리자 구분(0:일반사용자, 1:관리자)
		private int adminCk;

		public String getMemberId() {
			return memberId;
		}

		public void setMemberId(String memberId) {
			this.memberId = memberId;
		}

		public String getMemberPw() {
			return memberPw;
		}

		public void setMemberPw(String memberPw) {
			this.memberPw = memberPw;
		}

		public String getMemberName() {
			return memberName;
		}

		public void setMemberName(String memberName) {
			this.memberName = memberName;
		}

		public String getMemberMail() {
			return memberMail;
		}

		public void setMemberMail(String memberMail) {
			this.memberMail = memberMail;
		}

		public String getMemberBirth() {
			return memberBirth;
		}

		public void setMemberBirth(String memberBirth) {
			this.memberBirth = memberBirth;
		}

		public String getMemberPost() {
			return memberPost;
		}

		public void setMemberPost(String memberPost) {
			this.memberPost = memberPost;
		}

		public String getMemberAddr1() {
			return memberAddr1;
		}

		public void setMemberAddr1(String memberAddr1) {
			this.memberAddr1 = memberAddr1;
		}

		public String getMemberAddr2() {
			return memberAddr2;
		}

		public void setMemberAddr2(String memberAddr2) {
			this.memberAddr2 = memberAddr2;
		}

		public String getMemberTel() {
			return memberTel;
		}

		public void setMemberTel(String memberTel) {
			this.memberTel = memberTel;
		}

		public int getAdminCk() {
			return adminCk;
		}

		public void setAdminCk(int adminCk) {
			this.adminCk = adminCk;
		}

		@Override
		public String toString() {
			return "MemberVO [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
					+ ", memberMail=" + memberMail + ", memberBirth=" + memberBirth + ", memberPost=" + memberPost
					+ ", memberAddr1=" + memberAddr1 + ", memberAddr2=" + memberAddr2 + ", memberTel=" + memberTel
					+ ", adminCk=" + adminCk + "]";
		}
}
