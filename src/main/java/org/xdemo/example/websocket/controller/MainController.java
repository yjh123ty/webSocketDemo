/**
 * Project Name:websocketDemo
 * File Name:MainController.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    
    @RequestMapping("/index.do")
    public String index(){
        return "main";
    }
}
