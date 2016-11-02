/**
 * Project Name:websocketDemo
 * File Name:UserTest.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.service;

import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.xdemo.example.websocket.utils.MapUtil;

import test.AbstractSpringTest;

/**
 * <p>Title:UserTest</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月2日上午10:06:19</p>
 * <p>Description:TODO</p>
 */
public class UserTest extends AbstractSpringTest{
    @Autowired
    private IUserService userService;
    
    @Test
    public void testName() throws Exception {
        System.err.println(userService.getById(1L));
        
        Map map = MapUtil.beanToMap(userService.getById(1L));
        System.err.println(map.toString());
    }
}
