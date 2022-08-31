package com.mvc.step3;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.HashMapBinder;

public class MemberController implements Controller3 {
	Logger logger = Logger.getLogger(MemberController.class);
	MemberLogic memberLogic = new MemberLogic();
	
	@Override
	public ModelAndView memberList(HttpServletRequest req, HttpServletResponse res) {
		logger.info("MemberController: memberList 호출 성공");
		//ModelAndView객체를 설계함에 따라서 req가 없어도 조회결과를 담을 수 있게 되었다-의미
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		ModelAndView mav = new ModelAndView(req);
		List<Map<String,Object>> memberList = null;
		
		memberList = memberLogic.memberList(pMap);
		
		mav.addObject("memberList",memberList);
		mav.setViewName("auth/jsonMemberList");
		return mav;
	}
	
	@Override
	public ModelAndView execute(HttpServletRequest req, HttpServletResponse res, Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object login(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object clogin(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object boardList(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object boardDetail(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object boardInsert(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object boardUpdate(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object boardDelete(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

}
