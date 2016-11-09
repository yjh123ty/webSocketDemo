package org.xdemo.example.websocket.service;

import java.util.List;

import org.xdemo.example.websocket.query.BaseQuery;
import org.xdemo.example.websocket.query.PageList;


public interface IBaseService<T> {
	/**
	  * getById(通过id查询T对象)
	  *
	  * @param id 主键
	  * @return id 对应的T对象
	 */
	public T getById(Long id);
	
	/**
	 * 
	  * save(添加一个T)
	  *  	注意： T的资源不能为空
	  * @param t T对象
	  * @return boolean 是否添加成功 
	 */
	public boolean save(T t);
	
	/**
	 * 
	  * updateById(通过id来修改T)
	  *		注意： T的资源不能为空
	  * @param t T对象
	  * @boolean 是否修改成功
	 */
	public boolean updateById(T t);
	
	/**
	 * 
	  * deleteById(通过id来删除T)
	  *
	  * @param id Tid
	 * @return 
	  * @boolean 是否删除成功
	 */
	public boolean deleteById(Long id);
	
	/**
	 * 
	  * getAll(查询所有的T)
	  *
	  * @return T列表
	 */
	public List<T> getAll();
	
	/**
	  * getCount(根据查询条件来查询的 分页用的数据总条数)
	  * @return int 根据条件查询的条数
	 */
	public long getCount(BaseQuery query);
	
	/**
	 * getCount(根据查询条件来查询  一页数据)
	 * @return PageList<T>  根据条件查询的数据分页对象
	 */
	public PageList<T> getPageList(BaseQuery query);
	
	
}
