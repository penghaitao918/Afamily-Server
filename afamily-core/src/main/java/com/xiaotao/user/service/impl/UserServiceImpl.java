package com.xiaotao.user.service.impl;

import com.xiaotao.user.dao.UserDao;
import com.xiaotao.user.model.User;
import com.xiaotao.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by tao on 16-2-28.
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User adminLogin(User user) {
        return userDao.adminLogin(user);
    }

    @Override
    public User studentLogin(User user) {
        System.out.println("### " + user.getLoginId());
        return userDao.studentLogin(user);
    }

}
