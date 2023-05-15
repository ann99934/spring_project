package com.tam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tam.model.MemberVO;
import com.tam.service.MemberService;

@Controller
@RequestMapping(value="/shop")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	//로그인페이지 이동
	@GetMapping("/productMain")
	public void productMainGET() {
		logger.info("상품 페이지 진입");
	}
	/* 로그인 */
	@RequestMapping(value="productMain", method=RequestMethod.POST)
	public void productMainPOST() {
		
		logger.info("상품 페이지 진입");
		
		}
	
	 
	
    
    
}
