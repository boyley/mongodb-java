package com.jarorwar.controller;

import com.jarorwar.model.Navigation;
import com.jarorwar.service.INavigationService;
import com.jarorwar.vo.JsonModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 导航控制器
 */
@Controller
@RequestMapping("/nav")
public class NavigationController {
    @Autowired
    private INavigationService navigationService;
    @RequestMapping("/list")
    public String listNavigations(Model model){
        return "nav/nav_list";
    }
    @RequestMapping("/navs")
    @ResponseBody
    public JsonModel getNavDatas(){
        JsonModel jm = new JsonModel();
        List<Navigation> navigationList =navigationService.getNavigationList(null) ;
        jm.setTotal(navigationList.size());
        jm.setRows(navigationList);
        return jm;
    }
}
