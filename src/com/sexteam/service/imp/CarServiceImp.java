package com.sexteam.service.imp;

import com.sexteam.dao.CarDao;
import com.sexteam.dao.imp.CarDaoImp;
import com.sexteam.service.CarService;
import com.sexteam.vo.Car;

import java.util.List;

public class CarServiceImp implements CarService {
    private CarDao carDao;
    @Override
    public boolean addToCar(Car hero_orders) {
        carDao = new CarDaoImp();
        boolean b= carDao.addToCar(hero_orders);
        return b;
    }

    @Override
    public List<Car> getAllCars(int c_id) {
        carDao = new CarDaoImp();
        List<Car> list =carDao.getAllCars(c_id);
        return list;
    }

    @Override
    public boolean updateCarForCountByCid(int i, int i1) {
        carDao = new CarDaoImp();
        boolean b=carDao.updateCarForCountByCid(i,i1);
        return b;
    }

    @Override
    public Car getCarByCid(int i) {
        carDao= new CarDaoImp();
        Car car= carDao.getCarByCid(i);
        return car;
    }

    @Override
    public int getCarCountByU_id(int u_id) {
        carDao = new CarDaoImp();
        int i=carDao.getCarCountByU_id(u_id);
        return i;
    }

    @Override
    public boolean delCarByCarid(int i) {
        carDao = new CarDaoImp();
        boolean b =carDao.delCarByCarid(i);
        return b;
    }
}
