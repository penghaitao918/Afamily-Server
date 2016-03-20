package com.xiaotao.web;

import com.xiaotao.user.model.User;
import com.xiaotao.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by tao on 16-2-28.
 */

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    private Boolean isLogin(HttpSession session){
        if (session.getAttribute("FLAG") == null){
            return false;
        }
        return (Boolean)session.getAttribute("FLAG");
    }

    @RequestMapping(value = "/", method = {RequestMethod.GET})
    public String index(HttpSession session) {
        if (isLogin(session)){
            return "index";
        }else {
            return "redirect:/login";
        }
    }

    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String login(HttpServletRequest request, HttpSession session) {
        return "login";
    }

    @RequestMapping(value = "/logout", method = {RequestMethod.GET})
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }

    @RequestMapping(value = "/admin/user/login", method = {RequestMethod.POST})
    @ResponseBody
    public User loginPost(User user, HttpSession session) {
        User admin = userService.adminLogin(user);
        if (admin != null){
            session.setAttribute("FLAG",true);
            session.setAttribute("INFO",admin);
        }
        return admin;
    }
}
