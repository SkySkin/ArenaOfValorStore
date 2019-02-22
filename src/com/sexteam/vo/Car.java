package com.sexteam.vo;

public class Car {
    private int  car_id;
    private Hero_Commodity hero_commodity;
    private int u_id;
    private int buycount;
    private String hero_skin;//英雄皮肤p
    private String createtime;

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getHero_skin() {
        return hero_skin;
    }

    public void setHero_skin(String hero_skin) {
        this.hero_skin = hero_skin;
    }

    public int getCar_id() {
        return car_id;
    }

    public void setCar_id(int car_id) {
        this.car_id = car_id;
    }

    public Hero_Commodity getHero_commodity() {
        return hero_commodity;
    }

    public void setHero_commodity(Hero_Commodity hero_commodity) {
        this.hero_commodity = hero_commodity;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public int getBuycount() {
        return buycount;
    }

    public void setBuycount(int buycount) {
        this.buycount = buycount;
    }

    @Override
    public String toString() {
        return "Car{" +
                "car_id=" + car_id +
                ", hero_commodity=" + hero_commodity +
                ", u_id=" + u_id +
                ", buycount=" + buycount +
                ", hero_skin='" + hero_skin + '\'' +
                ", createtime='" + createtime + '\'' +
                '}';
    }
}
