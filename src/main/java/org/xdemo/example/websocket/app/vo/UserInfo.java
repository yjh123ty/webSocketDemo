/**
 * Project Name:websocketDemo
 * File Name:UserInfo.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.app.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>Title:UserInfo</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月1日下午3:37:33</p>
 * <p>Description:TODO</p>
 */
@ApiModel(value = "用户信息")
public class UserInfo {
    
    @ApiModelProperty(value="昵称")
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}
