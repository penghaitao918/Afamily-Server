package com.xiaotao.socket.model;

import java.net.InetAddress;

/**
 * Created by tao on 16-2-26.
 */
public class SocketInfo {

    private int clientPort = 0;
    private InetAddress clientAddress = null;
    private String clientAccount = null;

    public SocketInfo(){

    }

    public SocketInfo(int port, InetAddress addr, String account){
        this.clientPort = port;
        this.clientAddress = addr;
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

    public static final String JSONType = "CONNECT_TYPE";
    public static final int notify = 0;
    public static final int login = 1;
}
