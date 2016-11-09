/**
 * Project Name:websocketDemo
 * File Name:UserMapper.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.mapper;

import java.util.List;

import org.xdemo.example.websocket.app.vo.UserInfo;
import org.xdemo.example.websocket.entity.User;


/**
 * <p>Title:UserMapper</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月1日下午3:04:33</p>
 * <p>Description:TODO</p>
 */
public interface UserMapper extends BaseMapper<User>{
    public void update(User user);
    
    public User getById(Long id);
    
    public List<User> getAll();

    /**
     *  <p>Author:yjh;</p>
     *  <p>Date:2016年11月1日下午3:41:12;</p>
     *	<p>Description: TODO;</p>
     *  @param id
     *  @return
     */
    public UserInfo getInfoById(Long id);

    /**
     *  <p>Author:yjh;</p>
     *  <p>Date:2016年11月2日下午1:18:37;</p>
     *	<p>Description: 检查登录名是否存在;</p>
     *  @param name
     *  @return
     */
    public User checkLogin(String name);
}
