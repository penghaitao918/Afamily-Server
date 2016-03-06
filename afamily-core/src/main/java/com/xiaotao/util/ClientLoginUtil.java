package com.xiaotao.util;

import com.xiaotao.socket.OperatorSocketData;
import com.xiaotao.socket.SocketThread;
import com.xiaotao.socket.model.SocketInfo;

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
 * @date 2016-03-04  23:15
 */
public class ClientLoginUtil {

//    public ClientLoginUtil(){ }

    public static void isOnLine(String account){
        try {
            for (Iterator<SocketInfo> iterator = OperatorSocketData.socketInfoArrayList.iterator(); iterator.hasNext();){
                SocketInfo socketInfo = iterator.next();
                //  查找账号是否在线
                if (socketInfo.getClientAccount().equals(account)){

                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
