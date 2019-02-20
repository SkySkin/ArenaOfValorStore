package com.sexteam.dao;

import com.sexteam.vo.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDao {
    //查询所有用户信息
    List<User> showAll();
    //查询一个用户信息
    User oneUser(Integer id);
    //根据用户名和密码查询
    User getUserByNameAndPwd(User user) throws SQLException;
    //修改用户信息
    int upUser(User User);
    //删除用户信息
    int deUser(User User);
    //插入用户信息
    boolean insUser(User user) throws SQLException;
}
