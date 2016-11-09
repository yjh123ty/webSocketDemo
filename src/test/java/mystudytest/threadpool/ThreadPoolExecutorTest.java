/**
 * Project Name:websocketDemo
 * File Name:ThreadPoolExecutorTest.java
 * Copyright (c) 2016
 */
package mystudytest.threadpool;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * <p>Title:ThreadPoolExecutorTest</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年11月7日下午2:41:28</p>
 * <p>Description:创建一个可缓存线程池，如果线程池长度超过处理需要，可灵活回收空闲线程，若无可回收，则新建线程。</p>
 */
public class ThreadPoolExecutorTest {
    
    public static void main(String[] args) {
        ExecutorService cachedThreadPool = Executors.newCachedThreadPool();
        for (int i = 0; i < 10; i++) {  
            final int index = i;  
            try {  
             Thread.sleep(index * 1000);  
            } catch (InterruptedException e) {  
             e.printStackTrace();  
            }  
            cachedThreadPool.execute(new Runnable() {  
             public void run() {  
              System.out.println(index);  
             }  
            });  
       }  
    }
}
