package com.jarorwar.controller;

import com.jarorwar.model.Navigation;
import com.jarorwar.service.INavigationService;
import com.jarorwar.vo.JsonModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 导航控制器
 */
@Controller
@RequestMapping("/nav")
public class NavigationController  {
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                dateFormat, false));
    }
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

    @RequestMapping("/save_nav")
    public void saveNav(Navigation navigation){
        System.out.println(navigation);
    }

    @RequestMapping("/update_nav")
    @ResponseBody
    public JsonModel updateNav(Navigation navigation){
         JsonModel jm = new JsonModel();
        navigation.setCreateTime(new Date());
        int rs = navigationService.updateNavigation(navigation);
       jm.setMsg("更新成功");
        jm.setResult("success");
        return jm;
    }
}
