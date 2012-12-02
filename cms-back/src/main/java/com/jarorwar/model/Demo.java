package com.jarorwar.model;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Created with IntelliJ IDEA.
 * User: mimiloveququ
 * Date: 12-12-2
 * Time: 上午2:24
 * demo model
 */
public class Demo {
    @NotBlank(message = "不能为空值！")
    @NotEmpty(message = "不能为空fff值！")
    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
