package com.jarorwar.mapper;

import java.util.List;

import com.jarorwar.model.NavigationBrand;
import org.apache.ibatis.annotations.Param;

public interface NavigationBrandMapper {
    int deleteByPrimaryKey(String id);
    int insert(NavigationBrand record);
    NavigationBrand selectByPrimaryKey(String id);
    int updateByPrimaryKeySelective(NavigationBrand record);
    int updateByPrimaryKey(NavigationBrand record);

    List<NavigationBrand> getNavigationBrandByNavigationId(String navigationId);
    List<NavigationBrand> getNavigationBrandWithNavigtion();

}