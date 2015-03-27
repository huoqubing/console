package com.sql.project.console.service;

import com.sql.project.console.dto.AppVersionDto;
import com.sql.project.console.dto.PageBean;
import com.sql.project.console.entity.AppVersion;

public interface AppVersionService extends BaseService<AppVersion> {
	
	public PageBean search(AppVersionDto appVersion);

	public Boolean checkIsExists(Integer id);
}
