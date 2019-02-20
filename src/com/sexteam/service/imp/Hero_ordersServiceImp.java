package com.sexteam.service.imp;

import com.sexteam.dao.Hero_ordersDao;
import com.sexteam.dao.imp.Hero_ordersDaoImp;
import com.sexteam.service.Hero_ordersService;
import com.sexteam.vo.Hero_orders;

public class Hero_ordersServiceImp implements Hero_ordersService {
    private Hero_ordersDao hero_ordersDao;
    @Override
    public boolean addOrder(Hero_orders hero_orders) {
        hero_ordersDao = new Hero_ordersDaoImp();
        boolean b = hero_ordersDao.addOrder(hero_orders);
        return b;
    }
}
