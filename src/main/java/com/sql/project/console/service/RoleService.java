package com.sql.project.console.service;

import com.sql.project.console.dto.PageBean;
import com.sql.project.console.dto.RoleDto;
import com.sql.project.console.entity.Privilege;
import com.sql.project.console.entity.Role;

import java.util.List;


/**
 * 
 * TODO
 * @author SQL
 *  
 * 2014-1-5 下午12:33:21
 */
public interface RoleService extends BaseService<Role> {
	public List<Privilege> getPrivilegeList();
	public PageBean search(RoleDto roleDto);
	Role getByRoleId(String roleId);
	public boolean isUsed(String roleId);
}
