package com.sql.project.console.service;

import com.sql.project.console.dto.PageBean;
import com.sql.project.console.dto.PushRecord;

public interface PushRecordService extends BaseService<PushRecord> {
	
	public PageBean search(PushRecord pushRecord);
}
