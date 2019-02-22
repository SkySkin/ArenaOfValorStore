package com.sexteam.dao.imp;

import com.sexteam.dao.UserDao;
import com.sexteam.util.DBHelper;
import com.sexteam.vo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDaoImp implements UserDao {
    @Override
    public List<User> showAll() {
        return null;
    }

    @Override
    public User oneUser(Integer id) {
        User user=null;
        Connection conn = DBHelper.getConn();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM `user` where u_id="+id+"");
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                user=new User();
//                user.
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return null;
    }

    @Override
    public User getUserByNameAndPwd(User user) throws SQLException {
        Connection conn = DBHelper.getConn();
        PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM user WHERE u_name=? and u_pwd=?");
        preparedStatement.setString(1,user.getU_name());
        preparedStatement.setString(2,user.getU_pwd());
        ResultSet resultSet = preparedStatement.executeQuery();
        User existsuser = null;
        if(resultSet.next()){
            existsuser = new User();
            existsuser.setU_adds(resultSet.getString("u_adds"));
            existsuser.setU_emall(resultSet.getString("u_emall"));
            existsuser.setU_id(resultSet.getInt("u_id"));
            existsuser.setU_imag(resultSet.getString("u_imag"));
            existsuser.setU_name(resultSet.getString("u_name"));
            existsuser.setU_phone(resultSet.getString("u_phone"));
            existsuser.setU_pwd(resultSet.getString("u_pwd"));
            existsuser.setU_sex(resultSet.getString("u_pwd"));
        }
        return existsuser;
    }

    @Override
    public int upUser(User User) {
        return 0;
    }

    @Override
    public int deUser(User User) {
        return 0;
    }

    @Override
    public boolean insUser(User user) throws SQLException {
        boolean flag=false;
        Connection conn = DBHelper.getConn();
        PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO user(u_name,u_pwd,u_sex,u_phone,u_adds,u_emall,u_imag) VALUES(?,?,?,?,?,?,?)");
        preparedStatement.setString(1,user.getU_name());
        preparedStatement.setString(2,user.getU_pwd());
        preparedStatement.setString(3,user.getU_sex());
        preparedStatement.setString(4,user.getU_phone());
        preparedStatement.setString(5,user.getU_adds());
        preparedStatement.setString(6,user.getU_emall());
        preparedStatement.setString(7,user.getU_imag());
        int i = preparedStatement.executeUpdate();
        if(i==1){
            flag=true;
        }
        return flag;
    }
}
