package com.xiaotao.socket;

import com.xiaotao.socket.model.SocketInfo;
import com.xiaotao.user.model.User;
import com.xiaotao.user.service.UserService;
import com.xiaotao.util.JSONUtil;
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
@Component
public class OperatorSocketData implements Runnable{

    // 定义当前线程所处理的Socket
    private Socket s = null;
    // 该线程所处理的Socket所对应的输入流
    private BufferedReader br = null;
    // 保存socketList中每个socket的信息
    public static ArrayList<SocketInfo> socketInfo = new ArrayList<SocketInfo>();
    /*                SocketInfo socketInfo1 = new SocketInfo(socket.getPort(),socket.getInetAddress());*/
    //  客户端地址
    //         System.out.println("###getInetAddress # " + socket.getInetAddress());
    //  客户端端口
    //         System.out.println("###getPort # " + socket.getPort());

    public OperatorSocketData(){ }

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
    private UserService userService;
    //  定义处理用户请求的方法

    private void dealWithUserRequest(int type, JSONObject jsonObject) throws JSONException {
        switch (type){
            case JSONUtil.check:
                System.out.print(jsonObject.getString(JSONUtil.connectCheck));
                break;
            case JSONUtil.login:
                User user = new User(jsonObject);
                JSONUtil jsonUtil = new JSONUtil();
                User admin = userService.studentLogin(user);
                System.out.println(admin);
                ServerSend send = new ServerSend(jsonUtil.login(userService.studentLogin(user)));
                new Thread(send).start();
                break;
                   //  TODO:实现客户端与服务器的一对一交流，暂未实现客户端之间的交流
            // 遍历socketList中的每个Socket，
            // 将读到的内容向每个Socket发送一次
            //           for (Iterator<Socket> it = WebServer.socketList.iterator(); it.hasNext(); )
            //           {
            //               Socket s = it.next();
        }
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