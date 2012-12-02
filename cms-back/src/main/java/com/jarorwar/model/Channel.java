package com.jarorwar.model;

import java.io.Serializable;

/**
 * User: mimiloveququ
 * Date: 12-12-2
 * Time: 上午12:47
 * 频道
 */

public class Channel implements Serializable{
    private String id;

    private String channelName;
    private String navId;
    private Byte statu;    //状态 1启用，0禁用。默认0

    public Byte getStatu() {
        return statu;
    }

    public void setStatu(Byte statu) {
        this.statu = statu;
    }

    public String getNavId() {
        return navId;
    }

    public void setNavId(String navId) {
        this.navId = navId;
    }

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    @Override
    public String toString() {
        return "Channel{" +
                "id='" + id + '\'' +
                ", channelName='" + channelName + '\'' +
                ", navId='" + navId + '\'' +
                '}';
    }
}
