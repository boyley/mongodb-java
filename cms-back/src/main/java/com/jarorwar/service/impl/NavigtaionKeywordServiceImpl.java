package com.jarorwar.service.impl;

import com.jarorwar.mapper.NavigationKeywordMapper;
import com.jarorwar.model.NavigationKeyword;
import com.jarorwar.service.INavigtaionKeywordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class NavigtaionKeywordServiceImpl implements INavigtaionKeywordService {
    @Autowired
    private NavigationKeywordMapper keywordMapper;

    @Transactional(readOnly = true)
    @Override
    public List<NavigationKeyword> getRootNavigationKeywords(Integer display, String navigationId) {
        List<NavigationKeyword> navigationKeywords = keywordMapper.getRootNavigationKeywords(NavigationKeyword.KEYWORD_TYPE_CAT,navigationId,display);
        List<NavigationKeyword> subKeywords = new ArrayList<NavigationKeyword>();
        for(NavigationKeyword keyword:navigationKeywords){
            subKeywords.addAll(keywordMapper.selectByParentId(keyword.getId()));
        }
        navigationKeywords.addAll(subKeywords);
        return navigationKeywords;
    }
}
