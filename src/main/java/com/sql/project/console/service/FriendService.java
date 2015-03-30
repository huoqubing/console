package com.sql.project.console.service;

import com.sql.project.console.dto.FriendDto;
import com.sql.project.console.dto.PageBean;
import com.sql.project.console.entity.Friend;

public interface FriendService extends BaseService<Friend> {
	
	public PageBean search(FriendDto appVersion);

	public Boolean checkIsExists(Integer id);
}
