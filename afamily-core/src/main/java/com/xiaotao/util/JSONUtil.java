package com.xiaotao.util;

import com.xiaotao.student.model.Student;
import com.xiaotao.student.model.StudentTask;
import com.xiaotao.task.model.TaskInfo;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * 封装返回给客户端的JSON
 * Created by tao on 16-3-2.
 */
public class JSONUtil {

    public static final String JSONType = "CONNECT_TYPE";

    public static final int check = 0;
    public static final int notify = 1;
    public static final int login = 2;
    public static final int reLogin = 3;
    public static final int logout =4 ;
    public static final int taskList = 5;
    public static final int studentTaskList = 6;
    public static final int submitTask = 7;
    public static final int sendConversationMessage = 8;
    public static final int feedback = 9;
    public static final int updateUserInfo = 10;

    //  心跳检测
    public static JSONObject Check() {
        //  创建 JSONObject 对象
        JSONObject checkJSON = new JSONObject();
        try {
            checkJSON.put(JSONType,check);
        }catch (JSONException e){
            e.printStackTrace();
        }
        return checkJSON;
    }

    //  login 0为重登陆， 1为初次登陆
    public static JSONObject login(Student student, int type){
        JSONObject loginJSON = new JSONObject();
        try {
            if (type == 0) {
                loginJSON.put(JSONType, reLogin);
            }else {
                loginJSON.put(JSONType, login);
            }
            if (student != null) {
                loginJSON.put(Student.info.loginFlag,true);
                loginJSON.put(Student.info.account, student.getStudentId());
                loginJSON.put(Student.info.name, student.getName());
                loginJSON.put(Student.info.sex, student.getSex());
                loginJSON.put(Student.info.classes, student.getClasses());
                loginJSON.put(Student.info.portrait, student.getPortrait());
            }else {
                loginJSON.put(Student.info.loginFlag, false);
            }
        }catch (JSONException e){
            e.printStackTrace();
        }
        System.out.println(loginJSON);
        return loginJSON;
    }

    //  logout
    public static JSONObject logout(){
        JSONObject logoutJSON = new JSONObject();
        try {
            logoutJSON.put(JSONType, logout);
        }catch (JSONException e){
            e.printStackTrace();
        }
        return logoutJSON;
    }

    //  获取任务列表
    public static JSONObject getAllTaskInfoList(List<TaskInfo> list) {
        JSONObject logoutJSON = new JSONObject();
        JSONArray idJsonArray = new JSONArray();
        JSONArray nameJsonArray = new JSONArray();
        try {
            for(int i = 0; i < list.size(); i++)
            {
                idJsonArray.put(i, list.get(i).getTaskId());
                nameJsonArray.put(i, list.get(i).getTaskName());
            }
            logoutJSON.put(JSONType, taskList);
            logoutJSON.put(TaskInfo.info.taskId, idJsonArray);
            logoutJSON.put(TaskInfo.info.taskName, nameJsonArray);
        }catch (JSONException e){
            e.printStackTrace();
        }
        return logoutJSON;
    }


    //  获取任务完成情况
    public static JSONObject getStudentTaskInfo(StudentTask task){
        JSONObject logoutJSON = new JSONObject();
        try {
            logoutJSON.put(JSONType, studentTaskList);
            logoutJSON.put(StudentTask.info.task0, task.isTask0());
            logoutJSON.put(StudentTask.info.task1, task.isTask1());
            logoutJSON.put(StudentTask.info.task2, task.isTask2());
            logoutJSON.put(StudentTask.info.task3, task.isTask3());
            logoutJSON.put(StudentTask.info.task4, task.isTask4());
            logoutJSON.put(StudentTask.info.task5, task.isTask5());
            logoutJSON.put(StudentTask.info.task6, task.isTask6());
            logoutJSON.put(StudentTask.info.task7, task.isTask7());
            logoutJSON.put(StudentTask.info.task8, task.isTask8());
            logoutJSON.put(StudentTask.info.task9, task.isTask9());
        }catch (JSONException e){
            e.printStackTrace();
        }
        return logoutJSON;
    }

    //  发送通知
    public static JSONObject sendNotificationToAllUser(String title, String message){
        JSONObject logoutJSON = new JSONObject();
        try {
            logoutJSON.put(JSONType, notify);
            logoutJSON.put(notifyInfo.notifyTitle, title);
            logoutJSON.put(notifyInfo.notifyMessage, message);
        }catch (JSONException e){
            e.printStackTrace();
        }
        return logoutJSON;
    }

    //  notification
    public static final class notifyInfo {
        public static final String notifyTitle = "NOTIFY_TITLE";
        public static final String notifyMessage = "NOTIFY_MESSAGE";
    }

    //  feedback
    public static JSONObject feedback(){
        JSONObject feedbackJSON = new JSONObject();
        try {
            feedbackJSON.put(JSONType, feedback);
        }catch (JSONException e){
            e.printStackTrace();
        }
        return feedbackJSON;
    }

    //  updateUserInfo
    public static JSONObject updateUserInfo(int type){
        JSONObject feedbackJSON = new JSONObject();
        try {
            feedbackJSON.put(JSONType, updateUserInfo);
            feedbackJSON.put(Student.updateUserInfo.updateType, type);
        }catch (JSONException e){
            e.printStackTrace();
        }
        return feedbackJSON;
    }

}
