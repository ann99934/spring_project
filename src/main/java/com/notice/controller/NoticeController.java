package com.notice.controller;

import java.net.http.HttpRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.notice.model.Criteria;
import com.notice.model.NoticeVO;
import com.notice.model.PageMakerDTO;
import com.notice.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	private static final Logger log = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService nService;

	@GetMapping("/main")
	public void mainPageGET(Model model, Criteria cri) {
		log.info("메인 페이지 진입");
		model.addAttribute("list", nService.selectAll(cri));
		int total = nService.selectCount(cri);
		PageMakerDTO pageDto = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageDto);
	}

	@GetMapping("/postNotice")
	public void postNoticeGET() {
		log.info("삽입 페이지 진입");
	}

	@PostMapping("/postNotice.do")
	public String postNoticePOST(NoticeVO nVo, RedirectAttributes rttr) {
		nService.postNotice(nVo);
		rttr.addFlashAttribute("result", "등록 완료");
		return "redirect:/notice/main";
	}

	@GetMapping("/showNotice")
	public void showNoticeGET(int noticeNum, Model model, Criteria cri) {
		log.info("상세보기 진입");
		model.addAttribute("pageInfo", nService.selectOne(noticeNum));
		model.addAttribute("cri", cri);
	}

	@GetMapping("/updateNotice")
	public void updateNoticeGet(int noticeNum, Model model) {
		log.info("수정하기 페이지 진입");
		model.addAttribute("pageInfo", nService.selectOne(noticeNum));
	}

	// 게시판 수정
	@PostMapping("/updateNotice")
	public String boardModifyPost(NoticeVO nVo, RedirectAttributes rttr) {
		nService.updateNotice(nVo);
		rttr.addFlashAttribute("result", "수정 성공");
		return "redirect:/notice/main";
	}

	// 목록 삭제
	@PostMapping("/deleteNotice")
	public String boardDeletePOST(int noticeNum, RedirectAttributes rttr) {
		nService.deleteNotice(noticeNum);
		rttr.addFlashAttribute("result", "삭제 성공");
		return "redirect:/notice/main";
	}
}
