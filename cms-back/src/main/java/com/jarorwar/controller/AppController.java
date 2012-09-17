package com.jarorwar.controller;

import com.jarorwar.vo.JsonModel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * User: jarorwar
 * Date: 12-9-16
 * Time: 下午10:13
 * 请在此处加注释
 */
@Controller
@RequestMapping("/app")
public class AppController {
    @RequestMapping("/config")
    @ResponseBody
    public JsonModel testAppConfig(){
         JsonModel jm = new JsonModel();
         jm.setMsg("ok");
         jm.setResult("success");
     return jm;
    }
}
