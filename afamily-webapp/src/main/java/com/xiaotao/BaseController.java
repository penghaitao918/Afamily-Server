/*
* HomeController.java
* Created on  202015/6/5 22:53
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/6/5       longshihui    初始版本
*
*/

package com.xiaotao;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
@Controller
public class BaseController {

    /*
     * 登录判定
     */
    protected Boolean isLogin(HttpSession session){
        if (session.getAttribute("FLAG") == null){
            return false;
        }
        return (Boolean)session.getAttribute("FLAG");
    }

}
