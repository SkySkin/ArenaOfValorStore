package com.sexteam.vo;

public class User {
    private int u_id;
    private String u_name;
    private String u_pwd;
    private String u_sex;
    private String u_phone;
    private String u_adds;
    private String u_emall;
    private String u_imag;
    private int carcount;


    @Override
    public String toString() {
        return "User{" +
                "u_id=" + u_id +
                ", u_name='" + u_name + '\'' +
                ", u_pwd='" + u_pwd + '\'' +
                ", u_sex='" + u_sex + '\'' +
                ", u_phone='" + u_phone + '\'' +
                ", u_adds='" + u_adds + '\'' +
                ", u_emall='" + u_emall + '\'' +
                ", u_imag='" + u_imag + '\'' +
                ", carcount=" + carcount +
                '}';
    }

    public int getCarcount() {
        return carcount;
    }

    public void setCarcount(int carcount) {
        this.carcount = carcount;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_pwd() {
        return u_pwd;
    }

    public void setU_pwd(String u_pwd) {
        this.u_pwd = u_pwd;
    }

    public String getU_sex() {
        return u_sex;
    }

    public void setU_sex(String u_sex) {
        this.u_sex = u_sex;
    }

    public String getU_phone() {
        return u_phone;
    }

    public void setU_phone(String u_phone) {
        this.u_phone = u_phone;
    }

    public String getU_adds() {
        return u_adds;
    }

    public void setU_adds(String u_adds) {
        this.u_adds = u_adds;
    }

    public String getU_emall() {
        return u_emall;
    }

    public void setU_emall(String u_emall) {
        this.u_emall = u_emall;
    }

    public String getU_imag() {
        return u_imag;
    }

    public void setU_imag(String u_imag) {
        this.u_imag = u_imag;
    }
    public void setUb(String key,String value) {
        if (key.equals("u_name")) {
            this.u_name = value;
        }
        if (key.equals("u_pwd")) {
            this.u_pwd = value;
        }
        if (key.equals("u_sex")) {
            this.u_sex = value;
        }
        if (key.equals("u_phone")) {
            this.u_phone = value;
        }
        if (key.equals("u_adds")) {
            this.u_adds = value;
        }
        if (key.equals("u_emall")) {
            this.u_emall = value;
        }
        if (key.equals("u_imag")) {
            this.u_imag = value;
        }
    }

}
