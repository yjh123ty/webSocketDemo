/**
 * Project Name:websocketDemo
 * File Name:IWorkFlowService.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * <p>Title:IWorkFlowService</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月2日上午9:46:26</p>
 * <p>Description:TODO</p>
 */
public interface IWorkFlowService {
    /**
     * 部署一个新流程
     * @param processName
     * @param inputStream
     */
    void newDeploy(String processName, InputStream inputStream);
    
    /**
     * 流程规则数据展示
     * @return
     */
    List<Map<String,Object>> listProcessDefinition();

    /**
     * 根据流程的key启动流程
     * @param processKey 流程定义Key
     * @param processVarMap 流程变量  
     */
    void startProcess(String processDefinitionKey, Map<String, Object> processVarMap);

    /**
     * 任务列表展示
     * @param asignee 办理人
     */
    List<Map<String, Object>> listPersonalTask(String asignee);

    /**
     * 根据任务ID完成任务
     * @param taskId
     */
    void completeTask(String taskId);

    /**
     * 根据流程ID删除流程
     * @param processId
     */
    void deleteProcessDefinition(String processId);
    
}
