package com.xiaotao.socket.model;

import java.net.InetAddress;
import java.net.Socket;

/**
 * Created by tao on 16-2-26.
 */
public class SocketLog {

    private int clientPort = 0;
    private InetAddress clientAddress = null;
    private String clientAccount = null;
    private String loginTime = null;
    private String logoutTime = null;

    public SocketLog(){

    }

    public SocketLog(Socket socket, String account){
        this.clientPort = socket.getPort();
        this.clientAddress = socket.getInetAddress();
        this.clientAccount = account;
    }

    public void setClientPort(int clientPort) {
        this.clientPort = clientPort;
    }

    public int getClientPort() {
        return clientPort;
    }

    public void setClientAddress(InetAddress clientAddress) {
        this.clientAddress = clientAddress;
    }

    public InetAddress getClientAddress() {
        return clientAddress;
    }

    public void setClientAccount(String clientAccount) {
        this.clientAccount = clientAccount;
    }

    public String getClientAccount() {
        return clientAccount;
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
