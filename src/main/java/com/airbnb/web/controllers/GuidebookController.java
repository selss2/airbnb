package com.airbnb.web.controllers;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.airbnb.web.domains.Command;
import com.airbnb.web.domains.GuideDTO;
import com.airbnb.web.domains.MemberDTO;
import com.airbnb.web.domains.Retval;
import com.airbnb.web.services.GuideService;

@Controller @Lazy
@Scope("session")
@SessionAttributes({"user"})
@RequestMapping("/guidebook")
public class GuidebookController {
	private static final Logger logger = LoggerFactory.getLogger(GuidebookController.class);
	@Autowired Retval retval;
	@Autowired GuideService gservice;
	@Autowired GuideDTO gdto;
	@Autowired private SqlSession sqlSession;
	@Autowired private Command command;
	
	@RequestMapping("/content")
	public String guidebook(){
		logger.info("GuideController ! content() ");
		return "public:guidebook/content.tiles";
	}
	
	@RequestMapping("/g_Seoul")
	public @ResponseBody Retval g_Seoul(){
		logger.info("GuideController ! g_Seoul() ");
		retval.setMessage("success");
		return retval;
	}
	@RequestMapping("/manage13")
	public @ResponseBody Retval manage13(){
		logger.info("GuideController ! manage13() ");
		retval.setMessage("success");
		logger.info("GuideController ! manage13()[]",retval.getMessage());
		return retval;
	}

	@RequestMapping("/header")
	public String guideHeader(){
		logger.info("---- Guide_CONTROLLER HEADER PASS ----");
		return "public/header.jsp";
	}
	
	//////////////////////////////////////////////////////
	@RequestMapping(value="/g_insert",method=RequestMethod.POST, consumes="application/json")
	public @ResponseBody Retval g_insert(@RequestBody GuideDTO param, @ModelAttribute("user") MemberDTO memberParam){
		logger.info("---- Guide_CONTROLLER g_insert :: {}", "g_insert");
		param.setEmail(memberParam.getEmail());
		logger.info("GuideController :: g_insert :: email :: {}", param.getEmail());
		logger.info("GuideController :: g_insert :: place :: {}", param.getPlace());
		logger.info("GuideController :: g_insert :: Major_Category :: {}", param.getMajor_category());
		logger.info("GuideController :: g_insert :: Minor_Category :: {}", param.getMinor_category());
		logger.info("GuideController :: g_insert :: Lat :: {}", param.getLat());
		logger.info("GuideController :: g_insert :: Lng :: {}", param.getLng());
		logger.info("GuideController :: g_insert :: Host_Comment :: {}", param.getHost_comment());
		command.setKeyword(memberParam.getEmail());
		logger.info("email 값  : {}",command.getKeyword());
		/*param.setGuide_seq(gservice.guide_seq(command).get(gservice.guide_seq(command).size()));
		logger.info("GuideController :: regist :: Guide_seq :: {}", param.getGuide_seq());*/
		gservice.g_insert(param);
		retval.setMessage("success g_insert");
		return retval;
	}
	
	@RequestMapping("/g_update")
	public @ResponseBody Retval gupdate(){
		logger.info("---- Guide_CONTROLLER g_update----");
		return retval;
	}
	
	@RequestMapping("/g_delete")
	public @ResponseBody Retval gdelete(){
		logger.info("---- Guide_CONTROLLER g_delete----");
		return retval;
	}
	
	@RequestMapping("/g_list")
	public @ResponseBody HashMap<String,Object> glist(ModelMap model){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("glist",gservice.glist());
		logger.info("----- Guide_CONTROLLER  g_list----");
		return map;
	}
	
	@RequestMapping("/g_count")
	public @ResponseBody Retval gcount(){
		logger.info("----- GUIDEBOOK_CONTOLLER guide_count -----");
		Retval retval = gservice.gcount();
		return retval;
	}
}
