package com.xiaotao.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.security.auth.Subject;
import javax.security.sasl.AuthenticationException;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by tao on 16-2-28.
 */

@Controller
@RequestMapping()
public class LoginController {

    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String login(HttpServletRequest request) {
        return "login";
    }

    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public void loginPost() {

    }
}
