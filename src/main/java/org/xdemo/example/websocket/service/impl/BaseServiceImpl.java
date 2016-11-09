package org.xdemo.example.websocket.service.impl;

import java.util.List;

import org.xdemo.example.websocket.mapper.BaseMapper;
import org.xdemo.example.websocket.query.BaseQuery;
import org.xdemo.example.websocket.query.PageList;
import org.xdemo.example.websocket.service.IBaseService;


public abstract class BaseServiceImpl<T> implements IBaseService<T> {
	
	private BaseMapper<T> baseMapper;
	
	/**
	  * 创建一个新的实例 BaseServiceImpl. 
	  */
	public BaseServiceImpl(BaseMapper<T> baseMapper) {
		this.baseMapper = baseMapper;
	}

	@Override
	public T getById(Long id) {
		return baseMapper.getById(id);
	}

	@Override
	public boolean save(T t) {
		return baseMapper.save(t) == 1;
	}

	@Override
	public boolean updateById(T t) {
		return baseMapper.updateById(t) == 1;
	}

	@Override
	public boolean deleteById(Long id) {
		return baseMapper.deleteById(id) == 1;
	}
	

	@Override
	public List<T> getAll() {
		return baseMapper.getAll();
	}
	
	/**
	  * @see tech.youmu.ckl.service.IBaseService#getCount(tech.youmu.ckl.query.BaseQuery)
	  */
	@Override
	public long getCount(BaseQuery query) {
		return baseMapper.getCountByQuery(query);
	}
	
	/**
	  * @see tech.youmu.ckl.service.IBaseService#getPageList(tech.youmu.ckl.query.BaseQuery)
	  */
	@Override
	public PageList<T> getPageList(BaseQuery query) {
		// 创建一个空的页列表
		PageList<T>  pageList = new PageList<>();
		// 根据分页查询条件  查询记录数
		long count = baseMapper.getCountByQuery(query);
		
		// 判断记录数 大于0 查询 页的数据 放入分页列表对象中
		if(count > 0) {
			pageList.setTotal(count);
			pageList.setRows(baseMapper.getByQuery(query));
		}
		return pageList;
	}
	
	
	
}
