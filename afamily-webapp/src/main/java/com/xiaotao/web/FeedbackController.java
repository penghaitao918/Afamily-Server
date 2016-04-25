package com.xiaotao.web;

import com.genghis.steed.ajax.response.PageResponse;
import com.xiaotao.BaseController;
import com.xiaotao.feedback.model.Feedback;
import com.xiaotao.feedback.service.FeedbackService;
import com.xiaotao.student.model.StudentTask;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
 * @date 2016-04-25  15:04
 */
@Controller
public class FeedbackController extends BaseController {

    @Autowired
    private FeedbackService feedbackService;


    @RequestMapping(value = "/info/options", method = {RequestMethod.GET})
    public String getOption(HttpSession session) {
        if (isLogin(session)){
            return "options/info";
        }else {
            return "redirect:/login";
        }
    }

    @RequestMapping(value = "/options/findAllOption", method = {RequestMethod.POST})
    @ResponseBody
    public PageResponse<Feedback> findAllOption(Feedback feedback) {
        return new PageResponse<Feedback>(feedback.getPage(),feedbackService.getAllFeedback());
    }

    @RequestMapping(value = "/options/findOptionByID", method = {RequestMethod.POST})
    @ResponseBody
    public Feedback findOptionById(int id) {
        return feedbackService.findOptionById(id);
    }

    @RequestMapping(value = "/options/deleteById", method = {RequestMethod.POST})
    @ResponseBody
    public boolean deleteById(@Param("id") int id) {
        feedbackService.deleteByID(id);
        return true;
    }

}
