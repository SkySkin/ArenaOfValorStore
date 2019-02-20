package com.sexteam.vo;

import java.util.ArrayList;
import java.util.List;

public class Commodity_Type {
    private int type_id;
    private String type_name;
    private List<Hero_Commodity> commodityList;

    public List<Hero_Commodity> getCommodityList() {
        return commodityList;
    }

    public void setCommodityList(List<Hero_Commodity> commodityList) {
        this.commodityList = commodityList;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    @Override
    public String toString() {
        return "Commodity_Type{" +
                "type_id=" + type_id +
                ", type_name='" + type_name + '\'' +
                ", commodityList=" + commodityList +
                '}';
    }
}
