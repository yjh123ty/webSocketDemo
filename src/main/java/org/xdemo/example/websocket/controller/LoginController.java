/**
 * Project Name:websocketDemo
 * File Name:LoginController.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xdemo.example.websocket.entity.AjaxResult;
import org.xdemo.example.websocket.entity.User;
import org.xdemo.example.websocket.service.IUserService;
import org.xdemo.example.websocket.utils.MD5Util;
import org.xdemo.example.websocket.utils.UserContext;


/**
 * <p>Title:LoginController</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月2日下午1:05:17</p>
 * <p>Description:TODO</p>
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    
    @Autowired
    private IUserService userService;
    
    @RequestMapping("/index.do")    
    public String index(){
        return "forward:/login.jsp";
    }
    
    @RequestMapping("/checkLogin.do")
    @ResponseBody
    public AjaxResult checkLogin(String name,String password){
        
        if(StringUtils.isBlank(name)){
            return AjaxResult.fail("用户名不能为空！"); 
        }
        
        if(StringUtils.isBlank(password)){
            return AjaxResult.fail("密码不能为空！"); 
        }
        
        try{
            // 检查登录
            User user = userService.checkLogin(name);
            
            //系统内无该员工
            if(user == null){
                return AjaxResult.fail("登录失败，系统内无该员工！"); 
            }
            
            // 对密码进行加密
            password = MD5Util.MD5(password);
            
            //密码不正确
            if(!password.equals(user.getPassword())){
                return AjaxResult.fail("登录失败，密码不正确！");
            }
            //登录了把用户放入session
            UserContext.setUser(user);
            // 封装响应信息
            return AjaxResult.success("登录成功");
        }catch(Exception e){
            // 封装响应信息
            return AjaxResult.fail("登录失败，"+e.getMessage()+"!");
        }
    }
}
