package com.airbnb.web.services;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.airbnb.web.domains.Command;
import com.airbnb.web.domains.GuideDTO;
import com.airbnb.web.domains.HostingDTO;
import com.airbnb.web.domains.Retval;
import com.airbnb.web.mappers.GuideMapper;
import com.airbnb.web.mappers.HostingMapper;

@Service @Lazy
public class GuideServiceImpl implements GuideService{
	@Autowired private Retval retval;
	@Autowired private SqlSession sqlSession;
	
	@Override
	public Integer g_insert(GuideDTO gdto) {
		return sqlSession.getMapper(GuideMapper.class).g_insert(gdto);
	}
	
	@Override
	public String update(GuideDTO param) {
		return null;
	}

	@Override
	public String delete(GuideDTO param) {
		return null;
	}

	@Override
	public Retval count() {
		return retval;
	}
	
	@Override
	public Retval gcount() {
		GuideMapper gmapper = sqlSession.getMapper(GuideMapper.class);
		return  gmapper.gcount();
	}

	@Override
	public List<GuideDTO> find(Command command) {
		return null;
	}

	public List<GuideDTO> glist() {
		GuideMapper gmapper = sqlSession.getMapper(GuideMapper.class);
		return gmapper.glist();	}

	@Override
	public List<GuideDTO> list() {
		return null;
	}

	@Override
	public List<String> guide_seq(Command command) {
		return sqlSession.getMapper(GuideMapper.class).guide_seq(command);
	}
}
