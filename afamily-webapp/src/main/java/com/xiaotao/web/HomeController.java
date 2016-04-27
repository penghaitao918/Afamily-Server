package com.xiaotao.web;

import com.genghis.steed.ajax.response.PageResponse;
import com.xiaotao.BaseController;
import com.xiaotao.student.model.CheckIn;
import com.xiaotao.student.model.StudentTask;
import com.xiaotao.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * ━━━━━━神兽出没━━━━━━
 * 　　　┏┓　　　┏┓
 * 　　┏┛┻━━━┛┻┓
 * 　　┃　　　　　　　┃
 * 　　┃　　　━　　　┃
 * 　　┃　┳┛　┗┳　┃
 * 　　┃　　　　　　　┃
 * 　　┃　　　┻　　　┃
 * 　　┃　　　　　　　┃
 * 　　┗━┓　　　┏━┛Code is far away from bug with the animal protecting
 * 　　　　┃　　　┃    神兽保佑,代码无bug
 * 　　　　┃　　　┃
 * 　　　　┃　　　┗━━━┓
 * 　　　　┃　　　　　　　┣┓
 * 　　　　┃　　　　　　　┏┛
 * 　　　　┗┓┓┏━┳┓┏┛
 * 　　　　　┃┫┫　┃┫┫
 * 　　　　　┗┻┛　┗┻┛
 * <p/>
 * ━━━━━━感觉萌萌哒━━━━━━
 *
 * @author xiaoTao
 * @date 2016-04-10  11:10
 */

@Controller
public class HomeController extends BaseController {

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String login(HttpServletRequest request, HttpSession session) {
        return "login";
    }

    @RequestMapping(value = "/logout", method = {RequestMethod.GET})
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }

    @RequestMapping(value = "/", method = {RequestMethod.GET})
    public String index(HttpSession session) {
        if (isLogin(session)){
            return "index";
        }else {
            return "redirect:/login";
        }
    }

    @RequestMapping(value = "/publish/notification", method = {RequestMethod.GET})
    public String setNotify(HttpSession session) {
        if (isLogin(session)){
            return "notification/publish";
        }else {
            return "redirect:/login";
        }
    }

    @RequestMapping(value = "/checkIn/findAllInfoList", method = {RequestMethod.POST})
    @ResponseBody
    public PageResponse<CheckIn> findAllStudentTask(CheckIn checkIn) {
        return new PageResponse<CheckIn>(checkIn.getPage(),studentService.getAllCheckInfoList());
    }

}
