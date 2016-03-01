package com.xiaotao.web;

import com.xiaotao.user.model.User;
import com.xiaotao.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.security.auth.Subject;
import javax.security.sasl.AuthenticationException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by tao on 16-2-28.
 */

@Controller
@RequestMapping()
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/", method = {RequestMethod.GET})
    public String index(HttpSession session) {
        if (session.getAttribute("FLAG") == null){
            session.setAttribute("FLAG",false);
        }
        return "redirect:/login";
    }

    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String login(HttpServletRequest request, HttpSession session) {
        if (session.getAttribute("FLAG") == null){
            session.setAttribute("FLAG",false);
        }
        return "login";
    }

    @RequestMapping(value = "/admin/user/login", method = {RequestMethod.POST})
    @ResponseBody
    public User loginPost(User user,HttpSession session) {
        User admin = userService.loginCheck(user);
        if (admin != null){
            session.setAttribute("FLAG",true);
            session.setAttribute("INFO",admin);
        }
        return admin;
    }
}
