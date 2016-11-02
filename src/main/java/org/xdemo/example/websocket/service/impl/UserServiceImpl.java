/**
 * Project Name:websocketDemo
 * File Name:UserServiceImpl.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xdemo.example.websocket.app.vo.UserInfo;
import org.xdemo.example.websocket.entity.User;
import org.xdemo.example.websocket.mapper.UserMapper;
import org.xdemo.example.websocket.service.IUserService;

/**
 * <p>Title:UserServiceImpl</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月1日下午3:16:30</p>
 * <p>Description:TODO</p>
 */
@Service
public class UserServiceImpl implements IUserService{
    
    @Autowired
    private UserMapper userMapper;

    /* (non-Javadoc)
     * @see org.xdemo.example.websocket.service.IUserService#update(org.activiti.engine.identity.User)
     */
    @Override
    public void update(User user) {
        userMapper.update(user);
    }

    /* (non-Javadoc)
     * @see org.xdemo.example.websocket.service.IUserService#getById(java.lang.Long)
     */
    @Override
    public User getById(Long id) {
        return userMapper.getById(id);
    }

    /* (non-Javadoc)
     * @see org.xdemo.example.websocket.service.IUserService#getAll()
     */
    @Override
    public List<User> getAll() {
        return userMapper.getAll();
    }

    /* (non-Javadoc)
     * @see org.xdemo.example.websocket.service.IUserService#getInfoById(java.lang.Long)
     */
    @Override
    public UserInfo getInfoById(Long id) {
        return userMapper.getInfoById(id);
    }

    /* (non-Javadoc)
     * @see org.xdemo.example.websocket.service.IUserService#checkLogin(java.lang.String)
     */
    @Override
    public User checkLogin(String name) {
        return userMapper.checkLogin(name);
    }

}
