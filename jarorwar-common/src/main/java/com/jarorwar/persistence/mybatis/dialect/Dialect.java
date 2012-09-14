package com.jarorwar.persistence.mybatis.dialect;

/**
 * 
 *
 * @author chu.yx
 * @version 2012-7-9
 */
public abstract class Dialect {

	public static enum Type{    
        MYSQL,    
        ORACLE
    }    

    public abstract String getLimitString(String sql, int skipResults, int maxResults);  
}
