package com.jarorwar.service.impl;

import com.jarorwar.mapper.NavigationBrandMapper;
import com.jarorwar.mapper.NavigationKeywordMapper;
import com.jarorwar.mapper.NavigationMapper;
import com.jarorwar.model.Navigation;
import com.jarorwar.model.NavigationBrand;
import com.jarorwar.model.NavigationKeyword;
import com.jarorwar.service.INavigationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 12-9-14
 * Time: 下午5:01
 * 服务实现类
 */
@Service
@Transactional
public class NavigationServiceImpl implements INavigationService {

    @Autowired
    private NavigationMapper navigationMapper;
    @Autowired
    private NavigationKeywordMapper keywordMapper;
    @Autowired
    private NavigationBrandMapper navbrandMapper;

    @Transactional(readOnly = true)
    @Override
    public List<Navigation> getNavigationList(Navigation navigation) {
        return navigationMapper.queryByNav(navigation);
    }

    /**
     * @see com.jarorwar.service.INavigationService#updateNavigation(com.jarorwar.model.Navigation)
     * @param navigation
     * @return
     */
    @Override
    public int updateNavigation(Navigation navigation) {
        Assert.notNull(navigation, "要更新的对象不能为空");
        Assert.hasText(navigation.getId(),"要更新的对象主键不能为空！");
        return navigationMapper.updateNavigation(navigation);
    }

    @Override
    public int deleteNavigationById(String id) {
        Assert.hasText(id,"无效的id！");
        return navigationMapper.deleteNavById(StringUtils.trimWhitespace(id));
    }

    @Override
    public int addNavigation(Navigation navigation) {
        Assert.notNull(navigation,"要添加的导航不能为空");
        Assert.hasText(navigation.getNavigationName(),"导航名称不能为空！");
        navigation.setCreateTime(new Date());
        return navigationMapper.insertNavigation(navigation);
    }

    @Transactional(readOnly = true)
    @Override
    public Navigation getNavigationById(String id) {
        Assert.hasText(id,"导航对象id不能为空");
        return navigationMapper.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<NavigationKeyword> getRootNavigationKeywords(Integer keywordType, String channelId) {
        return keywordMapper.getRootNavigationKeywords(keywordType,channelId);
    }

    @Transactional(readOnly = true)
    @Override
    public NavigationKeyword getNavigationKeywordById(String id) {
       // NavigationKeyword keyword = generateTree(id);

        return keywordMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addNavigationKeyword(NavigationKeyword navigationKeyword) {
        Assert.notNull(navigationKeyword,"要保存的对象不能为空！");
        navigationKeyword.setCreateTime(new Date());
        int rs = keywordMapper.insert(navigationKeyword) ;
        return rs;
    }

    @Transactional(readOnly = true)
    @Override
    public List<NavigationBrand> getNavigationBrandByNavigation(String id) {
        Assert.hasText("id","导航对象的id不能为空！");
        return navbrandMapper.getNavigationBrandByNavigationId(id);
    }

    @Override
    public List<NavigationBrand> getNavigationBrandWithNavigtion() {
        return navbrandMapper.getNavigationBrandWithNavigtion();
    }

    private NavigationKeyword generateTree(String id){
        NavigationKeyword keyword =      keywordMapper.selectByPrimaryKey(id);
        List<NavigationKeyword> subList = keywordMapper.selectByParentId(id);
        keyword.setSubKeywords(subList);
        if(subList !=null && subList.size()>0){
            for(NavigationKeyword kw :subList){
                if(kw != null){
                    generateTree(kw.getId());
                }
            }
        }
        return keyword;
    }
}
