/**
 * Project Name:websocketDemo
 * File Name:IUserService.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.service;

import java.util.List;

import org.xdemo.example.websocket.app.vo.UserInfo;
import org.xdemo.example.websocket.entity.User;


/**
 * <p>Title:IUserService</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月1日下午3:15:30</p>
 * <p>Description:TODO</p>
 */
public interface IUserService extends IBaseService<User>{
    public void update(User user);
    
    public User getById(Long id);
    
    public List<User> getAll();

    /**
     *  <p>Author:yjh;</p>
     *  <p>Date:2016年11月1日下午3:40:19;</p>
     *	<p>Description: TODO;</p>
     *  @param id
     *  @return
     */
    public UserInfo getInfoById(Long id);

    /**
     *  <p>Author:yjh;</p>
     *  <p>Date:2016年11月2日下午1:12:38;</p>
     *	<p>Description: TODO;</p>
     *  @param 用户名
     *  @return
     */
    public User checkLogin(String name);
    
}
