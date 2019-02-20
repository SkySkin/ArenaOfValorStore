package com.sexteam.vo;

public class Hero_Commodity {
    private String c_id;
    private String c_name;
    private float c_proce;
    private int c_count;
    private String c_imag;
    private String c_place;
    private int type_id;
    private String c_describe;
    private int c_sales;

    @Override
    public String toString() {
        return "Hero_Commodity{" +
                "c_id='" + c_id + '\'' +
                ", c_name='" + c_name + '\'' +
                ", c_proce=" + c_proce +
                ", c_count=" + c_count +
                ", c_imag='" + c_imag + '\'' +
                ", c_place='" + c_place + '\'' +
                ", type_id=" + type_id +
                ", c_describe='" + c_describe + '\'' +
                ", c_sales=" + c_sales +
                '}';
    }

    public String getC_id() {
        return c_id;
    }

    public void setC_id(String c_id) {
        this.c_id = c_id;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public float getC_proce() {
        return c_proce;
    }

    public void setC_proce(float c_proce) {
        this.c_proce = c_proce;
    }

    public int getC_count() {
        return c_count;
    }

    public void setC_count(int c_count) {
        this.c_count = c_count;
    }

    public String getC_imag() {
        return c_imag;
    }

    public void setC_imag(String c_imag) {
        this.c_imag = c_imag;
    }

    public String getC_place() {
        return c_place;
    }

    public void setC_place(String c_place) {
        this.c_place = c_place;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getC_describe() {
        return c_describe;
    }

    public void setC_describe(String c_describe) {
        this.c_describe = c_describe;
    }

    public int getC_sales() {
        return c_sales;
    }

    public void setC_sales(int c_sales) {
        this.c_sales = c_sales;
    }
}
