package com.xiaotao.student.service;

import com.xiaotao.student.model.Student;
import com.xiaotao.student.model.StudentTask;
import org.apache.ibatis.annotations.Param;

import java.net.Socket;

/**
 * Created by tao on 16-2-28.
 */
public interface StudentService {

    Student login(Student user, Socket socket);

    int register(Student user);

    void logout(int port);

    StudentTask getStudentTaskInfo(@Param("account") String account);
}
