/**
* Project Name:websocketDemo
 * File Name:AbstractSpringTest.java
 * Copyright (c) 2016
 */
package test;

import static org.junit.Assert.*;

import org.activiti.engine.ProcessEngine;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * <p>Title:AbstractSpringTest</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月1日下午2:00:27</p>
 * <p>Description:TODO</p>
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class AbstractSpringTest {
    @Test
    public void testName() throws Exception {
        System.err.println("test");
    }
    
}
