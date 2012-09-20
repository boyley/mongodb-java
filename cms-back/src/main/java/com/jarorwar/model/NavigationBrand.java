package com.jarorwar.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 导航品牌
 */
public class NavigationBrand implements Serializable{

	private String id;

    private Navigation navigation;

   private String brand;

    private Integer isDisplay;

    private Integer orderSn;

    private String url;

    private Date createTime;

    private Integer linkOpenType;

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Navigation getNavigation() {
        return navigation;
    }

    public void setNavigation(Navigation navigation) {
        this.navigation = navigation;
    }

    public Integer getDisplay() {
        return isDisplay;
    }

    public void setDisplay(Integer display) {
        isDisplay = display;
    }

    public Integer getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(Integer orderSn) {
        this.orderSn = orderSn;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getLinkOpenType() {
        return linkOpenType;
    }

    public void setLinkOpenType(Integer linkOpenType) {
        this.linkOpenType = linkOpenType;
    }
}