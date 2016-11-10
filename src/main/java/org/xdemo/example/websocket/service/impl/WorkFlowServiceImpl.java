/**
 * Project Name:websocketDemo
 * File Name:WorkFlowServiceImpl.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.service.impl;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

import org.activiti.engine.FormService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xdemo.example.websocket.query.PageList;
import org.xdemo.example.websocket.service.IWorkFlowService;
import org.xdemo.example.websocket.utils.CommUtil;

/**
 * <p>Title:WorkFlowServiceImpl</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月2日上午9:46:53</p>
 * <p>Description:TODO</p>
 */
@Service
public class WorkFlowServiceImpl implements IWorkFlowService{
    
    @Autowired
    private RepositoryService repositoryService;
    
    @Autowired
    private RuntimeService runtimeService;
    
    @Autowired
    private TaskService taskService;
    
    @Autowired
    private FormService formService;

    /* (non-Javadoc)
     * @see org.xdemo.example.websocket.service.IWorkFlowService#newDeploy(java.lang.String, java.io.InputStream)
     */
    @Override
    public void newDeploy(String processName, InputStream inputStream) {
      //创建发布的配置对象
        DeploymentBuilder builder = repositoryService.createDeployment();
        //做配置
        ZipInputStream zipInputStream = new ZipInputStream(inputStream);
        builder
            .name(processName)
            .addZipInputStream(zipInputStream);
        //应用配置，发布流程
        builder.deploy();
    }

    /* (non-Javadoc)
     * @see org.xdemo.example.websocket.service.IWorkFlowService#listProcessDefinition()
     */
    @Override
    public PageList<Map<String, Object>> listProcessDefinition() {
        // 声明
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        // 做封装
        List<ProcessDefinition> pds = repositoryService
                                        .createProcessDefinitionQuery()
                                        .orderByProcessDefinitionKey().asc() 
                                        .orderByProcessDefinitionVersion().desc()
                                        .list();
        for (ProcessDefinition pd : pds) {
            //使用工具，将String数组转换为map结构
            Map<String, Object> map = CommUtil.obj2map(pd, new String[]{"id","name","key","version","description","deploymentId","resourceName","diagramResourceName"});
            list.add(map);
        }
        //统计已部署流程定义的数量
        long count = repositoryService.createProcessDefinitionQuery().count();
        // 封装分页对象
        PageList<Map<String, Object>> pageList = new PageList<>();
        pageList.setRows(list);
        pageList.setTotal(count);
        // 返回
        return pageList;
    }

    /* (non-Javadoc)
     * @see org.xdemo.example.websocket.service.IWorkFlowService#startProcess(java.lang.String, java.util.Map)
     */
    @Override
    public void startProcess(String processDefinitionKey, Map<String, Object> processVarMap) {
        // TODO Auto-generated method stub
        
    }

    /* (non-Javadoc)
     * @see org.xdemo.example.websocket.service.IWorkFlowService#listPersonalTask(java.lang.String)
     */
    @Override
    public List<Map<String, Object>> listPersonalTask(String asignee) {
        // TODO Auto-generated method stub
        return null;
    }

    /* (non-Javadoc)
     * @see org.xdemo.example.websocket.service.IWorkFlowService#completeTask(java.lang.String)
     */
    @Override
    public void completeTask(String taskId) {
        // TODO Auto-generated method stub
        
    }

    /* (non-Javadoc)
     * @see org.xdemo.example.websocket.service.IWorkFlowService#deleteProcessDefinition(java.lang.String)
     */
    @Override
    public void deleteProcessDefinition(String processId) {
        repositoryService.deleteDeployment(processId,true);
    }

    
}
