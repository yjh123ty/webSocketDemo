/**
 * Project Name:websocketDemo
 * File Name:SysMenu.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>Title:SysMenu</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月14日下午3:15:48</p>
 * <p>Description:TODO</p>
 */
public class SysMenu {
    private Long id;
    private String name;
    private String url;
    
    /**
     * 子菜单
     */
    private List<SysMenu> children = new ArrayList<>(0);
    
    /**
     * 父菜单
     */
    private SysMenu parent;
    
    public SysMenu getParent() {
        return parent;
    }
    public void setParent(SysMenu parent) {
        this.parent = parent;
    }
    public List<SysMenu> getChildren() {
        return children;
    }
    public void setChildren(List<SysMenu> children) {
        this.children = children;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    @Override
    public String toString() {
        return "SysMenu [id=" + id + ", name=" + name + ", url=" + url + ", children=" + children + ", parent=" + parent + "]";
    }
    
    
}
