package com.xiaotao.web;

import com.genghis.steed.ajax.response.PageResponse;
import com.xiaotao.BaseController;
import com.xiaotao.student.model.StudentTask;
import com.xiaotao.student.service.StudentService;
import com.xiaotao.task.model.TaskInfo;
import com.xiaotao.task.service.TaskInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

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
 * @date 2016-04-20  14:45
 */
@Controller
public class TaskController extends BaseController {

    @Autowired
    private TaskInfoService taskInfoService;
    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/publish/task", method = {RequestMethod.GET})
    public String setTask(HttpSession session) {
        if (isLogin(session)){
            return "task/publish";
        }else {
            return "redirect:/login";
        }
    }

    @RequestMapping(value = "/info/task", method = {RequestMethod.GET})
    public String getTask(HttpSession session) {
        if (isLogin(session)){
            return "task/info";
        }else {
            return "redirect:/login";
        }
    }


    @RequestMapping(value = "/publish/taskDo", method = {RequestMethod.POST})
    @ResponseBody
    public boolean publish(String[] array) {
        taskInfoService.deleteAllTask();
        for (int i = 0; i < array.length; ++ i) {
            taskInfoService.publish(new TaskInfo(i+1, array[i]));
        }
        return true;
    }

    @RequestMapping(value = "/task/findAllTaskInfo", method = {RequestMethod.POST})
    @ResponseBody
    public PageResponse<StudentTask> findAllStudentTask(StudentTask studentTask) {
        PageResponse<StudentTask> pageResponse = new PageResponse<>(studentTask.getPage(),studentService.getAllStudentTaskInfoList());
        ArrayList<StudentTask> arrayList = new ArrayList<StudentTask>(pageResponse.getResultList());
        for (int i = 0; i < arrayList.size(); ++ i)
            System.out.println("## " + arrayList.get(i).getAccount());
        return pageResponse;
    }

}
