package com.xiaotao.task.model;

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
 * @date 2016-04-13  14:33
 */
public class TaskInfo {

    private int taskId = -1;
    private String taskName = null;

    private String[] task = null;

    private String task1 = null;
    private String task2 = null;
    private String task3 = null;
    private String task4 = null;
    private String task5 = null;
    private String task6 = null;
    private String task7 = null;
    private String task8 = null;
    private String task9 = null;
    private String task10 = null;

    public TaskInfo() {}

    //  WEB 端发布任务
    public TaskInfo(int id, String name) {
        this.taskId = id;
        this.taskName = name;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTask1() {
        return task1;
    }

    public void setTask1(String task1) {
        this.task1 = task1;
    }

    public String getTask2() {
        return task2;
    }

    public void setTask2(String task2) {
        this.task2 = task2;
    }

    public String getTask3() {
        return task3;
    }

    public void setTask3(String task3) {
        this.task3 = task3;
    }

    public String getTask4() {
        return task4;
    }

    public void setTask4(String task4) {
        this.task4 = task4;
    }

    public String getTask5() {
        return task5;
    }

    public void setTask5(String task5) {
        this.task5 = task5;
    }

    public String getTask6() {
        return task6;
    }

    public void setTask6(String task6) {
        this.task6 = task6;
    }

    public String getTask7() {
        return task7;
    }

    public void setTask7(String task7) {
        this.task7 = task7;
    }

    public String getTask8() {
        return task8;
    }

    public void setTask8(String task8) {
        this.task8 = task8;
    }

    public String getTask9() {
        return task9;
    }

    public void setTask9(String task9) {
        this.task9 = task9;
    }

    public String getTask10() {
        return task10;
    }

    public void setTask10(String task10) {
        this.task10 = task10;
    }

    public String[] getTask() {
        return task;
    }

    public void setTask(String[] task) {
        this.task = task;
    }

    //  info
    public static final class info {
        public static final String taskId = "TASK_ID";
        public static final String taskName = "TASK_NAME";
    }
}
