package com.xiaotao.user.model;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by tao on 16-2-28.
 */
public class User {

    public static final String accountFlag = "LOGIN_ACCOUNT";
    public static final String passwordFlag = "LOGIN_PASSWORD";

    private int userId;
    private String userName;
    private String loginId;
    private String password;

    public User(){

    }

    public User(JSONObject jsonObject) {
        try {
            this.loginId = jsonObject.getString(accountFlag);
            this.password = jsonObject.getString(passwordFlag);
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
