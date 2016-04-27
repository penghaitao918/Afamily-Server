package com.xiaotao.student.service.impl;

import com.xiaotao.student.dao.StudentDao;
import com.xiaotao.student.model.OnLine;
import com.xiaotao.student.model.Student;
import com.xiaotao.student.model.StudentTask;
import com.xiaotao.student.service.StudentService;
import com.xiaotao.user.dao.UserDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.Socket;
import java.util.List;

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
        public int check(OnLine onLine) {
        //    OnLine onLine = new OnLine(socket ,student.getStudentId());
            return studentDao.check(onLine);
        }

    @Override
    public Student login(Student user, Socket socket) {
        Student student = studentDao.login(user);
        if (student != null && student.getPassword().equals(user.getPassword())){
            OnLine onLine = new OnLine(socket ,student.getStudentId());
            studentDao.logInWrite(onLine);
            return student;
        } else {
            return null;
        }
    }

    @Override
    public void logout(@Param("port") int port) {
        studentDao.logOutWrite(port);
    }

    @Override
    public StudentTask getStudentTaskInfo(@Param("account") String account) {
        return studentDao.getStudentTaskInfo(account);
    }

    @Override
    public void submitTask(StudentTask task) {
        switch (task.getTaskId()) {
            case 0: studentDao.submitTask0(task); break;
            case 1: studentDao.submitTask1(task); break;
            case 2: studentDao.submitTask2(task); break;
            case 3: studentDao.submitTask3(task); break;
            case 4: studentDao.submitTask4(task); break;
            case 5: studentDao.submitTask5(task); break;
            case 6: studentDao.submitTask6(task); break;
            case 7: studentDao.submitTask7(task); break;
            case 8: studentDao.submitTask8(task); break;
            case 9: studentDao.submitTask9(task); break;
        }
    }

    @Override
    public List<StudentTask> getAllStudentTaskInfoList() {
        return studentDao.getAllStudentTaskInfoList();
    }

    @Override
    public void updateUserSex(Student student) {
        studentDao.updateUserSex(student);
    }


}
