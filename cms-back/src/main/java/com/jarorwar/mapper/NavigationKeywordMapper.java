package com.jarorwar.mapper;


import java.util.List;

import com.jarorwar.model.NavigationKeyword;
import org.apache.ibatis.annotations.Param;

public interface NavigationKeywordMapper {

    int deleteByPrimaryKey(String id);

    int insert(NavigationKeyword record);

    NavigationKeyword selectByPrimaryKey(String id);
    List<NavigationKeyword> selectByParentId(String id);
    int updateByPrimaryKey(NavigationKeyword record);
    List<NavigationKeyword> getRootNavigationKeywords(@Param(value = "keywordType")Integer keywordType, @Param(value = "navId")String navId,@Param("display")Integer display);
    List<NavigationKeyword> getCateByDisplay(@Param("display")Integer display,@Param("navId")String navId);
}