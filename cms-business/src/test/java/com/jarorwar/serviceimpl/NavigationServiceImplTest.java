package com.jarorwar.serviceimpl;

import com.jarorwar.model.Navigation;
import com.jarorwar.service.INavigationService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.util.Assert;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 12-9-14
 * Time: 下午5:04
 * To change this template use File | Settings | File Templates.
 */
@RunWith(SpringJUnit4ClassRunner.class)//指定要使用的测试框架
@ContextConfiguration({"/applicationContext.xml"})// 指定配置文件的位置,可以配置多个
@TransactionConfiguration(transactionManager ="transactionManager",defaultRollback = false)
public class NavigationServiceImplTest {
    private Logger logger = LoggerFactory.getLogger(NavigationServiceImplTest.class);
    @Autowired
    private INavigationService navigationService;

    @Test
    public void testGetNavigationList() throws Exception {
        List<Navigation> navigationList =navigationService.getNavigationList(null) ;
                Navigation nav = new Navigation();
        logger.debug("共有{}个导航",navigationList.size());
        nav.setDeleteflag(1);
        List<Navigation> enabledNavigationList =navigationService.getNavigationList(nav)  ;
        logger.debug("共有{}个启用的导航",enabledNavigationList.size()) ;
        nav.setDeleteflag(0);
        List<Navigation> disabledNavigationList =navigationService.getNavigationList(nav)  ;
        logger.debug("共有{}个禁用的导航",disabledNavigationList.size());
    }

    @Test
    public void testupdateNavigation()throws Exception{
        Navigation nav = new Navigation();
        nav.setId("123412341234");
        nav.setUrl("/123123.shtml");
        int rs = navigationService.updateNavigation(nav);
        Assert.isTrue(rs == 1);

    }

    @Test
    public void testDeleteNavigationById(){
         int rs = navigationService.deleteNavigationById("123412341234");
        Assert.isTrue(rs == 1);
    }

    @Test
    public void testAddNavigation(){
        Navigation nav = new Navigation();
        nav.setId("123412341234");
        nav.setNavigationName("测试导航");
        nav.setUrl("/123123.shtml");
        nav.setColor("#ffffff");
        nav.setCreateTime(new Date());
        nav.setLinkOpenType(0);
        nav.setNavigationNo("test");
        nav.setOrderSn(11111);
        int rs = navigationService.addNavigation(nav);
        Assert.isTrue( rs ==1);
    }
}
