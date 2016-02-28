package com.xiaotao.socket;


import com.xiaotao.socket.model.SocketInfo;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Map;

/**
 * Created by tao on 16-2-26.
 * 自定义一个Socket线程类继承自线程类，重写run()方法，用于接收客户端socket请求报文
 */
public class SocketThread extends Thread {

    // 定义保存所有Socket的ArrayList
    public static ArrayList<Socket> socketList = new ArrayList<Socket>();
    // 保存socketList中每个socket的信息
    public static ArrayList<SocketInfo> socketInfo = new ArrayList<SocketInfo>();

    private ServerSocket serverSocket = null;
    private ServletContext servletContext = null;


    public SocketThread(ServerSocket serverSocket,ServletContext servletContext)
    {
        if(serverSocket == null)
        {
            try {
                this.serverSocket = new ServerSocket(30000);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        this.servletContext = servletContext;
    }


    @Override
    public void run()
    {
        while(!this.isInterrupted())
        {
            try {
                // 此行代码会阻塞，将一直等待别人的连接
                Socket socket = serverSocket.accept();
/*                SocketInfo socketInfo1 = new SocketInfo(socket.getPort(),socket.getInetAddress());*/
                //  客户端地址
                System.out.println("###getInetAddress # " + socket.getInetAddress());
                //  客户端端口
                System.out.println("###getPort # " + socket.getPort());

                socketList.add(socket);
                System.out.println("###连接成功");
                if(socket != null)
                {
                    // 每当客户端连接后启动一条ServerThread线程为该客户端服务
                    new Thread(new OperatorSocketData(socket)).start();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void closeSocketServer()
    {
        try {
            if(serverSocket != null && !serverSocket.isClosed())
            {
                serverSocket.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}