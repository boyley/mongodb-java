package com.jarorwar.mapper;

import com.jarorwar.model.Navigation;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: minxr
 * Date: 12-9-14
 * Time: 下午4:53
 * 导航mybatis接口类.
 */
public interface NavigationMapper {
    //因为少，所以不需要分页了都
    List<Navigation> queryByNav(Navigation navigation);

    /**
     * 更新一个导航
     * @param navigation
     * @return
     */
    int updateNavigation(Navigation navigation);

    /**
     * 根据id删除一个导航
     * @param id
     * @return
     */
    int deleteNavById(String id);
    
    int insertNavigation(Navigation navigation);
}
