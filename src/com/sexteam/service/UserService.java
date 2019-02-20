package com.sexteam.service;


import com.sexteam.vo.User;

import java.sql.SQLException;

/**
 * 用户的业务接口
 */

public interface UserService {

    User userLogin(User user) throws SQLException;//用户的登录
    boolean userRegister(User user) throws SQLException;//用户的注册


}
