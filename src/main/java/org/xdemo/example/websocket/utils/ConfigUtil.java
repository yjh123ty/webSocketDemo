/**
 * Project Name:websocketDemo
 * File Name:ConfigUtil.java
 * Copyright (c) 2016
 */
package org.xdemo.example.websocket.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.io.IOUtils;

/**
 * <p>Title:ConfigUtil</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月2日下午5:15:54</p>
 * <p>Description:配置文件的工具类</p>
 */
public class ConfigUtil {
    private static String IMG_HOST;
    private static String IMG_UPLOAD_PATH;
    
    static{
        Properties properties = new Properties();
        InputStream in = ConfigUtil.class.getResourceAsStream("/config.properties");
        try {
            properties.load(in);
            IMG_HOST = properties.getProperty("img_host").trim();
            IMG_UPLOAD_PATH = properties.getProperty("img_upload_path").trim();
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            IOUtils.closeQuietly(in);
        }
    }

    public static String getImgHost() {
        return IMG_HOST;
    }

    public static String getImgUploadPath() {
        return IMG_UPLOAD_PATH;
    }
    
}
