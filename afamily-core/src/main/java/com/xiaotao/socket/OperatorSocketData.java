package com.xiaotao.socket;

import com.xiaotao.feedback.model.Feedback;
import com.xiaotao.feedback.service.FeedbackService;
import com.xiaotao.student.model.OnLine;
import com.xiaotao.student.model.Student;
import com.xiaotao.student.model.StudentTask;
import com.xiaotao.student.service.StudentService;
import com.xiaotao.task.model.TaskInfo;
import com.xiaotao.task.service.TaskInfoService;
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
import java.net.SocketException;
import java.util.Iterator;
import java.util.List;

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
    @Autowired
    private TaskInfoService taskInfoService = (TaskInfoService) SpringUtil.getBean("taskInfoService");
    @Autowired
    private FeedbackService feedbackService = (FeedbackService) SpringUtil.getBean("feedbackService");

    //  定义处理用户请求的方法
    private void dealWithUserRequest(int type, JSONObject jsonObject) throws JSONException {
        ServerSend serverSend = null;
        switch (type){
            case JSONUtil.check:
                check(jsonObject);
                break;
            case JSONUtil.login:
                login(jsonObject, 1);
                break;
            case JSONUtil.reLogin:
                login(jsonObject,0);
                break;
            case JSONUtil.logout:
                studentService.logout(s.getPort());
                closeSocket();
                break;
            case JSONUtil.taskList:
                getAllTaskInfoList();
                break;
            case JSONUtil.studentTaskList:
                getStudentTaskInfo(jsonObject);
                break;
            case JSONUtil.submitTask:
                submitTask(jsonObject);
                break;
            case JSONUtil.sendConversationMessage:
                sendConversationMessageToAllClient(jsonObject);
                break;
            case JSONUtil.feedback:
                feedback(jsonObject);
                break;
            case JSONUtil.updateUserInfo:
                updateUserInfo(jsonObject);
                break;
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

/*
 ***************************************************************
 ***************** 服务器数据请求实现 **************************
 ***************************************************************
 */

    private void check(JSONObject jsonObject) {
        OnLine onLine = new OnLine(jsonObject, s);
        studentService.check(onLine);
        if (onLine.getId() > 0) {
            ServerSend send = new ServerSend(JSONUtil.Check());
            new Thread(send).start();
        }
    }


    private void login(JSONObject jsonObject, int type) {
        ServerSend send = null;
        Student client = new Student(jsonObject);
        Student server = studentService.login(client, s);
        if (server != null){
            //  TODO 先判断是否在线 未实现
            send = new ServerSend(JSONUtil.login(server, type));
        }else {
            send = new ServerSend(JSONUtil.login(null, type));
        }
        new Thread(send).start();
    }

    private void getAllTaskInfoList() {
        List<TaskInfo> list = taskInfoService.getAllTaskInfoList();
        ServerSend send = new ServerSend(JSONUtil.getAllTaskInfoList(list));
        new Thread(send).start();
    }

    private void getStudentTaskInfo(JSONObject jsonObject) {
        getAllTaskInfoList();
        StudentTask studentAccount = new StudentTask(jsonObject, 0);
        StudentTask task = studentService.getStudentTaskInfo(studentAccount.getAccount());
        ServerSend send = new ServerSend(JSONUtil.getStudentTaskInfo(task));
        new Thread(send).start();
    }

    private void submitTask(JSONObject jsonObject) {
        StudentTask task = new StudentTask(jsonObject, 1);
        studentService.submitTask(task);
    }

    private void sendConversationMessageToAllClient(final JSONObject jsonObject) {
        try {
            for (Iterator<Socket> it = SocketThread.socketList.iterator(); it.hasNext(); )
            {
                Socket s = it.next();
                try{
                    OutputStream os = s.getOutputStream();
                    os.write((jsonObject + "\r\n").getBytes("utf-8"));
                }
                catch(SocketException e)
                {
                    e.printStackTrace();
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private void feedback(JSONObject jsonObject) {
        Feedback feedback = new Feedback(jsonObject);
        feedbackService.insert(feedback);
        if (feedback.getId() > 0) {
            ServerSend send = new ServerSend(JSONUtil.feedback());
            new Thread(send).start();
        }
    }

    private void updateUserInfo(JSONObject jsonObject) {
        int type = -1;
        Student student = new Student();
        try {
            type = jsonObject.getInt(Student.updateUserInfo.updateType);
            student.setStudentId(jsonObject.getString(Student.info.account));
            switch (type) {
                case Student.updateUserInfo.updateSex:
                    student.setSex(jsonObject.getString(Student.updateUserInfo.updateBody));
                    studentService.updateUserSex(student);
                    break;
            }
            ServerSend send = new ServerSend(JSONUtil.updateUserInfo(type));
            new Thread(send).start();
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

}