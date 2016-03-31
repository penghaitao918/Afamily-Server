package com.xiaotao.util;

import com.xiaotao.student.model.Student;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * 封装返回给客户端的JSON
 * Created by tao on 16-3-2.
 */
public class JSONUtil {

    public static final String JSONType = "CONNECT_TYPE";
    public static final String connectCheck = "CONNECT_CHECK";
    public static final int check = -1;
    public static final int notify = 0;
    public static final int login = 1;
    public static final int logout = 2;

    //  心跳检测
    public static JSONObject connectCheck() {
        //  创建 JSONObject 对象
        JSONObject checkJSON = new JSONObject();
        try {
            checkJSON.put(JSONType,check);
        }catch (JSONException e){
            e.printStackTrace();
        }
        return checkJSON;
    }

    //  login
    public static JSONObject login(Student student){
        JSONObject loginJSON = new JSONObject();
        try {
            loginJSON.put(JSONType, login);
            if (student != null) {
                loginJSON.put(Student.info.loginFlag,true);
                loginJSON.put(Student.info.account, student.getStudentId());
                loginJSON.put(Student.info.portrait, student.getUserPortrait());
                loginJSON.put(Student.info.userName, student.getUserName());
                loginJSON.put(Student.info.sex, student.getSex());
                loginJSON.put(Student.info.classes, student.getClasses());
            }else {
                loginJSON.put(Student.info.loginFlag, false);
            }
        }catch (JSONException e){
            e.printStackTrace();
        }
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

}
