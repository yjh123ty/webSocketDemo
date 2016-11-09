package org.xdemo.example.websocket.mapper;

import java.util.List;

import org.xdemo.example.websocket.query.BaseQuery;

public interface BaseMapper<T> {
	
	/**
	  * deleteById(通过Id删除一条记录)
	  * @param id 主键
	  * @return 影响记录的条数
	 */
    int deleteById(Long id);
    
    /**
      * save(添加一条记录)
      * @param 记录对应的对象
      * @return 影响记录的条数
     */
    int save(T t);
    
    /**
      * getById(通过id获取一条记录对应的对象)
      * @param id
      * @return T 记录对应的对象
     */
    T getById(Long id);

    /**
     * getById(通过id获取一条记录对应的对象)
     * @param t 更新的记录对象
     * @return 影响的记录数
    */
    int updateById(T t);
    
    /**
	 * 
	  * getAll(查询所有的T)
	  *
	  * @return T列表
	 */
	public List<T> getAll();
	
	/**
	  * getCountByQuery(根据条件查询  记录条数)
	  * @param query 查询条件对象
	  * @return 满足条件的记录数
	 */
	public long getCountByQuery(BaseQuery query);
	
	/**
	  * getCount(根据条件查询  查询列表)
	  * @param query 查询条件对象
	  * @return 满足条件的记录列表  可以用来分页
	 */
	public List<T> getByQuery(BaseQuery query);
	
	
	 public void update(T t);
	 
	 public List<T> findAll();
}
