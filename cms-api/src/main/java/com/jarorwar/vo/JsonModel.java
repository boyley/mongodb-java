package com.jarorwar.vo;

import java.io.Serializable;
import java.util.List;

/**
 * User: jarorwar
 * Date: 12-9-16
 * Time: 下午10:15
 * 请在此处加注释
 */
public class JsonModel implements Serializable {
    private String msg;
    private String result;
    private List<Object> data;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public List<Object> getData() {
        return data;
    }

    public void setData(List<Object> data) {
        this.data = data;
    }
}
