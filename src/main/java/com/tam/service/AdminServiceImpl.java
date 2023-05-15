package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.UserMapper;
import com.tam.model.Criteria;
import com.tam.model.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private UserMapper mapper;

	@Override
	public List<MemberVO> getList() {

		return mapper.getList();
	}

	@Override
	public List<MemberVO> getListPaging(Criteria cri) {

		return mapper.getListPaging(cri);
	}

	@Override
	public int getTotal() {
		
		return mapper.getTotal();
	}
}
