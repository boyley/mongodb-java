package com.jarorwar.controller;

import com.jarorwar.model.Demo;
import com.jarorwar.vo.JsonModel;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;

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
    public JsonModel testAppConfig(@Valid Demo demo,BindingResult result){
         JsonModel jm = new JsonModel();
        System.out.println(result);
        if(result.hasErrors()){
            jm.setMsg(result.getErrorCount()+"");
        }                                        else
         jm.setMsg("ok");
         jm.setResult("success");
     return jm;
    }
}
