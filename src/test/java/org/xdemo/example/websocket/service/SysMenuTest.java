/**
 * Project Name:websocketDemo
 * File Name:SysMenuTest.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.xdemo.example.websocket.entity.SysMenu;
import org.xdemo.example.websocket.entity.User;
import org.xdemo.example.websocket.utils.UserContext;

/**
 * <p>Title:SysMenuTest</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月14日下午3:54:58</p>
 * <p>Description:TODO</p>
 */
public class SysMenuTest extends AbstractSpringTest{
    
    @Autowired
    private ISysMenuService sysMenuService;
    
    @Autowired
    private IUserService userService;
    
    @Test
    public void testGetAllSysMenus() throws Exception {
        List<SysMenu> tree = sysMenuService.getAllTree();
        for (SysMenu sysMenu : tree) {
            System.err.println(sysMenu);
        }
    }
    
}
