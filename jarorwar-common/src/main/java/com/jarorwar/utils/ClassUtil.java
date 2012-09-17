package com.jarorwar.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * User: jarorwar
 * Date: 12-9-15
 * Time: 下午7:31
 * 判断此类实例的对象是否为空
 */
public class ClassUtil {
    public static  boolean isNull(Object o){
       boolean isNull = false;
        Field[]  fields = Object.class.getDeclaredFields();
        Method[]  methods = Object.class.getDeclaredMethods();
        for(Field f:fields){
            System.out.println(f.getName());
        }
        for (Method m:methods){
            System.out.println(m.getName());
        }
        return isNull;
    }
}
