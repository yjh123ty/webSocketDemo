package org.xdemo.example.websocket.utils;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.xdemo.example.websocket.entity.User;

/**
  * @ClassName: UserContext
  * @Description: 用户上下文工具类
  * 	1. 获取当前用户的session
  *     2. 获取当前用户
  * @author yjh
  * @date 2016年8月2日 下午6:52:10
  *
  */
public class UserContext {
	
	/**
	 * 用户存在session中的key
	 */
	public static final String USER_IN_SESSION = "userInSession";
	
	/**
	  * getRequest(获取http请求)
	  * 
	  * @return HttpServletRequest 当前用户的http请求
	 */
	public static  HttpServletRequest getRequest(){
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
	}
	
	/**
	  * getSession(获取http 会话)
	  * 
	  * @return HttpSession 当前用户的http session
	 */
	public static  HttpSession getSession(){
		return getRequest().getSession();
	}
	
	/**
	  * setUser(保存当前用户到session中)
	  * @param employee 当前登录的员工
	 */
	public static void setUser(User user){
		getSession().setAttribute(USER_IN_SESSION, user);
	}
	
	/**
	 * getUser(从session中获取当前用户)
	 * @return 当前登录的员工
	 */
	public static User getUser(){
		return (User) getSession().getAttribute(USER_IN_SESSION);
	}

    /**
     *  <p>Author:zh;</p>
     *  <p>Date:2016年10月17日上午11:51:16;</p>
     *	<p>Description: 删除session中的用户;</p>
     */
    public static void removeUser() {
        getSession().removeAttribute(USER_IN_SESSION);
    }
}
