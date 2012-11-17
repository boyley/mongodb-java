package com.jarorwar.service.impl;

import org.junit.Test;

import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 * User: mimiloveququ
 * Date: 12-10-17
 * Time: 下午11:36
 * To change this template use File | Settings | File Templates.
 */
public class TestM {
    public static void main(String[] args) {
        long start = System.currentTimeMillis();
        for(int i=0;i<100000;i++){
            getId();
        }
        System.out.println(System.currentTimeMillis()-start);
    }


    @Test
    public void teast(){
        System.out.println('a');
    }

    public static String getId(){
        return UUID.randomUUID().toString().replaceAll("-","").toLowerCase();
    }
}
