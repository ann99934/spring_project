package com.tam.controller;

import java.io.File;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tam.model.MemberVO;
import com.tam.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/* 회원가입 페이지 이동 */
	@GetMapping("/join")
	public void joinPageGET() {
		logger.info("join 페이지 진입");
	}
	
	/* 회원가입 */
	@PostMapping("/join")
	public String joinPOST(MemberVO member) throws Exception {
		logger.info("join 진입");
	
		String rawPw = "";		// 인코딩 전 비밀번호
		String encodePw = "";	// 인코딩 후 비밀번호
		
		rawPw = member.getPw();		// 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw);		// 비밀번호 인코딩
		member.setPw(encodePw);		// 인코딩된 비밀번호 member 객체에 다시 저장
		
		// 회원가입 실행
		memberService.memberJoin(member);
		
		return "redirect:/main";
	}
	
	/* 아이디 중복 검사 */
	@PostMapping("/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String id) throws Exception {
		logger.info("memberIdChk 진입");
		
		int result = memberService.idCheck(id);
		logger.info("결과값: " + result);
		
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		}else {
			return "success";	// 중복 아이디가 없음
		}
	}
	
	/* 이메일 인증 */
	@GetMapping("/emailCheck")
	@ResponseBody
	public String emailCheckGET(String email) throws Exception {
		
		// 뷰(view)에서 넘어온 데이터 확인
		logger.info("이메일 데이터 전송 확인");
		logger.info("이메일: " + email);
		
		// 인증번호 난수 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호: " + checkNum);
		
		// 이메일 보내기
		String setFrom = "ann99923@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일";
		String content = "인증번호는 " + checkNum + "입니다.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content);
			
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String num = Integer.toString(checkNum);
		
		return num;	
	}

}
