package com.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.notice.mapper.NoticeMapper;
import com.notice.model.Criteria;
import com.notice.model.NoticeVO;

@Service
@Repository
public class NoticeServiceImplement implements NoticeService{

	@Autowired
	private NoticeMapper nMapper;
	
	@Override
	public List<NoticeVO> selectAll(Criteria cri) {
		return nMapper.selectAll(cri);
	}

	@Override
	public int selectCount(Criteria cri) {
		return nMapper.selectCount(cri);
	}

	@Override
	public NoticeVO selectOne(int noticeNum) {
		return nMapper.selectOne(noticeNum);
	}
	
	@Override
	public void postNotice(NoticeVO nVo) {
		nMapper.postNotice(nVo);
	}
	@Override
	public int deleteNotice(int noticeNum) {
		return nMapper.deleteNotice(noticeNum);
	}

	@Override
	public int updateNotice(NoticeVO nVo) {
		return nMapper.updateNotice(nVo);
	}
}
