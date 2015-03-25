package com.sql.project.console.service;

import com.sql.project.console.dto.MobileUser;
import com.sql.project.console.dto.PageBean;


/**
 * @ClassName:     UserService.java
 * @Description:   TODO
 * @author         FrankWong
 * @version        V1.0  
 * @Date           2013-07-07 09:55:51 
 */
public interface MobileUserService extends BaseService<MobileUser> {
	public PageBean search(MobileUser mobileUser);
}
