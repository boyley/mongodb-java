package com.jarorwar.service;

import com.jarorwar.model.NavigationKeyword;

import java.util.List;

public interface INavigtaionKeywordService {
    /**
     * 获取所有的分类
     * @param display 是否显示
     * @param navigationId   导航id
     * @return
     */
    List<NavigationKeyword> getRootNavigationKeywords(Integer display,String navigationId);

    /**
     * 获取所有的类别
     * @return
     */
    List<NavigationKeyword> getAllCateByDisplay(Integer display, String navId);

    int addKeyWord(NavigationKeyword keyword);

    public int deleteKeyword(String id);
}
