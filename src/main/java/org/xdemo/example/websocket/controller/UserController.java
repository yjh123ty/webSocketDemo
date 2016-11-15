/**
 * Project Name:websocketDemo
 * File Name:UserController.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xdemo.example.websocket.entity.AjaxResult;
import org.xdemo.example.websocket.entity.User;
import org.xdemo.example.websocket.exception.BizExecption;
import org.xdemo.example.websocket.query.BaseQuery;
import org.xdemo.example.websocket.query.PageList;
import org.xdemo.example.websocket.service.IUserService;
import org.xdemo.example.websocket.utils.UserContext;
import org.xdemo.example.websocket.utils.VerifyUtil;



/**
 * <p>Title:UserController</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月9日下午5:45:16</p>
 * <p>Description:TODO</p>
 */
@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    private IUserService userService;
    
    @RequestMapping("/index.do")
    public String index(){
        return "user/user";
    }
    
    @RequestMapping("/list.do")
    @ResponseBody
    public PageList<User> list(BaseQuery baseQuery){
        return userService.getPageList(baseQuery);
    }
    
    @RequestMapping("/listAll.do")
    @ResponseBody
    public List<User> listAll(){
        return userService.getAll();
    }
    
    @RequestMapping("/logout.do")
    public String logout(){
        UserContext.removeUser();
        return "redirect:/login/index.do";
    }
    
    @RequestMapping(value="/changePassword.do", method=RequestMethod.POST)
    @ResponseBody
    public AjaxResult changePassword(String oldPassword, String newPassword){
        try {
            if(StringUtils.isBlank(oldPassword)){
                return AjaxResult.fail("旧密码不能为空");
            }
            
            if(!VerifyUtil.checkSysPassword(newPassword)){
                return AjaxResult.fail("长度在6~20之间，只能包含字符、数字和下划线");
            }
            
            if(StringUtils.equals(oldPassword, newPassword)){
                return AjaxResult.fail("输入的旧密码和原密码相同");
            }
            
            if(userService.changePassword(oldPassword,newPassword)){
                return AjaxResult.success("密码修改成功");
            }else {
                return AjaxResult.fail("原密码错误");
            }
        } catch (BizExecption e) {
            return AjaxResult.fail(e.getMessage());
        }catch (Exception e) {
            return AjaxResult.fail("系统异常");
        }
    }
}
