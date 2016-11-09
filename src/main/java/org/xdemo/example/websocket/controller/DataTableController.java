/**
 * Project Name:websocketDemo
 * File Name:DataTableController.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xdemo.example.websocket.entity.User;
import org.xdemo.example.websocket.query.BaseQuery;
import org.xdemo.example.websocket.query.PageList;
import org.xdemo.example.websocket.service.IUserService;

/**
 * <p>Title:DataTableController</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月9日下午3:34:16</p>
 * <p>Description:TODO</p>
 */
@Controller
@RequestMapping("/datatable")
public class DataTableController {
    
    @Autowired
    private IUserService userService;
    
    @RequestMapping("/index.do")
    public String index(){
        return "datatable/datatable";
    }
    
    @RequestMapping("/list.do")
    @ResponseBody
    public PageList<User> list(BaseQuery baseQuery){
        return userService.getPageList(baseQuery);
    }
}
