package com.jarorwar.vo;

import java.io.Serializable;
import java.util.List;

/**
 * User: jarorwar
 * Date: 12-9-16
 * Time: 下午10:15
 * 请在此处加注释
 */
public class JsonModel<T> implements Serializable {
    private String msg;
    private String result;
    private List<T> data;
    private int total;
    private List<T> rows;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

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

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
