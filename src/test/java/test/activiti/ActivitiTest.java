/**
 * Project Name:websocketDemo
 * File Name:ActivitiTest.java
 * Copyright (c) 2016
 */
package test.activiti;

import static org.junit.Assert.*;

import java.io.InputStream;
import java.util.zip.ZipInputStream;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import test.AbstractSpringTest;

/**
 * <p>Title:ActivitiTest</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月2日下午1:45:41</p>
 * <p>Description:TODO</p>
 */
public class ActivitiTest extends AbstractSpringTest{
    
    @Autowired
    private RepositoryService repositoryService;
    
    /**
     * 
     *  <p>Author:yjh;</p>
     *  <p>Date:2016年11月2日下午1:45:59;</p>
     *	<p>Description: 部署流程;</p>
     *  @throws Exception
     */
    @Test
    public void testDeploy() throws Exception {
    }
}
