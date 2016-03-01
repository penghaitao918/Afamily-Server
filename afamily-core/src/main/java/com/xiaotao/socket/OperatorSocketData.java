package com.xiaotao.socket;

import com.xiaotao.socket.model.SocketInfo;
import com.xiaotao.user.model.User;
import org.json.JSONObject;

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
    public static ArrayList<SocketInfo> socketInfo = new ArrayList<SocketInfo>();
    /*                SocketInfo socketInfo1 = new SocketInfo(socket.getPort(),socket.getInetAddress());*/
    //  客户端地址
    //         System.out.println("###getInetAddress # " + socket.getInetAddress());
    //  客户端端口
    //         System.out.println("###getPort # " + socket.getPort());

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
                int type = jsonObject.getInt(SocketInfo.JSONType);
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

    //  定义处理用户请求的方法
    private void dealWithUserRequest(int type, JSONObject jsonObject){
        switch (type){
            case SocketInfo.login:
                User user = new User(jsonObject);
                System.out.println("Login # " + user);
                // 登陆返回参数，true成功，false失败，成功则将登录信息添加如list
                break;
                   //  TODO:实现客户端与服务器的一对一交流，暂未实现客户端之间的交流
            // 遍历socketList中的每个Socket，
            // 将读到的内容向每个Socket发送一次
            //           for (Iterator<Socket> it = WebServer.socketList.iterator(); it.hasNext(); )
            //           {
            //               Socket s = it.next();
        }
    }
}