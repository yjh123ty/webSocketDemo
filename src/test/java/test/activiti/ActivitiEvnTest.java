/**
 * Project Name:websocketDemo
 * File Name:ActivitiEvnTest.java
 * Copyright (c) 2016
 */
package test.activiti;

import javax.annotation.Resource;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.junit.Test;

import test.AbstractSpringTest;

/**
 * <p>Title:ActivitiEvnTest</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月1日下午4:26:28</p>
 * <p>Description:TODO</p>
 */
public class ActivitiEvnTest extends AbstractSpringTest{
    
    @Resource  
    private RepositoryService repositoryService;  
    @Resource  
    private RuntimeService runtimeService;  
    @Resource   
    TaskService taskService;  
    
    @Test
    public void testName() throws Exception {
        System.err.println(repositoryService);
    }
}
