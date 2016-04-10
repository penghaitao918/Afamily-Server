package com.xiaotao.student.service.impl;

import com.xiaotao.student.dao.StudentDao;
import com.xiaotao.student.model.OnLine;
import com.xiaotao.student.model.Student;
import com.xiaotao.student.service.StudentService;
import com.xiaotao.user.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.Socket;

/**
 * Created by tao on 16-2-28.
 */
@Service("studentService")
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public int register(Student user) {
        return studentDao.register(user);
    }

    @Override
    public Student login(Student user, Socket socket) {
        Student student = studentDao.login(user);
        if (student != null && student.getPassword().equals(user.getPassword())){
            OnLine onLine = new OnLine(socket ,student.getStudentId());
            studentDao.online_in(onLine);
            return student;
        } else {
            return null;
        }
    }

    @Override
    public void logout(int port) {
        studentDao.online_out(port);
    }


}
