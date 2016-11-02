package org.xdemo.example.websocket.entity;

/**
 * <p>Title:Printer</p>
 * @author yjh
 * @version	v1.0
 * <p>Date:2016年10月27日下午6:15:07</p>
 * <p>Description:打印机</p>
 */
public class Printer {
    /**
     * 打印机状态
     */
    public enum PrinterStatus {

        /** 在线 */
        online,

        /** 离线 */
        offline,

        /** 缺纸 */
        paperOut,

    }
    
    /** 打印机编号 */
    private String        printer_id;

    /** 打印机名称 */
    private String        name;

    /** 打印机状态 */
    private PrinterStatus printerStatus;
    /** 用户ID */
    private String        partner;

    /** 打印机终端号 */
    private String        machine_code;

    /** API密钥 */
    private String        apiKey;

    /** 打印机密钥 */
    private String        mKey;

    /** 所属分店 */
//    private Station       shop;
}
