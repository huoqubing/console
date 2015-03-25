package com.sql.project.console.service;

import com.sql.project.console.dto.PageBean;
import com.sql.project.console.dto.PushTag;

public interface PushTagService extends BaseService<PushTag> {
	
	public PageBean search(PushTag pushTag);
}
