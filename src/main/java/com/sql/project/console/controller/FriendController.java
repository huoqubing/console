package com.sql.project.console.controller;

import com.sql.project.console.dto.FriendDto;
import com.sql.project.console.dto.PageBean;
import com.sql.project.console.entity.Friend;
import com.sql.project.console.service.FriendService;
import com.sql.project.console.spring.annotation.FuncNum;
import com.sql.project.console.spring.exception.ConsoleException;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/friend")
public class FriendController extends BaseController {
	private static Logger logger = Logger.getLogger(FriendController.class);
	
	@Autowired
	private FriendService service;
	
	@RequestMapping(value = "/list")
	@FuncNum(value = "p_app_version", remark = "")
	public ModelAndView listItem_Auth(@ModelAttribute FriendDto dto) {
		ModelAndView mav = new ModelAndView("mgr/friendList");
		if (dto == null) {
			dto = new FriendDto();
		}
		PageBean result = service.search(dto);
		mav.addObject("dto", dto);
		mav.addObject("list", result);
		return mav;
	}
	
	@RequestMapping(value = "/goAddItem")
	@FuncNum(value = "p_friend_add", remark = "")
	public ModelAndView goAddItem_Auth() {
		ModelAndView mav = new ModelAndView("mgr/addFriend");
		mav.addObject("friendDto", new FriendDto());
		return mav;
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@FuncNum(value = "p_friend_add", remark = "")
	public ModelAndView doSaveItem_Auth(@ModelAttribute @Valid FriendDto friendDto,
			BindingResult result, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		if (result.hasErrors()) {
			mav.setViewName("mgr/addFriend");
			return mav;
		}
		friendDto.setCreateTime(new Date());
		Friend friend = new Friend();
		BeanUtils.copyProperties(friendDto, friend);
		service.add(friend);
		friendDto.clear();
		RedirectView rv = new RedirectView("list");
/*		mav = new ModelAndView(rv, getMessage(MESSAGE_TYPE_SUCCESS,
				SUCCESS_OPERATION, request));*/
		mav = new ModelAndView(rv);
		return mav;
	}
	
	@RequestMapping(value = "prepareEditItem")
	public ModelAndView prepareEditItem(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String itemKey = request.getParameter("itemKey");
		Friend item = service.getById(Integer.valueOf(itemKey));
		FriendDto friendDto = new FriendDto();
		BeanUtils.copyProperties(item, friendDto);
		mav.addObject("friendDto", friendDto);
		mav.setViewName("mgr/editFriend");
		return mav;
	}
	
	@RequestMapping(value = "/editItem", method = RequestMethod.POST)
	@FuncNum(value = "p_friend_edit", remark = "")
	public ModelAndView doEditItem_Auth(@ModelAttribute @Valid FriendDto friendDto,
			BindingResult result, HttpServletRequest request) {
		ModelAndView mav;
		String oldItemKey = request.getParameter("oldItemKey");
		if (result.hasErrors()) {
			mav = new ModelAndView();
			mav.setViewName("mgr/editFriend");
			return mav;
		}
		Friend item = service.getById(Integer.valueOf(oldItemKey));
		BeanUtils.copyProperties(friendDto, item);
		item.setId(Integer.valueOf(oldItemKey));
		service.update(item);
		friendDto.clear();
		RedirectView rv = new RedirectView("list");
/*		mav = new ModelAndView(rv, getMessage(MESSAGE_TYPE_SUCCESS,
				SUCCESS_OPERATION, request));*/
		mav = new ModelAndView(rv);
		return mav;
	}	

	
	@RequestMapping(value = "/del")
	@FuncNum(value = "p_friend_del", remark = "")
	public ModelAndView delItem_Auth(HttpServletRequest request) {
		ModelAndView mav;
		try {
			String action = request.getParameter("action");
			if ("single".equals(action)) {
				String id = request.getParameter("selected_item");
				service.deleteById(Integer.valueOf(id));
			} else {
				String[] idsStr = request.getParameterValues("selected_item");
				List<Integer> ids = new ArrayList<Integer>();
				for(String id:idsStr){
					ids.add(Integer.valueOf(id));
				}
				service.deleteByIds(ids);
			}
			RedirectView rv = new RedirectView("list");
/*			mav = new ModelAndView(rv, getMessage(MESSAGE_TYPE_SUCCESS,
					SUCCESS_OPERATION, request));*/
			mav = new ModelAndView(rv);
			mav.addObject("friendDto", new FriendDto());
		} catch (ConsoleException he) {
			RedirectView rv = new RedirectView("list");
			mav = new ModelAndView(rv, getMessage(MESSAGE_TYPE_EXCEPTION,
					he.getErrorCode(), request));
		}
		return mav;
	}	
	
	@RequestMapping(value = "/checkIsExist", method = RequestMethod.POST)
	@ResponseBody
	public String checkIsExist(String type,String version) {
		JSONObject json = new JSONObject();
		String status = "0";
		if(StringUtils.isNotBlank(type)&&
				StringUtils.isNotBlank(version)){
			FriendDto dto = new FriendDto();
			dto.setType(type);
			if(null!=isExistTypeAndVersion(dto)){
				status = "1";
			}
		}
		logger.info("json.message" + json.toString());
		return json.toString();
	}
	
	
	private Friend isExistTypeAndVersion(FriendDto friend){
		Friend result = null;
		PageBean list = service.search(friend);
		if(null!=list&&
				null!=list.getResult()&&
				!list.getResult().isEmpty()){
			result =(Friend) list.getResult().get(0);
		}
		return result;
	}
	
}
