package com.xiaotao.student.model;

import com.genghis.steed.mybatis.model.PageBase;
import org.json.JSONException;
import org.json.JSONObject;

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
 * @date 2016-04-13  14:31
 */
public class StudentTask extends PageBase {

    private int id = -1;

    private int taskId = -1;
    private String account = null;

    private boolean task0 = false;
    private boolean task1 = false;
    private boolean task2 = false;
    private boolean task3 = false;
    private boolean task4 = false;
    private boolean task5 = false;
    private boolean task6 = false;
    private boolean task7 = false;
    private boolean task8 = false;
    private boolean task9 = false;

    public StudentTask() {}
    public StudentTask(JSONObject jsonObject, int type) {
       switch (type) {
           case 0:
               getTaskInfo(jsonObject);
               break;
           case 1:
               submitTask(jsonObject);
               break;
       }
    }

    private void getTaskInfo(JSONObject jsonObject) {
        try {
            this.account = jsonObject.getString(info.account);
        }catch (JSONException e){
            e.printStackTrace();
        }
    }

    private void submitTask(JSONObject jsonObject) {
        try {
            this.account = jsonObject.getString(info.account);
            this.taskId = jsonObject.getInt(info.taskId);
        }catch (JSONException e){
            e.printStackTrace();
        }
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    //  info
    public static final class info {
        public static final String taskId = "TASK_ID";
        public static final String account = "USER_ACCOUNT";
        public static final String task0 = "TASK_A";
        public static final String task1 = "TASK_B";
        public static final String task2 = "TASK_C";
        public static final String task3 = "TASK_D";
        public static final String task4 = "TASK_E";
        public static final String task5 = "TASK_F";
        public static final String task6 = "TASK_G";
        public static final String task7 = "TASK_H";
        public static final String task8 = "TASK_I";
        public static final String task9 = "TASK_J";
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public boolean isTask0() {
        return task0;
    }

    public void setTask0(boolean task0) {
        this.task0 = task0;
    }

    public boolean isTask1() {
        return task1;
    }

    public void setTask1(boolean task1) {
        this.task1 = task1;
    }

    public boolean isTask2() {
        return task2;
    }

    public void setTask2(boolean task2) {
        this.task2 = task2;
    }

    public boolean isTask3() {
        return task3;
    }

    public void setTask3(boolean task3) {
        this.task3 = task3;
    }

    public boolean isTask4() {
        return task4;
    }

    public void setTask4(boolean task4) {
        this.task4 = task4;
    }

    public boolean isTask5() {
        return task5;
    }

    public void setTask5(boolean task5) {
        this.task5 = task5;
    }

    public boolean isTask6() {
        return task6;
    }

    public void setTask6(boolean task6) {
        this.task6 = task6;
    }

    public boolean isTask7() {
        return task7;
    }

    public void setTask7(boolean task7) {
        this.task7 = task7;
    }

    public boolean isTask8() {
        return task8;
    }

    public void setTask8(boolean task8) {
        this.task8 = task8;
    }

    public boolean isTask9() {
        return task9;
    }

    public void setTask9(boolean task9) {
        this.task9 = task9;
    }
}
