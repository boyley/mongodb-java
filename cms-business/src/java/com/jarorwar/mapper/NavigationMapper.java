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
}
