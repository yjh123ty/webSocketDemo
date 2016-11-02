/**
 * Project Name:websocketDemo
 * File Name:ActivitiController.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.xdemo.example.websocket.entity.AjaxResult;
import org.xdemo.example.websocket.service.IWorkFlowService;

/**
 * <p>Title:ActivitiController</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月1日下午5:49:39</p>
 * <p>Description:TODO</p>
 */
@Controller  
@RequestMapping("/workflow")  
public class WorkFlowController {
    @Autowired
    private IWorkFlowService workflowService; 
    
    /**
     * 工作流页面导向
     * @return
     */
    @RequestMapping("/processDefinition.do")
    public String processDefinition(){
        return "workflow/processDefinition";
    }
    
    /**
     * 部署流程
     * @param processName
     * @param processFile
     * @return
     */
    @RequestMapping("/newDeploy.do")
    @ResponseBody
    public AjaxResult newDeploy(String processName, MultipartFile processFile){
        
        try {
            // 部署流程
            workflowService.newDeploy(processName, processFile.getInputStream());
            return new AjaxResult(true,"流程部署成功！！");
        } catch (IOException e) {
            e.printStackTrace();
            return new AjaxResult(false,"流程部署失败！！");
        }
    }
    
    /**
     * 流程定义展示
     * @return
     */
    @RequestMapping("/listProcessDefinition.do")
    @ResponseBody
    public List<Map<String,Object>> listProcessDefinition(){
        List<Map<String,Object>> list = workflowService.listProcessDefinition();
        return list;
    }
    
    /**
     * 删除流程
     * @return
     */
    @RequestMapping("/deleteProcessDefinition.do")
    @ResponseBody
    public AjaxResult deleteProcessDefinition(String processId){
        try {
            workflowService.deleteProcessDefinition(processId);
            return new AjaxResult(true,"删除流程成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(false,"删除流程失败！");
        }
    }
   
}
