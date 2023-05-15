package com.tam.mapper;

import java.util.List;

import com.tam.model.Criteria;
import com.tam.model.MemberVO;

public interface UserMapper {

	// ���� ���
	public List<MemberVO> getList();

	// ���� ���(����¡ ����)
	public List<MemberVO> getListPaging(Criteria cri);

	// ���� �� ����
	public int getTotal();

}
