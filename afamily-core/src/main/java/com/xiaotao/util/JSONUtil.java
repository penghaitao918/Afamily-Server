package com.xiaotao.util;

import com.xiaotao.user.model.User;
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
    public static JSONObject login(User user){
        JSONObject loginJSON = new JSONObject();
        try {
            loginJSON.put(JSONType, login);
            if (user != null) {
                loginJSON.put(User.info.loginFlag,true);
                loginJSON.put(User.info.account, user.getLoginId());
                loginJSON.put(User.info.portrait, user.getPortrait());
                loginJSON.put(User.info.userName, user.getUsername());
                loginJSON.put(User.info.sex, user.getSex());
                loginJSON.put(User.info.grade, user.getGrade());
                loginJSON.put(User.info.classes, user.getClasses());
            }else {
                loginJSON.put(User.info.loginFlag, false);
            }
        }catch (JSONException e){
            e.printStackTrace();
        }
        return loginJSON;
    }
}
