/**
 * Project Name:websocketDemo
 * File Name:UserController.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xdemo.example.websocket.entity.AjaxResult;
import org.xdemo.example.websocket.entity.User;
import org.xdemo.example.websocket.query.BaseQuery;
import org.xdemo.example.websocket.query.PageList;
import org.xdemo.example.websocket.service.IUserService;

/**
 * <p>Title:UserController</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月9日下午5:45:16</p>
 * <p>Description:TODO</p>
 */
@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    private IUserService userService;
    
    @RequestMapping("/index.do")
    public String index(){
        return "user/user";
    }
    
    @RequestMapping("/list.do")
    @ResponseBody
    public PageList<User> list(BaseQuery baseQuery){
        return userService.getPageList(baseQuery);
    }
    
}
