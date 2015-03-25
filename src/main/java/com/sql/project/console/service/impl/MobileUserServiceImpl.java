/**
 * 
 */
package com.sql.project.console.service.impl;

import com.sql.project.console.dao.MyBatisDao;
import com.sql.project.console.dto.MobileUser;
import com.sql.project.console.dto.PageBean;
import com.sql.project.console.service.MobileUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TODO
 * @author SQL
 *  
 * 2014-1-1 下午1:49:02
 */
@Service
public class MobileUserServiceImpl implements MobileUserService {
	@Autowired
	private MyBatisDao myBatisDao;
	
	@Override
	public PageBean search(MobileUser mobileUser) {

		int page = 0;
		if (mobileUser.getCurrentPage() <= 0) {
			page = 1;
		} else {
			page = mobileUser.getCurrentPage();
		}

		int pageSize = mobileUser.getPageSize();
		MobileUser params = new MobileUser();
		BeanUtils.copyProperties(mobileUser, params);
		
		List<MobileUser> result = myBatisDao.getList("mobileUserMapper.getList", params, (page - 1) * pageSize, pageSize);
		Long rows = myBatisDao.getCount("mobileUserMapper.getCount", params);
		
		PageBean bean = new PageBean();
		bean.setCurrentPage(page);
		bean.setPageSize(mobileUser.getPageSize());
		bean.setTotalRows(rows.intValue());
		bean.setResult(result);
		return bean;
	}

	@Override
	public void update(MobileUser item) {
		myBatisDao.update("mobileUserMapper.update", item);
	}


	@Override
	public void add(MobileUser item) {
		myBatisDao.add("mobileUserMapper.add", item);
	}


	@Override
	public void deleteById(int id) {
		myBatisDao.deleteById("mobileUserMapper.deleteById", id);
	}


	@Override
	public void deleteByIds(List<Integer> ids) {
		myBatisDao.deleteByIds("mobileUserMapper.deleteByIds", ids);
	}
	
	@Override
	public MobileUser getById(int id) {
		return myBatisDao.getById("mobileUserMapper.getById", id);
	}


	@Override
	public <T> List<T> getList() {
		return myBatisDao.getList("mobileUserMapper.getList", new MobileUser());
	}

}
