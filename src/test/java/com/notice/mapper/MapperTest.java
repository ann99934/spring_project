package com.notice.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.notice.mapper.NoticeMapper;
import com.notice.model.NoticeVO;
import com.tam.mapper.TestMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTest {
	
	@Autowired
	private TestMapper testMapper;
	@Autowired
	private NoticeMapper nMapper;
//	@Test
//	public void testGetTime() {
//		log.info("testMapper");
//		log.info(testMapper.getTime());
//	}
	@Test
	public void testInsert() {
		NoticeVO nVo = new NoticeVO();
		nVo.setNoticeTitle("test");
		nVo.setNoticeContent("test");
		nMapper.postNotice(nVo);
	}
}
