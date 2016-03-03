package com.xiaotao.user.model;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by tao on 16-2-28.
 */
public class User {

    public String getPortrait() {
        return portrait;
    }

    public void setPortrait(String portrait) {
        this.portrait = portrait;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    //  info
    public static final class info {
        public static final String loginFlag = "LOGIN_FLAG";
        public static final String account = "USER_ACCOUNT";
        public static final String password = "USER_PASSWORD";
        public static final String portrait = "USER_PORTRAIT";
        public static final String userName = "USER_NAME";
        public static final String sex = "USER_SEX";
        public static final String grade = "USER_GRADE";
        public static final String classes = "USER_CLASSES";
    }

    private int userId;
    private String loginId = null;
    private String password = null;
    private String portrait = null;
    private String userName = null;
    private int sex;
    private String grade = null;
    private String classes = null;

    public User(){

    }

    public User(JSONObject jsonObject) {
        try {
            this.loginId = jsonObject.getString(info.account);
            this.password = jsonObject.getString(info.password);
/*            this.portrait = jsonObject.getString(info.portrait);
            this.userName = jsonObject.getString(info.userName);
            this.sex = jsonObject.getInt(info.sex);
            this.grade = jsonObject.getString(info.grade);
            this.classes = jsonObject.getString(info.classes);*/
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

    public String getUsername() {
        return userName;
    }

    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    public String getLoginId() {
        return loginId;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }
}
