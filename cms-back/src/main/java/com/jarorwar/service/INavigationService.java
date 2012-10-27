package com.jarorwar.service;

import com.jarorwar.model.Navigation;
import com.jarorwar.model.NavigationBrand;
import com.jarorwar.model.NavigationKeyword;

import java.util.List;

/**
 * User: minxr
 * Date: 12-9-14
 * Time: 下午4:58
 *   导航服务接口类，处理跟导航相关的
 */
public interface INavigationService {
    /**
     *
     * @param navigation 导航对象，主要是复用查询
     * @return
     */
    public List<Navigation> getNavigationList(Navigation navigation) throws Exception;

    /**
     *  更新一个Navigation
     *  更新对象的时候只需要组装一个新对象，将需要更新的属性赋值即可
     *  注意（id是必须的）如果一个待更新的对象没有id，将会出现错误
     * @param navigation
     * @return
     */
    public int updateNavigation(Navigation navigation) throws Exception;

    /**
     * 按id删除一个频道
     * @param id
     * @return
     */
    public int deleteNavigationById(String id) throws Exception;

    /**
     * 添加一个导航
     * @param navigation
     * @return
     */
    public int addNavigation(Navigation navigation) throws Exception;

    public Navigation getNavigationById(String id) throws Exception;

    public List<NavigationKeyword> getRootNavigationKeywords(Integer keywordType, String channelId);

    public NavigationKeyword getNavigationKeywordById(String id);

    public int addNavigationKeyword(NavigationKeyword navigationKeyword);

    public List<NavigationBrand> getNavigationBrandByNavigation(String id);
    List<NavigationBrand> getNavigationBrandWithNavigtion();

    /**
     * 启用或者禁用导航
     * @param id
     * @param deleteFlag
     * @return
     */
    int changeNavDeleteFlag(String id,Integer deleteFlag) throws Exception;

}
