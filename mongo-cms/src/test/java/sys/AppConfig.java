package sys;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 用来测试系统的配置
 */
@RunWith(SpringJUnit4ClassRunner.class)//指定要使用的测试框架
@ContextConfiguration({"/applicationContext.xml"})// 指定配置文件的位置,可以配置多个
//@TransactionConfiguration(transactionManager ="transactionManager",defaultRollback = false)
public class AppConfig {
    private static final Logger log = Logger.getLogger(AppConfig.class);
    @Autowired
    private MongoTemplate mongoTemplate;
        @Test
       public void testMongodb(){
           //  mongoTemplate.save("{'username':'minxr','age',23}");
           // mongoTemplate.dropCollection("string");
            List<Integer> list = new ArrayList<Integer>();
            List<Integer> newlist = new ArrayList<Integer>();
            for(int i=0;i<10;i++){
                   list.add(i);
            }
            Iterator<Integer> iter = list.iterator();
           while (iter.hasNext()){
               int temp = iter.next();
                if(temp%2==0){
                    iter.remove();
                    newlist.add(temp);
                }
            }
            list.addAll(newlist);
            System.out.println(list);
}
}
