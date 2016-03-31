package com.xiaotao.user.dao;

import com.xiaotao.mybatis.MyBatisScan;
import com.xiaotao.student.model.Student;
import com.xiaotao.user.model.User;

/**
 * Created by tao on 16-2-28.
 */
@MyBatisScan
public interface UserDao {

    User adminLogin(User user);

}
