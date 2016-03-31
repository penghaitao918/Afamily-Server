package com.xiaotao.user.model;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by tao on 16-2-28.
 */
public class User {

    private String loginId = null;
    private String password = null;

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
