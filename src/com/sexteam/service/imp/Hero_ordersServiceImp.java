package com.sexteam.service.imp;

import com.sexteam.dao.Hero_ordersDao;
import com.sexteam.dao.imp.Hero_ordersDaoImp;
import com.sexteam.service.Hero_ordersService;
import com.sexteam.vo.Hero_OrdersAll;
import com.sexteam.vo.Hero_orders;

import java.util.List;

public class Hero_ordersServiceImp implements Hero_ordersService {
    private Hero_ordersDao hero_ordersDao;
    @Override
    public boolean addOrder(Hero_orders hero_orders) {
        hero_ordersDao = new Hero_ordersDaoImp();
        boolean b = hero_ordersDao.addOrder(hero_orders);
        return b;
    }

    @Override
    public Hero_orders selectNewOrderByUid(Integer attribute) {
        hero_ordersDao = new Hero_ordersDaoImp();
        Hero_orders hero_orders = hero_ordersDao.selectNewOrderByUid(attribute);
        return hero_orders;
    }

    @Override
    public boolean updateOrderIsPay(Integer o_id) {
        hero_ordersDao = new Hero_ordersDaoImp();
        boolean b=hero_ordersDao.updateOrderIsPay(o_id);
        return b;
    }


    @Override
    public List<Hero_OrdersAll> getAllOrders(int c_id) {
        hero_ordersDao = new Hero_ordersDaoImp();
        List<Hero_OrdersAll> list= hero_ordersDao.getAllOrders(c_id);
        return list;
    }

    @Override
    public Hero_OrdersAll selectOrderByoid(int id) {
        hero_ordersDao = new Hero_ordersDaoImp();
        Hero_OrdersAll hero_ordersAll= hero_ordersDao.selectOrderByoid(id);
        return hero_ordersAll;
    }
}
