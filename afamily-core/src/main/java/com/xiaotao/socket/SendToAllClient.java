package com.xiaotao.socket;

import com.xiaotao.util.JSONUtil;

import java.io.OutputStream;
import java.net.Socket;
import java.net.SocketException;
import java.util.Iterator;

/**
 * ━━━━━━神兽出没━━━━━━
 * 　　　┏┓　　　┏┓
 * 　　┏┛┻━━━┛┻┓
 * 　　┃　　　　　　　┃
 * 　　┃　　　━　　　┃
 * 　　┃　┳┛　┗┳　┃
 * 　　┃　　　　　　　┃
 * 　　┃　　　┻　　　┃
 * 　　┃　　　　　　　┃
 * 　　┗━┓　　　┏━┛Code is far away from bug with the animal protecting
 * 　　　　┃　　　┃    神兽保佑,代码无bug
 * 　　　　┃　　　┃
 * 　　　　┃　　　┗━━━┓
 * 　　　　┃　　　　　　　┣┓
 * 　　　　┃　　　　　　　┏┛
 * 　　　　┗┓┓┏━┳┓┏┛
 * 　　　　　┃┫┫　┃┫┫
 * 　　　　　┗┻┛　┗┻┛
 * <p/>
 * ━━━━━━感觉萌萌哒━━━━━━
 *
 * 发送给所有client
 * @author xiaoTao
 * @date 2016-03-03  22:52
 */
public class SendToAllClient {
    // 遍历socketList中的每个Socket，
    // 将读到的内容向每个Socket发送一次

   private void checkSocket(){
       new Thread(new Runnable() {
           @Override
           public void run() {
               try {
                   for (Iterator<Socket> iterator = SocketThread.socketList.iterator(); iterator.hasNext();){
                       Socket socket = iterator.next();
                       OutputStream outputStream = socket.getOutputStream();
                       outputStream.write((JSONUtil.connectCheck() + "\r\n").getBytes("utf-8"));
                   }
               }catch (Exception e){
                   e.printStackTrace();
               }
           }
       }).start();
   }

}
