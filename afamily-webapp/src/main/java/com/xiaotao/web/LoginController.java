package com.xiaotao.web;

import com.xiaotao.BaseController;
import com.xiaotao.student.model.Student;
import com.xiaotao.student.service.StudentService;
import com.xiaotao.user.model.User;
import com.xiaotao.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

/**
 * Created by tao on 16-2-28.
 */

@Controller
public class LoginController extends BaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private StudentService studentService;

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

    @RequestMapping(value = "/register", method = {RequestMethod.POST})
    public String register(HttpServletRequest request) {
        Student student = new Student();
        student.setStudentId(request.getParameter("account"));
        student.setPassword(request.getParameter("password"));
        try {
            student.setUsername(new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8"));
        } catch (UnsupportedEncodingException e) {
            student.setUsername(request.getParameter("account"));
            e.printStackTrace();
        }
        student.setClasses(request.getParameter("classes"));
        studentService.register(student);
        if (student.getUserId() != 0) {
            return "register/register";
        } else {
            return "";
        }
    }

}
