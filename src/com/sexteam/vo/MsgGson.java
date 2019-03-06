package com.sexteam.vo;

import java.util.ArrayList;
import java.util.List;

public class MsgGson<T> {
    private List<T> msg=new ArrayList<>();
    private List<String> s=new ArrayList<>();

    public List<T> getMsg() {
        return msg;
    }

    public void setMsg(List<T> msg) {
        this.msg = msg;
    }

    public List<String> getS() {
        return s;
    }

    public void setS(List<String> s) {
        this.s = s;
    }

    @Override
    public String toString() {
        return "MsgGson{" +
                "msg=" + msg +
                ", s=" + s +
                '}';
    }
}
