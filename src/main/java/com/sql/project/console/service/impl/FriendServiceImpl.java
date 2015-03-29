/**
 * 
 */
package com.sql.project.console.service.impl;

import com.sql.project.console.dao.MyBatisDao;
import com.sql.project.console.dto.FriendDto;
import com.sql.project.console.dto.PageBean;
import com.sql.project.console.entity.Friend;
import com.sql.project.console.service.FriendService;
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
public class FriendServiceImpl implements FriendService {
	@Autowired
	private MyBatisDao myBatisDao;
	
	@Override
	public PageBean search(FriendDto friendDto) {

		int page = 0;
		if (friendDto.getCurrentPage() <= 0) {
			page = 1;
		} else {
			page = friendDto.getCurrentPage();
		}

		int pageSize = friendDto.getPageSize();
		Friend params = new Friend();
		BeanUtils.copyProperties(friendDto, params);
		
		List<Friend> result = myBatisDao.getList("friendMapper.getList", params, (page - 1) * pageSize, pageSize);
		Long rows = myBatisDao.getCount("friendMapper.getCount", params);
		
		PageBean bean = new PageBean();
		bean.setCurrentPage(page);
		bean.setPageSize(friendDto.getPageSize());
		bean.setTotalRows(rows.intValue());
		bean.setResult(result);
		return bean;
	}


	@Override
	public Boolean checkIsExists(Integer id) {
		return myBatisDao.getById("friendMapper.getById", id)==null?false:true;
	}

	@Override
	public void update(Friend item) {
		myBatisDao.update("friendMapper.update", item);
	}


	@Override
	public void add(Friend item) {
		myBatisDao.add("friendMapper.add", item);
	}


	@Override
	public void deleteById(int id) {
		myBatisDao.deleteById("friendMapper.deleteById", id);
	}


	@Override
	public void deleteByIds(List<Integer> ids) {
		myBatisDao.deleteByIds("friendMapper.deleteByIds", ids);
	}
	
	@Override
	public Friend getById(int id) {
		return myBatisDao.getById("friendMapper.getById", id);
	}


	@Override
	public <T> List<T> getList() {
		return myBatisDao.getList("friendMapper.getList", new Friend());
	}

}
