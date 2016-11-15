/**
 * Project Name:websocketDemo
 * File Name:ISysMenuService.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.service;

import java.util.List;

import org.xdemo.example.websocket.entity.SysMenu;

/**
 * <p>Title:ISysMenuService</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月14日下午3:20:03</p>
 * <p>Description:TODO</p>
 */
public interface ISysMenuService extends IBaseService<SysMenu>{
    /**
     * getUserMenuTree(获取当前用户的菜单树)
     *
     * @return List<Menu> 用户可以看见的菜单树
     */
   List<SysMenu> getUserMenuTree();

   /**
     * getAllTree(拿到所有的菜单形成树)
     * @return
     */
   List<SysMenu> getAllTree();
}
