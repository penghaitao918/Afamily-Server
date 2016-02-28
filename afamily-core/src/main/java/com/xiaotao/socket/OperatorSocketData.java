package com.xiaotao.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.net.SocketException;
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

    public OperatorSocketData(Socket s) throws IOException {
        this.s = s;
        // 初始化该Socket对应的输入流
        br = new BufferedReader(new InputStreamReader(s.getInputStream() , "utf-8"));
    }

    public void run()
    {
        try
        {
            String content = null;
            // 采用循环不断从Socket中读取客户端发送过来的数据
            while ((content = readFromClient()) != null)
            {
                System.out.println("客户端--->服务器：  " + content);
                System.out.println("--A-" + Arrays.toString(content.getBytes("utf-8")));

                //  TODO:实现客户端与服务器的一对一交流，暂未实现客户端之间的交流
                // 遍历socketList中的每个Socket，
                // 将读到的内容向每个Socket发送一次
                //           for (Iterator<Socket> it = WebServer.socketList.iterator(); it.hasNext(); )
                //           {
                //               Socket s = it.next();
                try{

                    OutputStream os = s.getOutputStream();
                    os.write((content + "\r\n").getBytes("utf-8"));
                    System.out.println("服务器--->客户端：  content + --C-- " + content);
                }
                catch(SocketException e)
                {
                    e.printStackTrace();
                    // 删除该Socket。
                    //            it.remove();
                    s.close();
                    System.out.println(SocketThread.socketList);
                }
                //           }
            }
        }
        catch (IOException e)
        {
            e.printStackTrace();
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
}