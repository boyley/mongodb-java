package com.jarorwar.controller;

import com.jarorwar.model.Navigation;
import com.jarorwar.service.INavigationService;
import com.jarorwar.vo.JsonModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    Logger log = LoggerFactory.getLogger(this.getClass());
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
        List<Navigation> navigationList = null;
        try {
            navigationList = navigationService.getNavigationList(null);
            jm.setTotal(navigationList.size());
            jm.setRows(navigationList);
            return jm;
        } catch (Exception e) {
           log.error("获取导航列表失败",e);
            jm.setMsg("获取列表失败，失败信息:"+e.getMessage());
            jm.setData(null);
            jm.setTotal(0);
            jm.setRows(null);
            jm.setResult(JsonModel.JsonResult.FAILED);
            return jm;
        }

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
        try {
            int rs = navigationService.updateNavigation(navigation);
            jm.setMsg("更新成功");
            jm.setResult(JsonModel.JsonResult.SUCCESS);
            return jm;
        } catch (Exception e) {
            log.error("更新导航失败",e);
            jm.setMsg("更新失败");
            jm.setResult(JsonModel.JsonResult.FAILED);
            return jm;
        }

    }
    @RequestMapping("/change_del_flag")
    @ResponseBody
    public JsonModel changeNavDeleteFlag(String id,String deleteFlag) {
        JsonModel jm = new JsonModel();
        try {
            int rs = navigationService.changeNavDeleteFlag(id, Integer.parseInt(deleteFlag));
            jm.setMsg("更新成功");
            jm.setResult("success");
            return jm;
        } catch (Exception e) {
            log.error("更新导航失败",e);
            jm.setMsg("更新失败");
            jm.setResult(JsonModel.JsonResult.FAILED);
            return jm;
        }

    }
    @RequestMapping("/delete")
    @ResponseBody
    public JsonModel deleteById(String id) {
        JsonModel jm = new JsonModel();
        try {
            int rs = navigationService.deleteNavigationById(id);
            jm.setMsg("删除成功");
            jm.setResult("success");
            return jm;
        } catch (Exception e) {
            log.error("删除导航失败",e);
            jm.setMsg("删除失败,失败信息:"+e.getMessage());
            jm.setResult(JsonModel.JsonResult.FAILED);
            return jm;
        }

    }
}
