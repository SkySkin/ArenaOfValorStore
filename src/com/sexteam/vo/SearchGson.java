package com.sexteam.vo;

public class SearchGson {
    private String name;
    private String type;
    private String sign;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    @Override
    public String toString() {
        return "SearchGson{" +
                "name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", sign='" + sign + '\'' +
                '}';
    }
}
