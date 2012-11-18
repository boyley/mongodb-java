package com.jarorwar.utils;

/**
 * Created with IntelliJ IDEA.
 * User: mimiloveququ
 * Date: 12-11-19
 * Time: 上午12:30
 * To change this template use File | Settings | File Templates.
 */
public class StringUtils {
    public static boolean isNotBlank(String str){
        if(str == null || str.trim().equals("")){
            return false;
        }else{
            return true;
        }
    }
    public static String trim(String str){
        if(str == null){
            return "";
        }else{
            return str.trim();
        }
    }
}
