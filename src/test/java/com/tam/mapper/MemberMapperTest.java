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
//	@Test
//	public void memberJoin() throws Exception {
//		MemberVO member = new MemberVO();
//		member.setId("test");
//		member.setPw("test");
//		member.setName("test");
//		member.setEmail("test");
//		member.setPost("test");
//		member.setAddr1("test");
//		member.setAddr2("test");
//		member.setTel("test");
//		
//		memberMapper.memberJoin(member);	// 회원가입 메소드 실행
//	}
	
	// 아이디 중복검사 쿼리 테스트
/*	@Test
	public void idCheckTest() throws Exception {
		String id = "111";	// 존재하는 아이디
		String id2 = "0";	// 존재하지 않는 아이디
		
		memberMapper.idCheck(id);
		memberMapper.idCheck(id2);
	}
*/
	
	@Test
	public void memberLogin() throws Exception{
		MemberVO member = new MemberVO();
		
		member.setId("1");
		member.setPw("1");
		memberMapper.memberLogin(member);
	}
	
}
