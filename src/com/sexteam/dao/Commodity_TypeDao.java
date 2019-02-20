package com.sexteam.dao;

import com.sexteam.vo.Commodity_Type;

import java.sql.SQLException;
import java.util.List;

public interface Commodity_TypeDao {
    //查询所有的类型
    List<Commodity_Type> getAllCommodity_Type() ;

    Commodity_Type getTypeBytype_id(int type_id);
}
