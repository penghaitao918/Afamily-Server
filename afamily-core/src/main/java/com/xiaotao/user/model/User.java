package com.xiaotao.user.model;

/**
 * Created by tao on 16-2-28.
 */
public class User {

    private int userId;
    private String username;
    private String loginName;
    private String password;

    public User(){

    }

/*    public User(User user){
        this.userId = user.getUserId();
        this.username = user.getUsername();
        this.loginName = user.getLoginName();
        this.password = user.getPassword();
    }*/

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }
}
