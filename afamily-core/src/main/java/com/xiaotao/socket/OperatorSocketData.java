package com.xiaotao.socket;

import com.sun.corba.se.spi.activation.Server;
import com.xiaotao.socket.model.SocketInfo;
import com.xiaotao.user.model.User;
import com.xiaotao.user.service.UserService;
import com.xiaotao.util.JSONUtil;
import com.xiaotao.util.SpringUtil;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Arrays;

/**
 * Created by tao on 16-2-26.
 * 将socket服务器得到数据进行处理
 */

public class OperatorSocketData implements Runnable{

    // 定义当前线程所处理的Socket
    private Socket s = null;
    // 该线程所处理的Socket所对应的输入流
    private BufferedReader br = null;
    // 保存socketList中每个socket的信息
    public static ArrayList<SocketInfo> socketInfoArrayList = new ArrayList<SocketInfo>();

    public OperatorSocketData(Socket s) throws IOException {
        this.s = s;
        // 初始化该Socket对应的输入流
        br = new BufferedReader(new InputStreamReader(s.getInputStream() , "utf-8"));
    }

    public void run()
    {
        String content = null;
        // 采用循环不断从Socket中读取客户端发送过来的数据
        while ((content = readFromClient()) != null)
        {
            System.out.println("客户端--->服务器：  " + content);
            try {
                JSONObject jsonObject = new JSONObject(content);
                int type = jsonObject.getInt(JSONUtil.JSONType);
                dealWithUserRequest(type,jsonObject);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    // 定义读取客户端数据的方法
    private String readFromClient()
    {
        try
        {
            return br.readLine();
        }
        // 如果捕捉到异常，表明该Socket对应的客户端已经关闭
        catch (IOException e)
        {
            e.printStackTrace();
            // 删除该Socket。
            SocketThread.socketList.remove(s);
        }
        return null;
    }

    @Autowired
    private UserService userService = (UserService) SpringUtil.getBean("userService");
    //  定义处理用户请求的方法

    private void dealWithUserRequest(int type, JSONObject jsonObject) throws JSONException {
        ServerSend serverSend = null;
        JSONUtil jsonUtil = new JSONUtil();
        switch (type){
            case JSONUtil.check:
                serverSend = new ServerSend(jsonUtil.connectCheck());
                break;
            case JSONUtil.login:
                User client = new User(jsonObject);
                User server = userService.studentLogin(client);
                if (server != null && client.getPassword().equals(server.getPassword())){
                    serverSend = new ServerSend(jsonUtil.login(server));
                    SocketInfo socketInfo = new SocketInfo(s.getPort(),s.getInetAddress(),client.getLoginId());
                    socketInfoArrayList.add(socketInfo);
                }else {
                    serverSend = new ServerSend(jsonUtil.login(null));
                }
                break;
            //  TODO:实现客户端与服务器的一对一交流，暂未实现客户端之间的交流
        }
        new Thread(serverSend).start();
    }

    public class ServerSend implements Runnable {
        private JSONObject jsonObject = null;
        public ServerSend(JSONObject jsonObject) {
            this.jsonObject = jsonObject;
        }
        @Override
        public void run()
        {
            try{
                OutputStream outputStream = s.getOutputStream();
                outputStream.write((jsonObject + "\r\n").getBytes("utf-8"));
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}