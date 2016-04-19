package com.xiaotao.socket.service.impl;

import com.xiaotao.socket.SocketThread;
import com.xiaotao.socket.service.ClientService;
import com.xiaotao.util.JSONUtil;
import org.springframework.stereotype.Service;

import java.io.OutputStream;
import java.net.Socket;
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
 * @author xiaoTao
 * @date 2016-04-19  12:41
 */

@Service("clientService")
public class ClientServiceImpl implements ClientService {
    @Override
    public boolean sendNotificationToAllUser(String title, String message) {
        for (Iterator<Socket> it = SocketThread.socketList.iterator(); it.hasNext(); ) {
            Socket s = it.next();
            try {
                OutputStream os = s.getOutputStream();
                os.write((JSONUtil.sendNotificationToAllUser(title, message) + "\r\n").getBytes("utf-8"));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return true;
    }
}
