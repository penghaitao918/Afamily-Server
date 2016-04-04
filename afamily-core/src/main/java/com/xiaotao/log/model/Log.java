package com.xiaotao.log.model;

import java.net.InetAddress;
import java.net.Socket;

/**
 * Created by tao on 16-2-26.
 */
public class Log {

    private int port = 0;
    private String address = null;
    private String account = null;
    private String loginTime = null;
    private String logoutTime = null;

    public Log(){

    }

    public Log(Socket socket, String account){
        this.port = socket.getPort();
        this.address = socket.getInetAddress().toString();
        this.account = account;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public int getPort() {
        return port;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getAccount() {
        return account;
    }

    public String getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(String loginTime) {
        this.loginTime = loginTime;
    }

    public String getLogoutTime() {
        return logoutTime;
    }

    public void setLogoutTime(String logoutTime) {
        this.logoutTime = logoutTime;
    }
}
