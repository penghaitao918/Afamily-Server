package com.xiaotao.student.service.impl;

import com.xiaotao.student.dao.StudentDao;
import com.xiaotao.student.model.Student;
import com.xiaotao.student.service.StudentService;
import com.xiaotao.user.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by tao on 16-2-28.
 */
@Service("studentService")
public class StudentServiceImpl implements StudentService {

    @Autowired
    public StudentDao studentDao;

    @Override
    public Student studentLogin(Student user) {
        return studentDao.studentLogin(user);
    }

}
