package com.jarorwar.persistence.mybatis.dialect;

/**
 * MySql分页处理类
 * 
 * @author chu.yx
 * @version 2012-7-9
 */
public class MysqlDialect extends Dialect {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.mybatis.dialect.Dialect#getLimitString(java.lang.String, int,
	 * int)
	 */
	@Override
	public String getLimitString(String sql, int skipResults, int maxResults) {
		if (skipResults > 0) {
			return sql + " limit " + skipResults + "," + maxResults;
		}
		return sql + " limit " + maxResults;
	}

}
