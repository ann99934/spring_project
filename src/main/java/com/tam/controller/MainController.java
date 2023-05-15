package com.tam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class); 

	@GetMapping("/main")
	public void mainPageGET(Model model) {
		logger.info("메인 페이지 진입");
	}
	

}
