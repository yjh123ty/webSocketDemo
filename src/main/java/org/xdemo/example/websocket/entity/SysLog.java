package org.xdemo.example.websocket.entity;

import java.util.Date;

/**
 * <p>Title:SysLog</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月15日上午11:03:22</p>
 * <p>Description:系统日志</p>
 */
public class SysLog {
    private Long id;
    private String username;
    
    /**
     * 访问路径
     */
    private String requestUrl;
    
    /**
     * 访问的方法
     */
    private String oprName;
    
    private String oprIp;
    
    private Date oprTime;
    
    private String oprDetail;
    
    private Boolean isException;
    

    public String getOprDetail() {
        return oprDetail;
    }

    public void setOprDetail(String oprDetail) {
        this.oprDetail = oprDetail;
    }

    public Boolean getIsException() {
        return isException;
    }

    public void setIsException(Boolean isException) {
        this.isException = isException;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRequestUrl() {
        return requestUrl;
    }

    public void setRequestUrl(String requestUrl) {
        this.requestUrl = requestUrl;
    }

    public String getOprName() {
        return oprName;
    }

    public void setOprName(String oprName) {
        this.oprName = oprName;
    }

    public String getOprIp() {
        return oprIp;
    }

    public void setOprIp(String oprIp) {
        this.oprIp = oprIp;
    }

    public Date getOprTime() {
        return oprTime;
    }

    public void setOprTime(Date oprTime) {
        this.oprTime = oprTime;
    }
    
    
    
}
