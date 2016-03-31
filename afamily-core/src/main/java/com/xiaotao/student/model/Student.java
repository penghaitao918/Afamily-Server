package com.xiaotao.student.model;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by acmer on 2016/3/31.
 */
public class Student {

    //  info
    public static final class info {
        public static final String loginFlag = "LOGIN_FLAG";
        public static final String account = "USER_ACCOUNT";
        public static final String password = "USER_PASSWORD";
        public static final String portrait = "USER_PORTRAIT";
        public static final String userName = "USER_NAME";
        public static final String sex = "USER_SEX";
        public static final String classes = "USER_CLASSES";
    }

    private int userId;
    private String studentId = null;
    private String password = null;
    private String userPortrait = null;
    private String userName = null;
    private String sex = null;
    private String classes = null;

    //  用于spring的公共构造函数
    public Student(){}
    public Student(JSONObject jsonObject) {
        try {
            this.studentId = jsonObject.getString(info.account);
            this.password = jsonObject.getString(info.password);
        }catch (JSONException e){
            e.printStackTrace();
        }
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUsername(String username) {
        this.userName = username;
    }

    public String getUserName() {
        return userName;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setUserPortrait(String userPortrait) {
        this.userPortrait = userPortrait;
    }

    public String getUserPortrait() {
        return userPortrait;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSex() {
        return sex;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    public String getClasses() {
        return classes;
    }
}
