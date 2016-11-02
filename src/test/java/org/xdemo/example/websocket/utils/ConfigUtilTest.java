/**
 * Project Name:websocketDemo
 * File Name:ConfigUtilTest.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.utils;

import static org.junit.Assert.*;

import org.junit.Test;

import test.AbstractSpringTest;

/**
 * <p>Title:ConfigUtilTest</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月2日下午5:31:51</p>
 * <p>Description:TODO</p>
 */
public class ConfigUtilTest extends AbstractSpringTest{
    @Test
    public void testName() throws Exception {
        System.err.println(ConfigUtil.getImgHost());
    }
}
