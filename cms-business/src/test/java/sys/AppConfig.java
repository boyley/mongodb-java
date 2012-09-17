package sys;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.lang.reflect.Field;

/**
 * 用来测试系统的配置
 */
//@RunWith(SpringJUnit4ClassRunner.class)//指定要使用的测试框架
//@ContextConfiguration({"/applicationContext.xml"})// 指定配置文件的位置,可以配置多个
//@TransactionConfiguration(transactionManager ="transactionManager",defaultRollback = false)
public class AppConfig {
   private static final Logger log = LoggerFactory.getLogger(AppConfig.class);
    @Test
    public void testAppConfig(){
        Field[]  fields = Object.class.getDeclaredFields();
        for(Field f:fields){

            log.debug(f.getName());
        }
   }

    @Test
    public void testSpringStringUtils(){

         log.debug("{}",StringUtils.trimWhitespace("  hello world  ").length());
    }
}

