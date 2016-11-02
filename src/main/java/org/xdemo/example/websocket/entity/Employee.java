/**
 * Project Name:websocketDemo
 * File Name:Employee.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.entity;

/**
 * <p>Title:Employee</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月1日上午11:27:29</p>
 * <p>Description:TODO</p>
 */
public class Employee {
    private Long id;
    private String name;
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
    @Override
    public String toString() {
        return "Employee [id=" + id + ", name=" + name + "]";
    }
    
    
}
