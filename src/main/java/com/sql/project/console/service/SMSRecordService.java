package com.sql.project.console.service;

import com.sql.project.console.dto.PageBean;
import com.sql.project.console.dto.SMSRecord;


/**
 * @ClassName:     UserService.java
 * @Description:   TODO
 * @author         FrankWong
 * @version        V1.0  
 * @Date           2013-07-07 09:55:51 
 */
public interface SMSRecordService extends BaseService<SMSRecord> {
	public PageBean search(SMSRecord smsRecord);
}
