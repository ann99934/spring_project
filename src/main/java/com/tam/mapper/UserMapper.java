package com.tam.mapper;

import java.util.List;

import com.tam.model.Criteria;
import com.tam.model.MemberVO;

public interface UserMapper {

	// 유저 목록
	public List<MemberVO> getList();

	// 유저 목록(페이징 적용)
	public List<MemberVO> getListPaging(Criteria cri);

	// 유저 총 갯수
	public int getTotal();

}
