package com.jarorwar.serviceimpl;

import com.jarorwar.mapper.NavigationMapper;
import com.jarorwar.model.Navigation;
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
}
