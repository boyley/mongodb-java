package com.jarorwar.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NavigationKeyword implements Serializable{
    public static final Integer KEYWORD_TYPE_KEYWORD = 0;

    public static final Integer KEYWORD_TYPE_CAT = 1;
    private String id;

    private String url;

    private Navigation navigation;

    private Integer orderSn;

    private Integer isDisplay;

    private Date createTime;

    private List<NavigationKeyword> subKeywords = new ArrayList<NavigationKeyword>();
    private NavigationKeyword parentKeyword;
    /**
     * 关键字类型：0 - 关键字; 1 - 分类
     */
    private Integer keywordType;

    private Integer linkOpenType;

    private String keywordName;

    private String color;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Navigation getNavigation() {
        return navigation;
    }

    public void setNavigation(Navigation navigation) {
        this.navigation = navigation;
    }

    public Integer getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(Integer orderSn) {
        this.orderSn = orderSn;
    }

    public Integer getDisplay() {
        return isDisplay;
    }

    public void setDisplay(Integer display) {
        isDisplay = display;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }



    public Integer getKeywordType() {
        return keywordType;
    }

    public void setKeywordType(Integer keywordType) {
        this.keywordType = keywordType;
    }

    public Integer getLinkOpenType() {
        return linkOpenType;
    }

    public void setLinkOpenType(Integer linkOpenType) {
        this.linkOpenType = linkOpenType;
    }

    public String getKeywordName() {
        return keywordName;
    }

    public void setKeywordName(String keywordName) {
        this.keywordName = keywordName;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public List<NavigationKeyword> getSubKeywords() {
        return subKeywords;
    }

    public void setSubKeywords(List<NavigationKeyword> subKeywords) {
        this.subKeywords = subKeywords;
    }

    public NavigationKeyword getParentKeyword() {
        return parentKeyword;
    }

    public void setParentKeyword(NavigationKeyword parentKeyword) {
        this.parentKeyword = parentKeyword;
    }

    @Override
    public String toString() {
        return "NavigationKeyword{" +
                "id='" + id + '\'' +
                ", url='" + url + '\'' +
                ", orderSn=" + orderSn +
                ", isDisplay=" + isDisplay +
                ", createTime=" + createTime +
                ", subKeywords=" + subKeywords +
                ", parentKeyword=" + parentKeyword +
                ", keywordType=" + keywordType +
                ", linkOpenType=" + linkOpenType +
                ", keywordName='" + keywordName + '\'' +
                ", color='" + color + '\'' +
                '}';
    }
}