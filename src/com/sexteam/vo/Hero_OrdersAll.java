package com.sexteam.vo;

public class Hero_OrdersAll {
    private int o_id;//订单id
    private Hero_Commodity hero_commodity;//商品id
    private String o_shippingaddress;//收货地址
    private int u_id;//购买人
    private int buycount;//购买数量
    private String hero_skin;//英雄皮肤
    private String orderstate;//订单状态
    private String createtime;

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public int getO_id() {
        return o_id;
    }

    public void setO_id(int o_id) {
        this.o_id = o_id;
    }

    public Hero_Commodity getHero_commodity() {
        return hero_commodity;
    }

    public void setHero_commodity(Hero_Commodity hero_commodity) {
        this.hero_commodity = hero_commodity;
    }

    public String getO_shippingaddress() {
        return o_shippingaddress;
    }

    public void setO_shippingaddress(String o_shippingaddress) {
        this.o_shippingaddress = o_shippingaddress;
    }


    public int getBuycount() {
        return buycount;
    }

    public void setBuycount(int buycount) {
        this.buycount = buycount;
    }

    public String getHero_skin() {
        return hero_skin;
    }

    public void setHero_skin(String hero_skin) {
        this.hero_skin = hero_skin;
    }

    public String getOrderstate() {
        return orderstate;
    }

    public void setOrderstate(String orderstate) {
        this.orderstate = orderstate;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    @Override
    public String toString() {
        return "Hero_OrdersAll{" +
                "o_id=" + o_id +
                ", hero_commodity=" + hero_commodity +
                ", o_shippingaddress='" + o_shippingaddress + '\'' +
                ", u_id=" + u_id +
                ", buycount=" + buycount +
                ", hero_skin='" + hero_skin + '\'' +
                ", orderstate='" + orderstate + '\'' +
                ", createtime='" + createtime + '\'' +
                '}';
    }
}
