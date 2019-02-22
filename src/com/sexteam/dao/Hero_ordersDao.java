package com.sexteam.dao;

import com.sexteam.vo.Hero_OrdersAll;
import com.sexteam.vo.Hero_orders;

import java.util.List;

public interface Hero_ordersDao {
    boolean addOrder(Hero_orders hero_orders);

    Hero_orders selectNewOrderByUid(Integer attribute);

    boolean updateOrderIsPay(Integer o_id);

    List<Hero_OrdersAll> getAllOrders(int c_id);

    Hero_OrdersAll selectOrderByoid(int id);
}
