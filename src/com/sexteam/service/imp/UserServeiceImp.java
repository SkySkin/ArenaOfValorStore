package com.sexteam.service.imp;

import com.sexteam.dao.UserDao;
import com.sexteam.dao.imp.UserDaoImp;
import com.sexteam.service.UserService;
import com.sexteam.vo.User;

import java.sql.SQLException;

public class UserServeiceImp implements UserService {
    UserDao userDao =null;
    @Override
    public User userLogin(User user) throws SQLException {
        userDao = new UserDaoImp();
        User existsuser = userDao.getUserByNameAndPwd(user);
        return existsuser;
    }

    @Override
    public boolean userRegister(User user) throws SQLException {
        userDao=new UserDaoImp();
        boolean b = userDao.insUser(user);
        return b;
    }
}
