package com.jarorwar.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 导航
 */
public class Navigation implements Serializable {
    private String id;
    private String navigationName;
    private Integer orderSn;
    private Integer deleteflag = 1;
    private String navigationNo;

    /** 频道链接地址 */
    private String url;

    /** 是否有子频道 */
    private boolean hasChild;

    private Date createTime;

    /**
     * 链接打开方式：0 - 新窗口打开; 1 - 原窗口打开
     */
    private Integer linkOpenType = 1;

    /**
     * 导航文本颜色RGB值
     */
    private String color;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNavigationName() {
        return navigationName;
    }

    public void setNavigationName(String navigationName) {
        this.navigationName = navigationName;
    }

    public Integer getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(Integer orderSn) {
        this.orderSn = orderSn;
    }

    public Integer getDeleteflag() {
        return deleteflag;
    }

    public void setDeleteflag(Integer deleteflag) {
        this.deleteflag = deleteflag;
    }

    public String getNavigationNo() {
        return navigationNo;
    }

    public void setNavigationNo(String navigationNo) {
        this.navigationNo = navigationNo;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public boolean isHasChild() {
        return hasChild;
    }

    public void setHasChild(boolean hasChild) {
        this.hasChild = hasChild;
    }

    public Integer getLinkOpenType() {
        return linkOpenType;
    }

    public void setLinkOpenType(Integer linkOpenType) {
        this.linkOpenType = linkOpenType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "Navigation{" +
                "id='" + id + '\'' +
                ", navigationName='" + navigationName + '\'' +
                ", orderSn=" + orderSn +
                ", deleteflag=" + deleteflag +
                ", navigationNo='" + navigationNo + '\'' +
                ", url='" + url + '\'' +
                ", hasChild=" + hasChild +
                ", createTime=" + createTime +
                ", linkOpenType=" + linkOpenType +
                ", color='" + color + '\'' +
                '}';
    }
}