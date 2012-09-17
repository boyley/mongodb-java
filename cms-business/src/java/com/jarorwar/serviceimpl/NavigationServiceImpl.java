package com.jarorwar.serviceimpl;

import com.jarorwar.mapper.NavigationMapper;
import com.jarorwar.model.Navigation;
import com.jarorwar.service.INavigationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
