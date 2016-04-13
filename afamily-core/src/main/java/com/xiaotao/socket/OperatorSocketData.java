package com.xiaotao.socket;

import com.xiaotao.log.model.Log;
import com.xiaotao.log.service.LogService;
import com.xiaotao.student.model.Student;
import com.xiaotao.student.service.StudentService;
import com.xiaotao.util.JSONUtil;
import com.xiaotao.util.SpringUtil;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Iterator;

/**
 * Created by tao on 16-2-26.
 * 将socket服务器得到数据进行处理
 */

public class OperatorSocketData implements Runnable{

    // 定义当前线程所处理的Socket
    private Socket s = null;
    // 该线程所处理的Socket所对应的输入流
    private BufferedReader br = null;

    public OperatorSocketData(Socket s) throws IOException {
        this.s = s;
        // 初始化该Socket对应的输入流
        System.out.println("socket # " + s.getInetAddress());
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
            closeSocket();
        }
        return null;
    }

    @Autowired
    private StudentService studentService = (StudentService) SpringUtil.getBean("studentService");

    //  定义处理用户请求的方法
    private void dealWithUserRequest(int type, JSONObject jsonObject) throws JSONException {
        for (Iterator<Socket> iterator = SocketThread.socketList.iterator(); iterator.hasNext();){
            Socket socket = iterator.next();
            System.out.println(socket);
        }
        ServerSend serverSend = null;
        switch (type){
            case JSONUtil.logout:
                studentService.logout(s.getPort());
                closeSocket();
                break;
            case JSONUtil.login:
                Student client = new Student(jsonObject);
                Student server = studentService.login(client, s);
                if (server != null){
                    //  TODO 先判断是否在线 未实现
                    serverSend = new ServerSend(JSONUtil.login(server, 1));
                }else {
                    serverSend = new ServerSend(JSONUtil.login(null, 1));
                }
                break;
            case JSONUtil.reLogin:
                client = new Student(jsonObject);
                server = studentService.login(client, s);
                if (server != null){
                    serverSend = new ServerSend(JSONUtil.login(server, 0));
                }else {
                    serverSend = new ServerSend(JSONUtil.login(null, 0));
                }
                break;
        }
        if(serverSend != null) {
            new Thread(serverSend).start();
        }
    }

    private void closeSocket(){
        if (s != null) {
            SocketThread.socketList.remove(s);
            try {
                System.out.println(s + " is close");
                br.close();
                s.close();
                s = null;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //  发送至client
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