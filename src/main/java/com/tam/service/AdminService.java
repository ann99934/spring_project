package com.tam.service;

import java.util.List;

import com.tam.model.Criteria;
import com.tam.model.MemberVO;

public interface AdminService {

	public List<MemberVO> getList();

	// 게시판 목록(페이징 적용)
	public List<MemberVO> getListPaging(Criteria cri);

	// 게시판 총 갯수
	public int getTotal();
}
