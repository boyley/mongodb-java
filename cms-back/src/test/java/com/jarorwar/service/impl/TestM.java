package com.jarorwar.service.impl;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 * User: mimiloveququ
 * Date: 12-10-17
 * Time: 下午11:36
 * To change this template use File | Settings | File Templates.
 */
public class TestM {
    @Test
    public void teast(){
        System.out.println('a');
    }

    private List<Pictures> getPicList(){
         List<Pictures> pictureses =new ArrayList<Pictures>();
        for(int i=0;i<7;i++){
            Pictures pictures =new Pictures();
            pictures.setCommodityNo("112233");
            pictures.setImageName("112233-"+(i+1));
            pictures.setPath("/img/");
            pictures.setType("b");
        }
        return pictureses;
    }

}
