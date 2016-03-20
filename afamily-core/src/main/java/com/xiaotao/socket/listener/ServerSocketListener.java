package com.xiaotao.socket.listener;


import com.xiaotao.socket.SocketThread;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;

/**
 * Created by tao on 16-2-26.
 */
//@WebListener
public class ServerSocketListener implements ServletContextListener {

    private SocketThread socketThread = null;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext servletContext = servletContextEvent.getServletContext();
        String str=(String)servletContext.getAttribute("socketThreadIsRun");
        if (str == null && socketThread == null){
            servletContext.setAttribute("socketThreadIsRun", "true");
            socketThread = new SocketThread(null,servletContext);
            socketThread.start();   //  servlet上下文初始化时启动socket服务端线程
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        if(socketThread != null && !socketThread.isInterrupted())
        {
            socketThread.closeSocketServer();
            socketThread.interrupt();
        }
    }

}
