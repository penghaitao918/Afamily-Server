package com.xiaotao.student.service;

import com.xiaotao.student.model.CheckIn;
import com.xiaotao.student.model.Student;
import com.xiaotao.student.model.StudentTask;
import org.apache.ibatis.annotations.Param;

import java.net.Socket;
import java.util.List;

/**
 * Created by tao on 16-2-28.
 */
public interface StudentService {

    Student login(Student user, Socket socket);

    int check(CheckIn checkIn);

    List<CheckIn> getAllCheckInfoList();

    void logout(@Param("port") int port);

    int register(Student user);

    StudentTask getStudentTaskInfo(@Param("account") String account);

    void submitTask(StudentTask task);

    List<StudentTask> getAllStudentTaskInfoList();

    void updateUserSex(Student student);
    void updateUserPortrait(Student student);
}
