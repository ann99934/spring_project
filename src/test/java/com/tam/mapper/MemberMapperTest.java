package com.tam.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tam.model.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTest {
	
	@Autowired
	private MemberMapper memberMapper;
	
	// 회원가입 쿼리 테스트
	@Test
	public void memberJoin() throws Exception {
		MemberVO member = new MemberVO();
		member.setId("test");
		member.setPw("test");
		member.setName("test");
		member.setEmail("test");
		member.setPost("test");
		member.setAddr1("test");
		member.setAddr2("test");
		member.setTel("test");
		
		memberMapper.memberJoin(member);	// 회원가입 메소드 실행
	}
	
	

}
