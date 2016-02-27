/*
* HomeController.java
* Created on  202015/6/5 22:53
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/6/5       longshihui    初始版本
*
*/

package com.xiaotao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.support.AbstractMultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
@Controller
/*@RequestMapping()*/
public class HomeController {
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String getIndex(Model model){

        return "index";
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public String login(HttpServletRequest request){
        System.out.println(request.getParameterMap());
        return "{a:1,b:c}";
    }
}
