package com.xiaotao.student.dao;

import com.xiaotao.mybatis.MyBatisScan;
import com.xiaotao.student.model.OnLine;
import com.xiaotao.student.model.Student;
import com.xiaotao.student.model.StudentTask;
import com.xiaotao.task.model.TaskInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by acmer on 2016/3/31.
 */
@MyBatisScan
public interface StudentDao {

    Student login(Student user);

    int register(Student user);

    void online_in(OnLine onLine);

    void online_out(int port);

    StudentTask getStudentTaskInfo(@Param("account") String account);

    void submitTask0(StudentTask task);
    void submitTask1(StudentTask task);
    void submitTask2(StudentTask task);
    void submitTask3(StudentTask task);
    void submitTask4(StudentTask task);
    void submitTask5(StudentTask task);
    void submitTask6(StudentTask task);
    void submitTask7(StudentTask task);
    void submitTask8(StudentTask task);
    void submitTask9(StudentTask task);

    List<StudentTask> getAllStudentTaskInfoList();

}
