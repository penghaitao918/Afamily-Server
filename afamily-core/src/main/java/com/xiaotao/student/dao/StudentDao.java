package com.xiaotao.student.dao;

import com.xiaotao.mybatis.MyBatisScan;
import com.xiaotao.student.model.Student;

/**
 * Created by acmer on 2016/3/31.
 */
@MyBatisScan
public interface StudentDao {

    Student studentLogin(Student user);

}
