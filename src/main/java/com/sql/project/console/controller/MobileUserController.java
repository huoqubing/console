package com.sql.project.console.controller;

import com.sql.project.console.dto.MobileUser;
import com.sql.project.console.dto.PageBean;
import com.sql.project.console.service.MobileUserService;
import com.sql.project.console.spring.annotation.FuncNum;
import com.sql.project.console.spring.exception.ConsoleException;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/mobileUser")
public class MobileUserController extends BaseController {
	private static Logger logger = Logger.getLogger(MobileUserController.class);
	
	@Autowired
	private MobileUserService service;
	
	@RequestMapping(value = "/list")
	@FuncNum(value = "p_mobileUser", remark = "")
	public ModelAndView listItem_Auth(@ModelAttribute MobileUser dto) {
		ModelAndView mav = new ModelAndView("mgr/mobileUserList");
		if (dto == null) {
			dto = new MobileUser();
		}
		PageBean result = service.search(dto);
		mav.addObject("dto", dto);
		mav.addObject("list", result);
		return mav;
	}
	
	@RequestMapping(value = "/goAddItem")
	@FuncNum(value = "p_mobileUser_add", remark = "")
	public ModelAndView goAddItem_Auth() {
		ModelAndView mav = new ModelAndView("mgr/addMobileUser");
		mav.addObject("dto", new MobileUser());
		return mav;
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@FuncNum(value = "p_mobileUser_add", remark = "")
	public ModelAndView doSaveItem_Auth(@ModelAttribute MobileUser dto,
			BindingResult result, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		dto.setCreatetime(new Date());
		dto.setUpdatetime(new Date());
		service.add(dto);
		dto.clear();
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
		 MobileUser item = service.getById(Integer.valueOf(itemKey));
		mav.addObject("mobileUser", item);
		mav.setViewName("mgr/editMobileUser");
		return mav;
	}
	
	@RequestMapping(value = "/editItem", method = RequestMethod.POST)
	@FuncNum(value = "p_mobileUser_edit", remark = "")
	public ModelAndView doEditItem_Auth(@ModelAttribute @Valid MobileUser mobileUser,
			BindingResult result, HttpServletRequest request) {
		ModelAndView mav;
		
		
		if(result.hasErrors()){
			mav = new ModelAndView("mgr/editMobileUser");
			return mav;
		}
		
		String oldItemKey = request.getParameter("oldItemKey");
		MobileUser item = service.getById(Integer.valueOf(oldItemKey));
		BeanUtils.copyProperties(mobileUser, item);
		item.setId(Integer.valueOf(oldItemKey));
		item.setUpdatetime(new Date());
		service.update(item);
		mobileUser.clear();
		RedirectView rv = new RedirectView("list");
/*		mav = new ModelAndView(rv, getMessage(MESSAGE_TYPE_SUCCESS,
				SUCCESS_OPERATION, request));*/
		mav = new ModelAndView(rv);
		return mav;
	}	

	
	@RequestMapping(value = "/del")
	@FuncNum(value = "p_mobileUser_del", remark = "")
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
			mav.addObject("dto", new  MobileUser());
		} catch (ConsoleException he) {
			RedirectView rv = new RedirectView("list");
			mav = new ModelAndView(rv, getMessage(MESSAGE_TYPE_EXCEPTION,
					he.getErrorCode(), request));
		}
		return mav;
	}
    
}
