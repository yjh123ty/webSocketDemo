/**
 * Project Name:websocketDemo
 * File Name:MainController.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xdemo.example.websocket.entity.SysMenu;
import org.xdemo.example.websocket.service.ISysMenuService;



/**
 * <p>Title:MainController</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月2日上午10:19:08</p>
 * <p>Description:TODO</p>
 */
@Controller
@RequestMapping("/main")
public class MainController {
    
    @Autowired
    private ISysMenuService menuService;
    
    @RequestMapping("/index.do")
    public String index(){
        return "main";
    }
    
    /**
     * getUserMenus(获取当前用户的所有的菜单)
     *
     * @return List<Menu> 用户对应的菜单列表
    */
   @RequestMapping("/getUserMenuTree.do")
   @ResponseBody
   public List<SysMenu> getUserMenus(){
       return menuService.getUserMenuTree();
   }
}
