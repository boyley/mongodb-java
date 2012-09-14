package com.jarorwar.persistence.mybatis.dialect;

/**
 * 
 *
 * @author chu.yx
 * @version 2012-7-9
 */
public class OracleDialect extends Dialect {

	/* (non-Javadoc)
	 * @see com.mybatis.dialect.Dialect#getLimitString(java.lang.String, int, int)
	 */
	@Override
	public String getLimitString(String sql, int skipResults, int maxResults) {
		sql = sql.trim();    
        StringBuffer pagingSelect = new StringBuffer(sql.length() + 100);    
            
        pagingSelect.append("select * from ( select row_.*, rownum rownum_ from ( ");    
            
        pagingSelect.append(sql);    
            
        pagingSelect.append(" ) row_ ) where rownum_ > ").append(skipResults).append(" and rownum_ <= ").append(skipResults + maxResults);    
            
        return pagingSelect.toString();
	}

}
