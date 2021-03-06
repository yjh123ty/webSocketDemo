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
import org.xdemo.example.websocket.exception.BizExecption;
import org.xdemo.example.websocket.mapper.UserMapper;
import org.xdemo.example.websocket.service.IUserService;
import org.xdemo.example.websocket.utils.UserContext;

/**
 * <p>Title:UserServiceImpl</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月1日下午3:16:30</p>
 * <p>Description:TODO</p>
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService{
    
    private UserMapper userMapper;
    
    /**
     *  <p>Author:yjh;</p>
     *  <p>Date:2016年11月9日下午5:58:36;</p>
     *	<p>Description: TODO;</p>
     *  @param TODO 
     *  @throws	TODO
     */
    @Autowired
    public UserServiceImpl(UserMapper userMapper) {
        super(userMapper);
        this.userMapper = userMapper;
    }

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

    /* (non-Javadoc)
     * @see org.xdemo.example.websocket.service.IUserService#changePassword(java.lang.String, java.lang.String)
     */
    @Override
    public boolean changePassword(String oldPassword, String newPassword) {
        User user = userMapper.getById(UserContext.getUser().getId());
        if(user==null){
            throw new BizExecption("系统异常！请重新登录！");
        }
        if(!oldPassword.equals(user.getPassword())){
            throw new BizExecption("原密码输入错误！");
        }
        if(!oldPassword.equals(newPassword)){
            throw new BizExecption("新密码与旧密码不一致！");
        }
        return false;
    }

}
