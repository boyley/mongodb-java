package com.jarorwar.service.impl;

import com.jarorwar.model.Navigation;
import com.jarorwar.model.NavigationBrand;
import com.jarorwar.model.NavigationKeyword;
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
        logger.debug("共有{}个禁用的导航", disabledNavigationList.size());
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
    public void testDeleteNavigationById() throws Exception {
        int rs = navigationService.deleteNavigationById("123412341234");
        Assert.isTrue(rs == 1);
    }

    @Test
    public void testAddNavigation() throws Exception {
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
    @Test
    public void testGetRootNavigationKeywords() throws Exception {
        List<NavigationKeyword>   kws= navigationService.getRootNavigationKeywords(0, "4028537434b1ffe50134b2266ab7000b");
        for(NavigationKeyword keyword:kws){
            System.out.println(keyword);
        }
    }

    @Test
    public void testGetNavigationById() throws Exception {
        logger.debug("{}",navigationService.getNavigationById("4028537434b1ffe50134b2266ab7000b"));
    }

    @Test
    public void testGetKeyWordById(){                                          //4028537434b285860134b2bcba5c00a6
        NavigationKeyword  kw=(navigationService.getNavigationKeywordById("2c94812534ecb87f0134ee71740a0002"));
        //logger.debug("keyword Name: {},keyword parent:{},keyword sub:{}, ",new Object[]{kw.getKeywordName(),kw.getParentKeyword(),kw.getSubKeywords()});
        if(kw!=null){
            if(kw.getParentKeyword() !=null){
                System.out.println(kw.getParentKeyword().getKeywordName());
                System.out.println("   ");
            }
            System.out.println("    "+kw.getKeywordName());
            if(kw.getSubKeywords() != null && kw.getSubKeywords().size()>0){
                for(NavigationKeyword keyword:kw.getSubKeywords()){
                    System.out.println("        "+keyword.getKeywordName());
                }
            }
        }else{
            System.out.println("没有数据！");
        }
    }

    @Test
    public void testAddKeywords() throws Exception {
        NavigationKeyword kw   = new NavigationKeyword();
        Navigation navigation = navigationService.getNavigationById("1ad22b9a02ed11e2a4d3047d7bb42199");
        kw.setNavigation(navigation);
        kw.setDisplay(1);
        kw.setKeywordName("tesa");
        kw.setKeywordType(NavigationKeyword.KEYWORD_TYPE_KEYWORD);
        kw.setLinkOpenType(0);
        kw.setUrl("/testa.html");
        navigationService.addNavigationKeyword(kw);

    }

    @Test
    public void testGetNavigationBrandByNavigation(){
        List<NavigationBrand> navigationBrands = navigationService.getNavigationBrandByNavigation("4028537434b1ffe50134b2266ab7000b");
        Assert.isTrue(navigationBrands != null && navigationBrands.size() > 0, "没有找到相应的结果!");
        for(NavigationBrand b:navigationBrands){
            System.out.println(b.getNavigation());
        }
        logger.debug("共有{}个品牌",navigationBrands.size());
    }
    @Test
    public void testGetNavigationBrandWithNavigtion(){
        List<NavigationBrand> navigationBrands =   navigationService.getNavigationBrandWithNavigtion();
        for(NavigationBrand b:navigationBrands){
            System.out.println(b.getNavigation());
        }
    }
}
