package com.sexteam.service;

import com.sexteam.vo.Car;

import java.util.List;

public interface CarService {
    boolean addToCar(Car hero_orders);

    List<Car> getAllCars(int c_id);

    boolean updateCarForCountByCid(int i, int i1);

    Car getCarByCid(int i);

    int getCarCountByU_id(int u_id);

}
